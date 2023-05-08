import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';

class Product extends StatelessWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 65,
      width: MediaQuery.of(context).size.width - 40,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      child: Row(children: [
        SizedBox(
          width: 20,
        ),
        SvgPicture.asset(
          'assets/svg/food.svg',
          height: 30,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          'Đồ ăn',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        )
      ]),
    );
  }
}
