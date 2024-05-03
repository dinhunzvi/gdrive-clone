import 'package:flutter/material.dart';
import 'package:gdrive_clone/utils.dart';

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
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 13.0),
                  child: SizedBox(
                    height: 65,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: const Image(
                            image: NetworkImage('https://www.bing.com/images/search?view=detailV2&ccid=8exT%2fDyG&id=AB0F4C7218F14AEF7B0EF43FEFC627A316AEBC50&thid=OIP.8exT_DyGNnZORDkSCAtxIAHaEo&mediaurl=https%3a%2f%2fth.bing.com%2fth%2fid%2fR.f1ec53fc3c8636764e443912080b7120%3frik%3dULyuFqMnxu8%252f9A%26riu%3dhttp%253a%252f%252f3.bp.blogspot.com%252f-bYY3rCu-J0M%252fUlkFdd1132I%252fAAAAAAAAGIA%252fzArtsC-EsQc%252fs1600%252fbeautiful_landscape_scenery-wide.jpg%26ehk%3dEDo0xVhRKriixX7%252bBSRvlI1%252f%252flrQAu3Fz7zhHVv9vX4%253d%26risl%3d%26pid%3dImgRaw%26r%3d0&exph=1000&expw=1600&q=scenery&simid=608013953590755402&FORM=IRPRST&ck=8697CDBF2744E7ADDCE344C2349CBF8E&selectedIndex=8&itb=0'),
                            width: 65,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 5,),
                        Text(
                          'Scenery',
                          style: textStyle(13, textColor, FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}
