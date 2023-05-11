import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../config/app_color.dart';

class ItemListProduct extends StatelessWidget {
  const ItemListProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      height: 130,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(children: [
        Container(
          alignment: AlignmentDirectional.bottomCenter,
          width: MediaQuery.of(context).size.width * 0.3,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10),
            ),
            color: Colors.green,
          ),
          child: Text(
            'Còn: 100',
            style: TextStyle(
                fontSize: 13,
                color: AppColors.white,
                fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width * 0.3,
          height: 60,
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.only(
          //     topRight: Radius.circular(10),
          //     topLeft: Radius.circular(10),
          //   ),
          // ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Loa ',
                  style: TextStyle(
                      fontSize: 13,
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis),
                ),
                Text(
                  '600.000',
                  style: TextStyle(
                      fontSize: 13,
                      color: AppColors.black,
                      fontWeight: FontWeight.w500),
                ),
              ]),
        )
      ]),
    );
  }
}
