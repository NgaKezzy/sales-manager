import 'package:flutter/material.dart';

import '../config/app.font.dart';
import '../config/app_color.dart';
import '../config/app_size.dart';

Drawer DrawerApp(BuildContext context) {
  return Drawer(
    backgroundColor: AppColors.blue_028f76,
    child: ListView(children: [
      SizedBox(
        height: 130,
        child: DrawerHeader(
          decoration: BoxDecoration(
            color: AppColors.blue_028f76,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        color: AppColors.yellow_FAA810,
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
          height: MediaQuery.of(context).size.height - 200,
          color: AppColors.white,
          child: Column(
            children: [
              ItemDrawer(
                icon: Icons.manage_accounts,
                txt: 'Cài đặt cửa hàng',
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
              ItemDrawer(
                icon: Icons.logout,
                txt: 'Đăng xuất',
              ),
            ],
          )),
    ]),
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
            color: AppColors.green_006200,
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