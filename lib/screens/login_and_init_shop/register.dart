import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sales_manager/screens/login_and_init_shop/login.dart';

import '../../config/app.font.dart';
import '../../config/app_color.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'User name',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2, color: Colors.greenAccent), //<-- SEE HERE
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2, color: Colors.greenAccent), //<-- SEE HERE
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Password',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2, color: Colors.greenAccent), //<-- SEE HERE
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2, color: Colors.greenAccent), //<-- SEE HERE
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
              width: MediaQuery.of(context).size.width * 0.5,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.green_006200),
                  onPressed: () {},
                  child: Text('Đăng ký')),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 30, child: Text("Đã có tài khoản ?")),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: SizedBox(
                    height: 30,
                    child: Text(
                      "Đăng nhập",
                      style: TextStyle(color: AppColors.blue_0000ff),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
