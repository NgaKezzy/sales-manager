import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_manager/config/print_color.dart';
import 'package:sales_manager/screens/login_and_init_shop/controller/auth_controller.dart';

import '../config/app.font.dart';
import '../config/app_color.dart';
import '../config/app_size.dart';
import '../screens/login_and_init_shop/infomation_shop.dart';

Drawer DrawerApp(BuildContext context) {
  AuthController authController = context.read<AuthController>();

  return Drawer(
    backgroundColor: AppColors.blue_028f76,
    child: Column(children: [
      Container(
        height: 180,
        child: DrawerHeader(
          decoration: BoxDecoration(
            color: AppColors.blue_028f76,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/img/avatar.png'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ngà kezzy',
                        style: TextStyle(
                            color: AppColors.white,
                            fontSize: AppDimens.dimens_20,
                            fontWeight: FontFamily.medium),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '00346846446',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: AppDimens.dimens_16,
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
      Container(
          height: MediaQuery.of(context).size.height - 236,
          color: AppColors.white,
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InofmationShop()));
                },
                child: ItemDrawer(
                  icon: Icons.manage_accounts,
                  txt: 'Cài đặt cửa hàng',
                ),
              ),
              ItemDrawer(
                icon: Icons.redeem,
                txt: 'Tích điểm đổi quà',
              ),
              ItemDrawer(
                icon: Icons.sync,
                txt: 'Giới thiệu nhận quà',
              ),
              ItemDrawer(
                icon: Icons.local_atm,
                txt: 'Liên kết ngân hàng',
              ),
              ItemDrawer(
                icon: Icons.contact_support,
                txt: 'Hỗ trợ',
              ),
              InkWell(
                onTap: () {
                  _showAlertDialog(context);
                  printRed('Bật xác thực đang xuất');
                },
                child: ItemDrawer(
                  icon: Icons.logout,
                  txt: 'Đăng xuất',
                ),
              ),
            ],
          )),
    ]),
  );
}

Future<void> _showAlertDialog(BuildContext context) {
  AuthController authController = context.read<AuthController>();
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Đăng xuất tài khoản ?'),
        content: Text('Bạn có chắc rằng muốn đăng xuất tài khoản ?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Hủy'),
          ),
          TextButton(
            onPressed: () {
              authController.userNameController.text = '';
              authController.passwordController.text = '';
              authController.LogOut();
              Navigator.pop(context);
            },
            child: Text('Đăng xuất'),
          ),
        ],
      );
    },
  );
}

class ItemDrawer extends StatelessWidget {
  ItemDrawer({
    required this.icon,
    required this.txt,
    super.key,
  });
  final IconData icon;
  final String txt;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: AppDimens.dimens_20),
      height: AppDimens.dimens_50,
      width: double.infinity,
      decoration: BoxDecoration(
          // border: Border(
          //   bottom: BorderSide(color: AppColors.grey_8A8A8A, width: 1),
          // ),
          ),
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.blue_028f76,
          ),
          SizedBox(
            width: AppDimens.dimens_10,
          ),
          Text(
            txt,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
