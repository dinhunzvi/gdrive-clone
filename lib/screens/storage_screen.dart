import 'package:flutter/material.dart';
import 'package:gdrive_clone/widgets/storage_container.dart';

import '../widgets/upload_options.dart';

class StorageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          StorageContainer(),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 18.0),
            child: UploadOptions(),
          )
        ],
      ),
    );
  }
}
