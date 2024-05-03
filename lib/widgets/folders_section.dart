import 'package:flutter/material.dart';
import 'package:gdrive_clone/utils.dart';

class FoldersSection extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
        itemCount: 4,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20
        ),
        itemBuilder: (context, index ) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade100,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.00001),
                offset: const Offset(10,10),
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
              Text("Photos", style: textStyle(18, textColor, FontWeight.bold),),
              Text("10 items", style: textStyle(14, Colors.grey.shade400, FontWeight.bold),)
            ],
          ),
        );
        });
  }
}
