import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sales_manager/screens/login_and_init_shop/controller/auth_controller.dart';
import 'package:sales_manager/screens/spending/controller/spending_controller.dart';
import 'package:sales_manager/screens/spending/revenue.dart';
import 'package:sales_manager/screens/spending/revenue_and_expenditure_content.dart';

import '../../config/app.font.dart';
import '../../config/app_color.dart';
import '../../config/app_size.dart';
import '../../widgets/drawer_app.dart';
import 'expenses.dart';

class SpendingScreen extends StatefulWidget {
  const SpendingScreen({super.key});

  @override
  State<SpendingScreen> createState() => _SpendingScreenState();
}

class _SpendingScreenState extends State<SpendingScreen> {
  @override
  Widget build(BuildContext context) {
    AuthController authController = context.read<AuthController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blue_028f76,
        title: authController.userLogin != null
            ? Text(authController.userLogin!.shopName)
            : Text('Tên shop'),
      ),
      drawer: DrawerApp(context),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            color: AppColors.grey_808080.withOpacity(0.1),
            // padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: RevenueAndExpenditureContent(),
                )
              ],
            ),
          ),
          Positioned(
            child: Container(
              color: AppColors.white,
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              width: MediaQuery.of(context).size.width,
              height: 50,
              // color: AppColors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 45,
                    width: MediaQuery.of(context).size.width * 0.44,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.red_FF5151),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Expenses()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.arrow_upward,
                              size: 20,
                            ),
                            Text(
                              'Khoản chi',
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 45,
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.blue_028f76),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Revenue()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.arrow_downward,
                              size: 20,
                            ),
                            Text(
                              'Khoản thu',
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        )),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
