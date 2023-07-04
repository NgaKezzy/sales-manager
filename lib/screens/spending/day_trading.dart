import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sales_manager/screens/spending/controller/spending_controller.dart';
import 'package:sales_manager/screens/spending/update_spending.dart';

import '../../config/app.font.dart';
import '../../config/app_color.dart';
import '../../config/app_size.dart';

class DayTrading extends StatefulWidget {
  DayTrading({
    required this.item,
    super.key,
  });

  int item = 0;

  @override
  State<DayTrading> createState() => _DayTradingState();
}

class _DayTradingState extends State<DayTrading> {
  @override
  Widget build(BuildContext context) {
    SpendingController spendingController = context.read<SpendingController>();
    return GestureDetector(
      onTap: () {
        spendingController.idSpending =
            spendingController.listSpending[widget.item].id;
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
              return Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Positioned(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.red_FC0000),
                                  onPressed: () {
                                    _showAlertDialog(context);
                                  },
                                  child: Text('Xoá'))),
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
                      ),
                    ),
                  ),
                  Container(
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
                              Text(
                                'Chi tiết khoản thu',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontFamily.medium),
                              ),
                              InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(Icons.close))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
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
                                  'Date',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontFamily.medium),
                                ),
                                Text(
                                  spendingController
                                      .listSpending[widget.item].revenueDate,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppColors.grey_808080
                                          .withOpacity(0.6)),
                                )
                              ],
                            ),
                            Expanded(child: SizedBox()),
                            Column(
                              children: [
                                Text(
                                  '${NumberFormat.decimalPattern().format(spendingController.listSpending[widget.item].revenueMoney)} đ',
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
                          spendingController
                              .listSpending[widget.item].revenueNote,
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
                          spendingController
                              .listSpending[widget.item].revenueFund,
                          style: TextStyle(color: AppColors.grey_808080),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            });
      },
      child: Container(
          margin: EdgeInsets.only(top: 5),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Date',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontFamily.medium),
                  ),
                  Text(
                    spendingController.listSpending[widget.item].revenueDate,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontFamily.light,
                        color: AppColors.grey_8A8A8A),
                  ),
                ],
              ),
              Expanded(child: SizedBox()),
              Text(
                '${NumberFormat.decimalPattern().format(spendingController.listSpending[widget.item].revenueMoney)} đ',
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

Future<void> _showAlertDialog(BuildContext context) {
  SpendingController spendingController = context.read<SpendingController>();
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Xóa khoản thu ?'),
        content: Text('Bạn có chắc rằng muốn xóa khoản thu ?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Hủy'),
          ),
          TextButton(
            onPressed: () {
              spendingController.deleteSpending(spendingController.idSpending);
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Text('Xóa'),
          ),
        ],
      );
    },
  );
}
