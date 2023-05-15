import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sales_manager/widgets/header_center.dart';

class Menage extends StatelessWidget {
  const Menage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [HeaderCenter(txt_header: 'Quản lý')],
        ),
      ),
    );
  }
}
