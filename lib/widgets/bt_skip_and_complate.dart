import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BtSkipAndComplate extends StatelessWidget {
  const BtSkipAndComplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.41,
          height: 55,
          child: OutlinedButton(
            onPressed: () {},
            child: Text(
              'Bỏ qua',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.41,
          height: 55,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(primary: Colors.green),
            child: Text('Hoàn tất'),
          ),
        ),
      ]),
    );
  }
}
