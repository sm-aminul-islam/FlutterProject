import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:tictok_clone/constants.dart';
import 'package:tictok_clone/models/video.dart';
import 'package:video_compress/video_compress.dart';

class UploadVideoController extends GetxController {
  _compressVideo(String videopath) async {
    final compressedVideo = await VideoCompress.compressVideo(videopath,
        quality: VideoQuality.MediumQuality);
    return compressedVideo!.file;
  }

  Future<String> _uploadVideoStorage(String id, String videoPath) async {
    Reference ref = firebasestorage.ref().child("videos").child(id);
    UploadTask uploadTask = ref.putFile(await _compressVideo(videoPath));
    TaskSnapshot snap = await uploadTask;

    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  _getThumbnail(String videopath) async {
    final thumbnail = await VideoCompress.getFileThumbnail(videopath);
    return thumbnail;
  }

  Future<String> _uploadImageStorage(String id, String videopath) async {
    Reference ref = firebasestorage.ref().child("thumbnails").child(id);
    UploadTask uploadTask = ref.putFile(await _getThumbnail(videopath));
    TaskSnapshot snap = await uploadTask;

    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  //upload video
  uploadVideo(String songName, String caption, String videoPath) async {
    try {
      String uid = firebaseauth.currentUser!.uid;
      DocumentSnapshot userDoc =
          await firestore.collection("users").doc(uid).get();
      var allDocs = await firestore.collection("videos").get();
      int len = allDocs.docs.length;
      String videoUrl = await _uploadVideoStorage("video $len", videoPath);
      String thumbnail = await _uploadImageStorage("Video $len", videoPath);

      Video video = Video(
          username: (userDoc.data()! as Map<String, dynamic>)['name'],
          uid: uid,
          id: "Video $len",
          likes: [],
          commentCount: 0,
          shareCount: 0,
          songname: songName,
          caption: caption,
          videoUrl: videoUrl,
          thumbnail: thumbnail,
          profilePhoto:
              (userDoc.data()! as Map<String, dynamic>)['ProfilePhoto']);
      await firestore
          .collection("videos")
          .doc('video $len')
          .set(video.toJson());
      Get.back();
    } catch (e) {
      Get.snackbar('Error  Detecting in Uploading video', e.toString());
    }
  }
}
