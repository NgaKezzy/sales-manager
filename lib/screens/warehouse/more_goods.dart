import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sales_manager/widgets/header_center.dart';

class MoreGoods extends StatelessWidget {
  const MoreGoods({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderCenter(txt_header: 'Nhập hàng'),
        ],
      ),
    );
  }
}
