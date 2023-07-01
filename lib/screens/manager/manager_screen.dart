import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sales_manager/config/app_color.dart';
import 'package:sales_manager/config/app_size.dart';
import 'package:sales_manager/screens/manager/controller/products_controller.dart';
import 'package:sales_manager/screens/manager/product/manage.dart';
import 'package:sales_manager/screens/manager/report/report.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/app.font.dart';
import '../../config/app_domain.dart';
import '../../widgets/drawer_app.dart';
import 'controller/order_controller.dart';
import 'create_oder/sell.dart';
import 'oder/oder.dart';

class ManagerScreen extends StatefulWidget {
  const ManagerScreen({super.key});

  @override
  State<ManagerScreen> createState() => _ManagerScreenState();
}

class _ManagerScreenState extends State<ManagerScreen> {
  @override
  Widget build(BuildContext context) {
    ProductsController productsController = context.read<ProductsController>();
    OrderController orderController = context.read<OrderController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.green_006200,
        title: Text('Tên shop'),
        // actions: [
        //   Row(
        //     children: const [
        //       Icon(
        //         Icons.qr_code_scanner,
        //         color: Colors.white,
        //       ),
        //       SizedBox(
        //         width: AppDimens.dimens_20,
        //       ),
        //       Icon(
        //         Icons.messenger,
        //         color: Colors.white,
        //       ),
        //       SizedBox(
        //         width: 10,
        //       )
        //     ],
        //   ),
        // ],
      ),
      drawer: DrawerApp(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: AppColors.grey_8A8A8A.withOpacity(0.1),
              height: MediaQuery.of(context).size.height - 146,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      // color: AppColors.grey_8A8A8A.withOpacity(0.2),
                      padding: EdgeInsets.all(AppDimens.dimens_10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                height: AppDimens.dimens_120,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.grey_8A8A8A,
                                      blurRadius: 2,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Column(children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Hôm nay',
                                        style: TextStyle(
                                            color: AppColors.grey_8A8A8A,
                                            fontWeight: FontFamily.medium,
                                            fontSize: 16),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Report()));
                                        },
                                        child: SizedBox(
                                          child: Row(children: [
                                            Icon(
                                              Icons.bar_chart,
                                              color: AppColors.blue_0000ff,
                                              size: 15,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'Xem lãi lỗ',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: AppColors.blue_0000ff),
                                            ),
                                            Icon(
                                              Icons.navigate_next,
                                              color: AppColors.blue_0000ff,
                                            )
                                          ]),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.bar_chart,
                                                color: AppColors.yellow_FAA810,
                                                size: AppDimens.dimens_15,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                'Doanh thu',
                                                style: TextStyle(
                                                  fontSize: AppDimens.dimens_13,
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            '0',
                                            style: TextStyle(
                                                fontSize: AppDimens.dimens_16,
                                                fontWeight: FontFamily.medium),
                                          )
                                        ],
                                      ),
                                      Container(
                                        width: 1,
                                        height: 30,
                                        margin:
                                            EdgeInsets.only(left: 4, right: 4),
                                        color: AppColors.grey_8A8A8A,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.wysiwyg,
                                                color: AppColors.blue_0000ff,
                                                size: AppDimens.dimens_15,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                'Đơn hàng',
                                                style: TextStyle(
                                                  fontSize: AppDimens.dimens_13,
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            '0',
                                            style: TextStyle(
                                                fontSize: AppDimens.dimens_16,
                                                fontWeight: FontFamily.medium),
                                          )
                                        ],
                                      ),
                                      Container(
                                        width: 1,
                                        height: 30,
                                        margin:
                                            EdgeInsets.only(left: 4, right: 4),
                                        color: AppColors.grey_8A8A8A,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.monetization_on,
                                                color: AppColors.yellow_FAA810,
                                                size: AppDimens.dimens_15,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                'Lợi nhuận',
                                                style: TextStyle(
                                                  fontSize: AppDimens.dimens_13,
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            '0',
                                            style: TextStyle(
                                                fontSize: AppDimens.dimens_16,
                                                fontWeight: FontFamily.medium),
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                                ]),
                              ),
                              SizedBox(
                                height: AppDimens.dimens_20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Sell()));
                                    },
                                    child: ItemManager(
                                        nameManager: 'Tạo đơn',
                                        icon: Icons.store,
                                        clIcon: AppColors.red_FF5151
                                            .withOpacity(0.9)),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Oder()));
                                    },
                                    child: ItemManager(
                                        nameManager: 'Đơn hàng',
                                        icon: Icons.bookmark_added,
                                        clIcon: AppColors.yellow_FAA810),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: AppDimens.dimens_20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Menage()));
                                    },
                                    child: ItemManager(
                                        nameManager: 'Sản phầm',
                                        icon: Icons.local_mall,
                                        clIcon: AppColors.yellow_FAA810),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Report()));
                                    },
                                    child: ItemManager(
                                      nameManager: 'Báo cáo',
                                      icon: Icons.bar_chart,
                                      clIcon: AppColors.green_55b135,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: AppDimens.dimens_120,
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
                                ),
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
                              width:
                                  MediaQuery.of(context).size.width * 0.5 - 1,
                              height: AppDimens.dimens_90,
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
                                            color:
                                                Colors.black.withOpacity(0.6),
                                            fontWeight: FontFamily.medium),
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
                                        fontWeight: FontFamily.semiBold),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: AppDimens.dimens_90,
                              width: AppDimens.dimens_1,
                              color: AppColors.grey_8A8A8A,
                            ),
                            Container(
                              width:
                                  MediaQuery.of(context).size.width * 0.5 - 1,
                              height: AppDimens.dimens_90,
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
                                            color:
                                                Colors.black.withOpacity(0.6),
                                            fontWeight: FontFamily.medium),
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
                                        fontWeight: FontFamily.semiBold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      ]),
                    ),
                    SizedBox(
                      height: AppDimens.dimens_10,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      height: AppDimens.dimens_90,
                      width: MediaQuery.of(context).size.width,
                      color: AppColors.white,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/boy.svg',
                            height: 40,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            width: AppDimens.dimens_150,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Bạn cần hỗ trợ',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontFamily.medium),
                                ),
                                Text(
                                  'Hướng dẫn, giải đáp thắc mắc hoặc báo cáo sự cố.',
                                  style:
                                      TextStyle(fontSize: AppDimens.dimens_13),
                                )
                              ],
                            ),
                          ),
                          Expanded(child: SizedBox()),
                          Container(
                            alignment: Alignment.center,
                            height: 35,
                            width: 100,
                            decoration: BoxDecoration(
                                color: AppColors.blue_0000ff.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.sms,
                                    color: AppColors.white,
                                    size: 18,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Liên hệ',
                                    style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: AppDimens.dimens_15,
                                        fontWeight: FontFamily.medium),
                                  )
                                ]),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ItemManager extends StatelessWidget {
  const ItemManager({
    required this.nameManager,
    required this.icon,
    required this.clIcon,
    super.key,
  });

  final String nameManager;
  final IconData icon;
  final Color clIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5 - 20,
      height: AppDimens.dimens_120,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.grey_8A8A8A,
            blurRadius: 2,
            // spreadRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
        color: AppColors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: AppDimens.dimens_40,
            color: clIcon,
          ),
          Text(
            nameManager,
            style: TextStyle(
                fontWeight: FontFamily.medium, fontSize: AppDimens.dimens_16),
          )
        ],
      ),
    );
  }
}
