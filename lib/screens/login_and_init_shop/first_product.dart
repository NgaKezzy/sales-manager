import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class FirstProduct extends StatelessWidget {
  const FirstProduct({super.key});

  // Tạo ra sản phẩm đầu tiên

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.only(top: 60),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 4, left: 4),
                  height: 5,
                  width: MediaQuery.of(context).size.width * 0.2,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(3)),
                ),
                Container(
                  margin: EdgeInsets.only(right: 4, left: 4),
                  height: 5,
                  width: MediaQuery.of(context).size.width * 0.2,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(3)),
                ),
                Container(
                  margin: EdgeInsets.only(right: 4, left: 4),
                  height: 5,
                  width: MediaQuery.of(context).size.width * 0.2,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(3)),
                ),
                Container(
                  margin: EdgeInsets.only(right: 4, left: 4),
                  height: 5,
                  width: MediaQuery.of(context).size.width * 0.2,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(3)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
