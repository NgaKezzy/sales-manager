import 'package:flutter/material.dart';
import 'package:sales_manager/screens/spending/update_spending.dart';

import '../../config/app.font.dart';
import '../../config/app_color.dart';
import '../../config/app_size.dart';

class DayTrading extends StatefulWidget {
  const DayTrading({
    super.key,
  });

  @override
  State<DayTrading> createState() => _DayTradingState();
}

class _DayTradingState extends State<DayTrading> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                // <-- SEE HERE
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
              ),
            ),
            builder: (context) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.45,
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 24,
                          ),
                          Text('Chi tiết khoản thu'),
                          Icon(Icons.close)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Icon(
                              Icons.sync_alt,
                              color: AppColors.red_FC0000,
                            )
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hôm nay',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontFamily.medium),
                            ),
                            Text(
                              '22/2/2012',
                              style: TextStyle(
                                  fontSize: 16,
                                  color:
                                      AppColors.grey_808080.withOpacity(0.6)),
                            )
                          ],
                        ),
                        Expanded(child: SizedBox()),
                        Column(
                          children: [
                            Text(
                              '1243645756',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: AppColors.green_55b135,
                                  fontWeight: FontFamily.medium),
                            )
                          ],
                        )
                      ],
                    ),
                    Divider(
                      color: AppColors.grey_808080.withOpacity(0.6),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Ghi chú',
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontFamily.medium),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'các ghi chú ở đây',
                      style: TextStyle(color: AppColors.grey_808080),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Nguồn tiền',
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontFamily.medium),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'nguồn tiền ở đầy',
                      style: TextStyle(color: AppColors.grey_808080),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        AppColors.grey_808080.withOpacity(0.3)),
                                onPressed: () {},
                                child: Text('Xoá'))),
                        SizedBox(
                          width: AppDimens.dimens_30,
                        ),
                        SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            UpdateSpending()));
                              },
                              child: Text('Chỉnh sửa')),
                        ),
                      ],
                    )
                  ],
                ),
              );
            });
      },
      child: Container(
          // margin: EdgeInsets.only(top: 5),
          decoration: BoxDecoration(
              color: AppColors.white,
              border: Border(
                  bottom: BorderSide(
                      width: 1,
                      color: AppColors.grey_8A8A8A.withOpacity(0.3)))),
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
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontFamily.medium),
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
          )),
    );
  }
}
