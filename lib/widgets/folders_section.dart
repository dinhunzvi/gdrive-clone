import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gdrive_clone/controllers/files_screen_controller.dart';
import 'package:gdrive_clone/screens/files_screen.dart';
import 'package:gdrive_clone/utils.dart';
import 'package:get/get.dart';

class FoldersSection extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetX<FilesScreenController>(
        builder: (FilesScreenController foldersController) {
          if (foldersController != null &&
              foldersController.foldersList != null) {
            return GridView.builder(
              shrinkWrap: true,
              itemCount: foldersController.foldersList.length,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20
              ),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade100,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.00001),
                            offset: const Offset(10, 10),
                            blurRadius: 5
                        )
                      ]
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/folder.png',
                        width: 82,
                        height: 82,
                        fit: BoxFit.cover,
                      ),
                      Text(foldersController.foldersList[index].name,
                        style: textStyle(18, textColor, FontWeight.bold),),
                      StreamBuilder<QuerySnapshot>(
                        stream: userCollection.doc(FirebaseAuth.instance.currentUser!.uid)
                            .collection('files')
                            .where('folder', isEqualTo: foldersController.foldersList[index].name)
                          .snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return const CircularProgressIndicator();
                          }
                          return Text("${snapshot.data!.docs.length} items", style: textStyle(
                              14, Colors.grey.shade400, FontWeight.bold),);
                        }
                      )
                    ],
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
