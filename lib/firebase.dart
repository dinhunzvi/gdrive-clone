import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:gdrive_clone/utils.dart';
import 'package:get/get.dart';
import 'package:mime/mime.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:video_compress/video_compress.dart';

class FirebaseService {

  Future<File> compressFile(File file, String fileType) async {
    Uuid uuid = const Uuid();
    if (fileType == "image") {
      Directory directory = await getTemporaryDirectory();
      String targetPath = "${directory.path}/${uuid.v4().substring(0,8)}.jpg";
      File? result = (await FlutterImageCompress.compressAndGetFile(
          file.path, targetPath, quality: 75)) as File?;
      return result!;
    } else if (fileType == "video") {
      MediaInfo? info = await VideoCompress.compressVideo(file.path,
          quality: VideoQuality.MediumQuality,
        deleteOrigin: false,
        includeAudio: true
      );

      return File(info!.path!);
    } else {
      return file;
    }
  }

  uploadFile(String folderName) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();

      for (File file in files) {
        // Get the file type
        String? fileType = lookupMimeType(file.path);
        String end = "/";
        int startIndex = 0;
        int endIndex = fileType!.indexOf(end);
        String filteredFileType = fileType.substring(startIndex, endIndex);

        // Filter filename and extension
        String fileName = file.path.split('/').last;
        String fileExtension = fileName.substring(fileName.indexOf(',') + 1);

        // Getting compressed file
        File compressedFile = await compressFile(file, filteredFileType);

        // Get length of files collection
        int length = await userCollection.doc(FirebaseAuth.instance.currentUser!.
          uid).collection('files')
          .get()
          .then((value) => value.docs.length);
        
        // upload file to firebase storage
        UploadTask uploadTask = FirebaseStorage.instance.ref().child('files')
          .child('File $length')
          .putFile(compressedFile);
        
        TaskSnapshot snapshot = await uploadTask.whenComplete(() => {});
        String fileUrl = await snapshot.ref.getDownloadURL();

        // saving data in Firebase document
        userCollection.doc(FirebaseAuth.instance.currentUser!.uid).collection('files')
          .add({
          "fileName": fileName,
          "fileUrl": fileUrl,
          "fileType": filteredFileType,
          "fileExtension": fileExtension,
          "folder": folderName,
          "size": (compressedFile.readAsBytesSync().lengthInBytes / 1024).round(),
          "dateUploaded": DateTime.now()
        });
      }

      if (folderName == '') {
        Get.back();
      }
    } else {
      print("Cancelled");
    }
  }
}