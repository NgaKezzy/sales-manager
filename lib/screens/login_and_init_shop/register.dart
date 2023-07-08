import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:sales_manager/config/app_size.dart';
import 'package:sales_manager/screens/login_and_init_shop/login.dart';

import '../../config/app.font.dart';
import '../../config/app_color.dart';
import 'controller/auth_controller.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = context.read<AuthController>();

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Form(
            key: authController.formKeyRegister,
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: 80,
                  height: 130,
                  child: Image.asset('assets/img/appstore.png'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Đăng ký',
                      style: TextStyle(
                          color: AppColors.black,
                          fontSize: 30,
                          fontWeight: FontFamily.medium),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      height: 70,
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: TextFormField(
                        controller: authController.userName,
                        textInputAction: TextInputAction.next,
                        validator: authController.validator,
                        decoration: InputDecoration(
                          isDense: true,
                          labelText: 'Tên đăng nhập',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1,
                                color: AppColors.grey_808080
                                    .withOpacity(0.6)), //<-- SEE HERE
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1,
                                color: AppColors.grey_808080), //<-- SEE HERE
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1,
                                color: AppColors.red_FF5151), //<-- SEE HERE
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1,
                                color: AppColors.black), //<-- SEE HERE
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 70,
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: TextFormField(
                        controller: authController.passOne,
                        textInputAction: TextInputAction.next,
                        validator: authController.validator,
                        decoration: InputDecoration(
                          isDense: true,
                          labelText: 'Mật khẩu',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1,
                                color: AppColors.grey_808080
                                    .withOpacity(0.6)), //<-- SEE HERE
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1,
                                color: AppColors.grey_808080), //<-- SEE HERE
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1,
                                color: AppColors.red_FF5151), //<-- SEE HERE
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1,
                                color: AppColors.black), //<-- SEE HERE
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 70,
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: TextFormField(
                        controller: authController.PassTwo,
                        textInputAction: TextInputAction.done,
                        validator: authController.validator,
                        decoration: InputDecoration(
                          isDense: true,
                          labelText: 'Nhập lại mật khẩu',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1,
                                color: AppColors.grey_808080
                                    .withOpacity(0.6)), //<-- SEE HERE
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1,
                                color: AppColors.grey_808080), //<-- SEE HERE
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1,
                                color: AppColors.red_FF5151), //<-- SEE HERE
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1,
                                color: AppColors.black), //<-- SEE HERE
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: AppDimens.dimens_45,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.blue_028f76),
                      onPressed: () => authController.submitRegister(context),
                      child: Text(
                        'Đăng ký',
                        style: TextStyle(fontSize: AppDimens.dimens_16),
                      )),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        height: 40,
                        child: Text(
                          "Bạn dã có tài khoản ?",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        )),
                    InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                          ModalRoute.withName('/late'),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        height: 40,
                        child: Text(
                          "Đăng nhập",
                          style: TextStyle(
                              color: AppColors.green_55b135,
                              fontSize: 16,
                              fontWeight: FontFamily.medium),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
