import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sales_manager/config/app_color.dart';
import 'package:sales_manager/config/app_size.dart';

class ManagerScreen extends StatefulWidget {
  const ManagerScreen({super.key});

  @override
  State<ManagerScreen> createState() => _ManagerScreenState();
}

class _ManagerScreenState extends State<ManagerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: 90,
            color: AppColors.green_006200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: AppColors.grey_8A8A8A),
                          child: Center(
                            child: Text('avatar'),
                          ),
                        ),
                        SizedBox(
                          width: AppDimens.dimens_10,
                        ),
                        Text(
                          'Tên shop',
                          style: TextStyle(
                              fontSize: AppDimens.dimens_20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                )),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox(
                        width: AppDimens.dimens_10,
                        height: 0,
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.qr_code_scanner,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: AppDimens.dimens_20,
                          ),
                          Icon(
                            Icons.messenger,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 146,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(AppDimens.dimens_10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: AppDimens.dimens_20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5 -
                                          20,
                                  height: AppDimens.dimens_170,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color:
                                        AppColors.grey_8A8A8A.withOpacity(0.2),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.add_business,
                                        size: AppDimens.dimens_50,
                                        color: Colors.red,
                                      ),
                                      Text('Tạo đơn')
                                    ],
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5 -
                                          20,
                                  padding: EdgeInsets.all(10),
                                  height: AppDimens.dimens_170,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color:
                                        AppColors.grey_8A8A8A.withOpacity(0.2),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.bookmark_added,
                                        size: AppDimens.dimens_50,
                                        color: Colors.amberAccent,
                                      ),
                                      Text('Đơn hàng')
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: AppDimens.dimens_20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5 -
                                          20,
                                  padding: EdgeInsets.all(10),
                                  height: 170,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color:
                                        AppColors.grey_8A8A8A.withOpacity(0.2),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.local_mall,
                                        size: AppDimens.dimens_50,
                                        color: Colors.amberAccent,
                                      ),
                                      Text('Sản phầm')
                                    ],
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5 -
                                          20,
                                  padding: EdgeInsets.all(10),
                                  height: 170,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color:
                                        AppColors.grey_8A8A8A.withOpacity(0.2),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.query_stats,
                                        size: AppDimens.dimens_50,
                                        color: Colors.green,
                                      ),
                                      Text('Báo cáo')
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: AppDimens.dimens_130,
                    color: Colors.white,
                    child: Column(children: [
                      // SizedBox(
                      //   height: 10,
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: 30,
                            // color: Colors.red,
                            child: Text(
                              'Đơn hàng',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black.withOpacity(0.7),
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: AppDimens.dimens_30,
                            // color: Colors.green,
                            child: Text(
                              'Tất cả ▶',
                              style: TextStyle(
                                  fontSize: AppDimens.dimens_16,
                                  color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5 - 1,
                            height: AppDimens.dimens_100,
                            // color: Colors.greenAccent,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.schedule,
                                      size: AppDimens.dimens_24,
                                      color: AppColors.grey_8A8A8A,
                                    ),
                                    SizedBox(
                                      width: AppDimens.dimens_5,
                                    ),
                                    Text(
                                      'Chờ xác nhận',
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.6),
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: AppDimens.dimens_10,
                                ),
                                Text(
                                  '0',
                                  style: TextStyle(
                                      fontSize: AppDimens.dimens_25,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: AppDimens.dimens_100,
                            width: AppDimens.dimens_1,
                            color: AppColors.grey_8A8A8A,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5 - 1,
                            height: AppDimens.dimens_100,
                            // color: Colors.greenAccent,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.local_shipping,
                                      size: AppDimens.dimens_24,
                                      color: AppColors.grey_8A8A8A,
                                    ),
                                    SizedBox(
                                      width: AppDimens.dimens_5,
                                    ),
                                    Text(
                                      'Đang xử lý',
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.6),
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: AppDimens.dimens_10,
                                ),
                                Text(
                                  '0',
                                  style: TextStyle(
                                      fontSize: AppDimens.dimens_25,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ]),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
