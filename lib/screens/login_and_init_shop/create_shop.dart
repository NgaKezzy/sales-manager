import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widgets/bt_skip_and_continue.dart';

class CreateShop extends StatelessWidget {
  const CreateShop({super.key});

  // màn tạo cửa hàng

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
                      ],
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 30, bottom: 25),
                      child: SvgPicture.asset('assets/svg/shop.svg',
                          color: Colors.green, height: 80),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Cửa hàng của bạn là gì?',
                              style: TextStyle(fontSize: 25),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Text(
                                'Nhập tên cửa hàng bạn đang kinh doanh',
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 35),
                              height: 45,
                              width: MediaQuery.of(context).size.width - 40,
                              child: TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: 'Ví dụ : Quán phở cô Ba',
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              BtSkipAndContinue()
            ],
          ),
        ),
      ),
    );
  }
}
