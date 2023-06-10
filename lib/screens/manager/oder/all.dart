import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sales_manager/config/app.font.dart';
import 'package:sales_manager/config/app_color.dart';
import 'package:sales_manager/config/app_size.dart';

import '../../../widgets/item_oder.dart';

class All extends StatelessWidget {
  const All({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ItemOder(),
            ItemOder(),
            ItemOder(),
            ItemOder(),
            ItemOder(),
            ItemOder(),
            ItemOder(),

            // để lại Sizebox để cuộn được hết
            SizedBox(
              height: AppDimens.dimens_200,
            )
          ],
        ),
      ),
    );
  }
}
