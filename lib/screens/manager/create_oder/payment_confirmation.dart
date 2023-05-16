import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sales_manager/config/app.font.dart';
import 'package:sales_manager/config/app_color.dart';
import 'package:sales_manager/config/app_size.dart';

class PaymentConfirmation extends StatelessWidget {
  const PaymentConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    // <-- SEE HERE
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0),
                  ),
                ),
                builder: (context) {
                  return Container(
                    padding: EdgeInsets.all(20),
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: AppDimens.dimens_24,
                            ),
                            Text(
                              'Xác nhận thanh toán',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.black,
                                  fontWeight: FontFamily.medium),
                            ),
                            Icon(Icons.close)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '300.000',
                              style: TextStyle(
                                  fontSize: 25,
                                  color: AppColors.red_FC0000,
                                  fontWeight: FontFamily.medium),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text('Khách trả'),
                        Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          height: 30,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(hintText: '300.000'),
                          ),
                        ),
                        Text('Nguồn tiền'),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: 100,
                              height: 35,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColors.blue_0000ff, width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                'Tiền mặt',
                                style: TextStyle(color: AppColors.blue_0000ff),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: 100,
                              height: 35,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColors.grey_8A8A8A, width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                'Ví điện tử',
                                style: TextStyle(color: AppColors.grey_8A8A8A),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: 100,
                              height: 35,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColors.grey_8A8A8A, width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                'Ngân hàng',
                                style: TextStyle(color: AppColors.grey_8A8A8A),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Nhận tiền đối soát tự động',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: 80,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.grey_8A8A8A, width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image(
                                      image: AssetImage('assets/img/visa.png'),
                                      height: 40,
                                    ),
                                    Text(
                                      'Link thanh toán',
                                      style: TextStyle(),
                                    )
                                  ]),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: 80,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.grey_8A8A8A, width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image(
                                      image: AssetImage('assets/img/momo.png'),
                                      height: 40,
                                    ),
                                    Text(
                                      'QR thanh toán',
                                      style: TextStyle(),
                                    )
                                  ]),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: AppDimens.dimens_55,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.green_55b135),
                              onPressed: () {},
                              child: Text(
                                'Xác nhận',
                                style: TextStyle(
                                    fontSize: AppDimens.dimens_16,
                                    fontWeight: FontFamily.medium),
                              )),
                        )
                      ],
                    ),
                  );
                });
          },
          child: const Text(
            'Choose Option',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
