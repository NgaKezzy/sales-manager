import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:sales_manager/config/app.font.dart';
import 'package:sales_manager/config/app_color.dart';
import 'package:sales_manager/config/app_size.dart';
import 'package:sales_manager/screens/manager/controller/order_controller.dart';

import '../../../widgets/item_oder.dart';

class All extends StatefulWidget {
  const All({super.key});

  @override
  State<All> createState() => _AllState();
}

class _AllState extends State<All> {
  @override
  Widget build(BuildContext context) {
    OrderController orderController = context.read<OrderController>();
    return ListView.builder(
      padding: EdgeInsets.only(top: 0, bottom: 80),
      scrollDirection: Axis.vertical,
      itemCount: orderController.listItemOrder.length,
      itemBuilder: (context, index) {
        return ItemOder(
          element: index,
        );
      },
    );
  }
}
