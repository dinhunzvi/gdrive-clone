import 'package:flutter/material.dart';
import 'package:gdrive_clone/widgets/storage_container.dart';

import '../widgets/upload_options.dart';

class StorageScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40,),
        StorageContainer(),
        UploadOptions()
      ],
    );
  }
}
