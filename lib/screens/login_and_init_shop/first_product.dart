import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../widgets/bt_skip_and_complate.dart';
import '../../widgets/bt_skip_and_continue.dart';

class FirstProduct extends StatelessWidget {
  const FirstProduct({super.key});

  // Tạo ra sản phẩm đầu tiên

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 20),
          margin: EdgeInsets.only(top: 60),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.85 - 60,
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
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 40,
                              child: const Text(
                                'Tuyệt vời giờ hãy tạo sản phầm đầu tiên của cửa hàng nhé!',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text('Tên sản phầm'),
                        const SizedBox(
                          height: 40,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Ví dụ : Mì Hảo Hảo',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text('Giá bán'),
                        const SizedBox(
                          height: 40,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: '0.000',
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text('Giá vốn'),
                        const SizedBox(
                          height: 40,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: '0.000',
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              BtSkipAndComplate()
            ],
          ),
        ),
      ),
    );
  }
}
