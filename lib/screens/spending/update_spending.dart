import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_manager/screens/spending/controller/spending_controller.dart';
import 'package:sales_manager/widgets/header_center.dart';

import '../../config/app.font.dart';
import '../../config/app_color.dart';
import '../../config/app_size.dart';

class UpdateSpending extends StatelessWidget {
  const UpdateSpending({super.key});

  @override
  Widget build(BuildContext context) {
    SpendingController spendingController = context.read<SpendingController>();
    return Scaffold(
      body: Column(children: [
        Container(
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          height: AppDimens.dimens_80,
          decoration: BoxDecoration(color: AppColors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 24,
                    )),
              ),
              Container(
                margin: EdgeInsets.only(right: 10),
                child: Text(
                  'Chỉnh sửa khoản chi',
                  style: const TextStyle(
                    fontSize: 18,
                    color: AppColors.black,
                    fontWeight: FontFamily.medium,
                  ),
                ),
              ),
              SizedBox(
                width: AppDimens.dimens_24,
              )
            ],
          ),
        ),
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  spendingController.setDateTimeRevenue(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.calendar_month),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      spendingController.dateRevenue.split(' ')[0],
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontFamily.medium),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: AppDimens.dimens_10,
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nhập số tiền',
                      style: TextStyle(
                          fontSize: 18,
                          color: AppColors.green_55b135,
                          fontWeight: FontFamily.medium),
                    ),
                    SizedBox(
                      height: AppDimens.dimens_10,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      autocorrect: true,
                      decoration: InputDecoration(
                        isDense: true,
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
                              width: 1, color: AppColors.black), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Nguồn tiền',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontFamily.medium),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            spendingController.revenueFund = 'Tiền mặt';
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: AppDimens.dimens_100,
                            height: AppDimens.dimens_35,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: spendingController.revenueFund ==
                                          'Tiền mặt'
                                      ? AppColors.blue_0000ff
                                      : AppColors.grey_8A8A8A,
                                  width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              'Tiền mặt',
                              style: TextStyle(
                                color:
                                    spendingController.revenueFund == 'Tiền mặt'
                                        ? AppColors.blue_0000ff
                                        : AppColors.grey_8A8A8A,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            spendingController.revenueFund = 'Ví điện tử';
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: AppDimens.dimens_100,
                            height: AppDimens.dimens_35,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: spendingController.revenueFund ==
                                          'Ví điện tử'
                                      ? AppColors.blue_0000ff
                                      : AppColors.grey_8A8A8A,
                                  width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              'Ví điện tử',
                              style: TextStyle(
                                  color: spendingController.revenueFund ==
                                          'Ví điện tử'
                                      ? AppColors.blue_0000ff
                                      : AppColors.grey_8A8A8A),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            spendingController.revenueFund = 'Ngân hàng';
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: AppDimens.dimens_100,
                            height: AppDimens.dimens_35,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: spendingController.revenueFund ==
                                          'Ngân hàng'
                                      ? AppColors.blue_0000ff
                                      : AppColors.grey_8A8A8A,
                                  width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              'Ngân hàng',
                              style: TextStyle(
                                color: spendingController.revenueFund ==
                                        'Ngân hàng'
                                    ? AppColors.blue_0000ff
                                    : AppColors.grey_8A8A8A,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Ghi chú',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontFamily.medium),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: spendingController.expendingNoteController,
                      textInputAction: TextInputAction.done,
                      maxLines: 3,
                      autocorrect: true,
                      decoration: InputDecoration(
                        isDense: true,
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
                              width: 1, color: AppColors.black), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Cập nhật'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.green_006200),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}
