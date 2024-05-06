import 'package:flutter/material.dart';
import 'package:gdrive_clone/models/file_model.dart';
import 'package:gdrive_clone/utils.dart';
import 'package:get/get.dart';

import '../controllers/files_screen_controller.dart';

class RecentFiles extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
            child: Text(
              'Recent Files',
              style: textStyle(20, textColor, FontWeight.bold),)),
        const SizedBox(height: 15,),
        GetX<FilesScreenController>(
          builder: (FilesScreenController controller) {
            return SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                  itemCount: controller.recentFileLists.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 13.0),
                      child: SizedBox(
                        height: 65,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            controller.recentFileLists[index].fileType
                                == "image" ? ClipRRect(
                              borderRadius: BorderRadius.circular(18),
                              child: Image(
                                image: NetworkImage(
                                    controller.recentFileLists[index].url),
                                width: 65,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ) : Container(
                              height: 60,
                              width: 65,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 0.15
                                ),
                                borderRadius: BorderRadius.circular(14)
                              ),
                              child: Center(
                                child: Image(
                                  width: 42,
                                    height: 42,
                                    image: AssetImage(
                                      'assets/images/${controller.recentFileLists[index].fileExtension}.png'
                                    )),
                              ),
                            ),
                            const SizedBox(height: 5,),
                            Text(
                              controller.recentFileLists[index].name,
                              style: textStyle(13, textColor, FontWeight.w500),
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            );
          }
        )
      ],
    );
  }
}
