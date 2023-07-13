import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
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
import 'package:sales_manager/screens/login_and_init_shop/login.dart';
import 'package:sales_manager/widgets/header_center.dart';

import '../../config/print_color.dart';

class InofmationShop extends StatefulWidget {
  const InofmationShop({super.key});

  @override
  State<InofmationShop> createState() => _InofmationShopState();
}

class _InofmationShopState extends State<InofmationShop> {
  late AuthController authController;
  void didChangeDependencies() {
    authController = context.read<AuthController>();
    super.didChangeDependencies();
  }

  File? avatar;
  Future pickImage() async {
    try {
      final avatar = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (avatar == null) {
        return;
      }
      final imageTemporary = File(avatar.path);
      setState(() => this.avatar = imageTemporary);
    } on PlatformException catch (e) {
      printRed('failed to pick image : $e');
    }
  }

  Future uploadFile() async {
    final storageRef =
        FirebaseStorage.instance.ref().child("avatar").child("${avatar}");
    final uploadTask = storageRef.putFile(avatar!);
    final snapshot = await uploadTask.whenComplete(() {});
    authController.urlAvatar = await snapshot.ref.getDownloadURL();
    printCyan(authController.urlAvatar);
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
                          avatar == null
                              ? Stack(
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: AppColors.blue_028f76,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(50),
                                        image:
                                            authController.networkAvatar == ''
                                                ? DecorationImage(
                                                    image: AssetImage(
                                                        'assets/img/avatar.png'),
                                                    fit: BoxFit.cover,
                                                  )
                                                : DecorationImage(
                                                    image: NetworkImage(
                                                        authController
                                                            .networkAvatar),
                                                    fit: BoxFit.cover),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: InkWell(
                                          onTap: () {
                                            pickImage();
                                          },
                                          child: Icon(
                                            Icons.add_a_photo,
                                            color: AppColors.black,
                                          )),
                                    )
                                  ],
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Image.file(
                                    avatar!,
                                    width: AppDimens.dimens_100,
                                    height: AppDimens.dimens_100,
                                    fit: BoxFit.cover,
                                  ),
                                )
                        ],
                      ),
                      SizedBox(
                        height: AppDimens.dimens_10,
                      ),
                      const Text(
                        'Tên cửa hàng',
                        style: TextStyle(
                            fontSize: AppDimens.dimens_16,
                            fontWeight: FontFamily.medium,
                            color: AppColors.grey_808080),
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.next,
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
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
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
                        textInputAction: TextInputAction.next,
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
                        textInputAction: TextInputAction.done,
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
                                  backgroundColor: AppColors.blue_028f76),
                              onPressed: () async {
                                await uploadFile();
                                await authController.updateStoreInformation(
                                    authController.urlAvatar);

                                _showAlertDialog(context);
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

Future<void> _showAlertDialog(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Thông báo'),
        content: Text('Hãy đăng nhập lại để hiển thị giao diện'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Ok'),
          ),
        ],
      );
    },
  );
}
