import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gdrive_clone/models/file_model.dart';
import 'package:gdrive_clone/models/folder_model.dart';
import 'package:gdrive_clone/utils.dart';
import 'package:get/get.dart';

class FilesScreenController extends GetxController {
  String uid = FirebaseAuth.instance.currentUser!.uid;
  RxList<FolderModel> foldersList = <FolderModel>[].obs;
  RxList<FileModel> recentFileLists = <FileModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    recentFileLists.bindStream(
      userCollection.doc(uid).collection('files')
          .orderBy('dateUploaded', descending: true)
          .snapshots()
          .map((QuerySnapshot querySnapshot) {
        List<FileModel> files = [];
        querySnapshot.docs.forEach((element) {
          files.add(FileModel.fromDocumentSnapshop(element));
        });

        return files;
      })
    );

    foldersList.bindStream(
      userCollection.doc(uid).collection('folders')
          .orderBy('time', descending: true).snapshots().map((QuerySnapshot querySnapshot) {
        List<FolderModel> folders = [];
        querySnapshot.docs.forEach((element) { 
          FolderModel folderModel = FolderModel.fromDocumentSnapshot(element);
          folders.add(folderModel);
        });
        return folders;
      },)
    );
  }
}
