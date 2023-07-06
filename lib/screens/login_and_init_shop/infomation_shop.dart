import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sales_manager/config/app.font.dart';
import 'package:sales_manager/config/app_color.dart';
import 'package:sales_manager/config/app_size.dart';
import 'package:sales_manager/screens/login_and_init_shop/controller/auth_controller.dart';
import 'package:sales_manager/widgets/header_center.dart';

import '../../config/print_color.dart';

class InofmationShop extends StatefulWidget {
  const InofmationShop({super.key});

  @override
  State<InofmationShop> createState() => _InofmationShopState();
}

class _InofmationShopState extends State<InofmationShop> {
  File? image;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) {
        return;
      }
      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      printRed('failed to pick image : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    AuthController authController = context.read<AuthController>();
    return Scaffold(
      body: Column(
        children: [
          HeaderCenter(txt_header: 'Thông tin cửa hàng'),
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: authController.formKeyUpdateStore,
                child: Container(
                  margin: EdgeInsets.only(top: AppDimens.dimens_10),
                  padding: EdgeInsets.all(10),
                  color: AppColors.white,
                  height: MediaQuery.of(context).size.height - 90,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                  minRadius: AppDimens.dimens_40,
                                  backgroundImage:
                                      AssetImage('assets/img/avatar.png')),
                              Positioned(
                                bottom: 0,
                                right: 5,
                                child: InkWell(
                                    onTap: () {
                                      pickImage();
                                    },
                                    child: Icon(Icons.add_a_photo)),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppDimens.dimens_10,
                      ),
                      Text(
                        'Tên cửa hàng',
                        style: TextStyle(
                            fontSize: AppDimens.dimens_16,
                            fontWeight: FontFamily.medium,
                            color: AppColors.grey_808080),
                      ),
                      TextFormField(
                        controller: authController.shopNameController,
                        validator: authController.validator,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                          isDense: true,
                        ),
                      ),
                      SizedBox(
                        height: AppDimens.dimens_40,
                      ),
                      Text(
                        'Số điện thoại',
                        style: TextStyle(
                            fontSize: AppDimens.dimens_16,
                            fontWeight: FontFamily.medium,
                            color: AppColors.grey_808080),
                      ),
                      TextFormField(
                        controller: authController.phoneController,
                        validator: authController.validator,
                        decoration: InputDecoration(
                            isDense: true,
                            hintText: '0912345467',
                            hintStyle: TextStyle(
                                fontSize: AppDimens.dimens_14,
                                color: AppColors.grey_8A8A8A)),
                      ),
                      SizedBox(
                        height: AppDimens.dimens_40,
                      ),
                      Text(
                        'Địa chỉ',
                        style: TextStyle(
                            fontSize: AppDimens.dimens_16,
                            fontWeight: FontFamily.medium,
                            color: AppColors.grey_808080),
                      ),
                      TextFormField(
                        controller: authController.addressController,
                        validator: authController.validator,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                            isDense: true,
                            hintText: 'Nhập địa chỉ',
                            hintStyle: TextStyle(
                                fontSize: AppDimens.dimens_14,
                                color: AppColors.grey_8A8A8A)),
                      ),
                      SizedBox(
                        height: AppDimens.dimens_40,
                      ),
                      Text(
                        'Mô tả cửa hàng',
                        style: TextStyle(
                            fontSize: AppDimens.dimens_16,
                            fontWeight: FontFamily.medium,
                            color: AppColors.grey_808080),
                      ),
                      TextFormField(
                        controller: authController.descriptionController,
                        validator: authController.validator,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                            isDense: true,
                            hintText: 'Ví dụ: Chuyên bán các mặt hàng gia dụng',
                            hintStyle: TextStyle(
                                fontSize: AppDimens.dimens_14,
                                color: AppColors.grey_8A8A8A)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            padding: EdgeInsets.only(top: AppDimens.dimens_40),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.green_006200),
                              onPressed: () {
                                authController.updateStoreInformation();
                              },
                              child: Text('Cập nhật'),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
