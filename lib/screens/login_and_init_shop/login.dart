import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:sales_manager/config/app.font.dart';
import 'package:sales_manager/config/app_color.dart';
import 'package:sales_manager/config/app_size.dart';
import 'package:sales_manager/screens/login_and_init_shop/controller/auth_controller.dart';
import 'package:sales_manager/screens/login_and_init_shop/register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    AuthController authController = context.read<AuthController>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: authController.formKey,
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
                    'Đăng nhập',
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
                    height: AppDimens.dimens_70,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextFormField(
                      controller: authController.userNameController,
                      validator: authController.validator,
                      decoration: InputDecoration(
                        hintText: 'Tên đăng nhập',
                        hintStyle: TextStyle(fontSize: 13),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2,
                              color: Colors.greenAccent), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2,
                              color: Colors.greenAccent), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2,
                              color: Colors.greenAccent), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2,
                              color: Colors.greenAccent), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: AppDimens.dimens_70,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextFormField(
                      controller: authController.passwordController,
                      validator: authController.validator,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Mật khẩu',
                        hintStyle: TextStyle(fontSize: 13),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2,
                              color: Colors.greenAccent), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2,
                              color: Colors.greenAccent), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2,
                              color: Colors.greenAccent), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2,
                              color: Colors.greenAccent), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(50.0),
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
                height: 40,
                width: MediaQuery.of(context).size.width * 0.6,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.green_006200),
                    onPressed: () => authController.logIn(context),
                    child: Text(
                      'Đăng nhập',
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
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      height: 40,
                      child: Text(
                        "Quên mật khẩu ?",
                        style: TextStyle(
                            fontSize: 16,
                            color: AppColors.red_d31900,
                            fontWeight: FontFamily.medium),
                      )),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Register()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      // color: AppColors.red_FC0000,
                      height: 40,
                      child: Text(
                        "Đăng ký",
                        style: TextStyle(
                            color: AppColors.blue_0000ff,
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
    );
  }
}
