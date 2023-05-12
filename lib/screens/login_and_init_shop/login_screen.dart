import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sales_manager/config/app_color.dart';

import '../../config/app.font.dart';
import '../../config/app_size.dart';

class LongInScreen extends StatelessWidget {
  const LongInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.75,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/img/image.jpg"),
                    fit: BoxFit.cover),
              ),
              child: const Align(
                alignment: Alignment(0, 0.8),
                child: Text(
                  textAlign: TextAlign.center,
                  '"Ứng dụng miễn phí mà đầy đủ tính năng ghê luôn. Rất hài lòng"',
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: AppDimens.dimens_16,
                      fontWeight: FontFamily.semiBold),
                  overflow: TextOverflow.visible,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                // color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: AppDimens.dimens_45,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          primary: AppColors.green_55b135),
                      child: Text('Tiếp tục với số điện thoại'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          width: MediaQuery.of(context).size.width * 0.35,
                          height: AppDimens.dimens_1,
                          color: Colors.grey,
                        ),
                        Text('Hoặc'),
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          width: MediaQuery.of(context).size.width * 0.35,
                          height: AppDimens.dimens_1,
                          color: AppColors.grey_8A8A8A,
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: AppDimens.dimens_50,
                          height: AppDimens.dimens_50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(color: Colors.grey)),
                          child: SvgPicture.asset("assets/svg/google.svg"),
                        ),
                        Container(
                          width: AppDimens.dimens_50,
                          height: AppDimens.dimens_50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(color: Colors.grey)),
                          child: SvgPicture.asset("assets/svg/fb.svg"),
                        ),
                        Container(
                          width: AppDimens.dimens_50,
                          height: AppDimens.dimens_50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(color: AppColors.grey_8A8A8A)),
                          child: SvgPicture.asset("assets/svg/zalo.svg"),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
