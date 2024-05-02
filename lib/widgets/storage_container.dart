import 'package:flutter/material.dart';
import 'package:gdrive_clone/utils.dart';

class StorageContainer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 15, right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade100,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.01),
              offset: const Offset(10,10),
              blurRadius: 10
          ),
          BoxShadow(
              color: Colors.grey.withOpacity(0.01),
              offset: const Offset(-10,10),
              blurRadius: 10
          )
        ]
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 25.0, bottom: 35),
        child: Column(
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 10
                  )
                ]
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("20", style:
                      textStyle(50, const Color(0xFF635C9B), FontWeight.bold),),
                      Text("%", style:
                      textStyle(17, const Color(0xFF635C9B), FontWeight.bold),),
                    ],
                  ),
                  Text(
                    "Used",
                    style: textStyle(20, textColor.withOpacity(0.7), FontWeight.bold),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.deepOrangeAccent,
                      ),
                    ),
                    const SizedBox(width: 18,),
                    Column(
                      children: [
                        Text("User", style: textStyle(18, textColor.withOpacity(0.7), FontWeight.w700),),
                        Text("50 GB", style: textStyle(20, const Color(0xFF635C9B), FontWeight.w600),)
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey.withOpacity(0.2),
                      ),
                    ),
                    const SizedBox(width: 18,),
                    Column(
                      children: [
                        Text("Left", style: textStyle(18, textColor.withOpacity(0.7), FontWeight.w700),),
                        Text("30 GB", style: textStyle(20, const Color(0xFF635C9B), FontWeight.w600),)
                      ],
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
