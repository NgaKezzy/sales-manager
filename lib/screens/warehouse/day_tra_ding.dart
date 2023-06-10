import 'package:flutter/material.dart';

import '../../config/app.font.dart';
import '../../config/app_color.dart';

class DayTrading extends StatelessWidget {
  const DayTrading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        // margin: EdgeInsets.only(top: 5),
        decoration: BoxDecoration(
            color: AppColors.white,
            border: Border(
                bottom: BorderSide(
                    width: 1, color: AppColors.grey_8A8A8A.withOpacity(0.3)))),
        height: 50,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: AppColors.grey_8A8A8A.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(5)),
              child: Text(
                '19',
                style: TextStyle(fontWeight: FontFamily.medium),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Thứ sáu',
                  style: TextStyle(fontSize: 16, fontWeight: FontFamily.medium),
                ),
                Text(
                  'Tháng 5/23',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontFamily.light,
                      color: AppColors.grey_8A8A8A),
                ),
              ],
            ),
            Expanded(child: SizedBox()),
            Text(
              '1.250.000',
              style: TextStyle(
                  color: AppColors.green_55b135,
                  fontSize: 18,
                  fontWeight: FontFamily.semiBold),
            )
          ],
        ),
      ),
    );
  }
}
