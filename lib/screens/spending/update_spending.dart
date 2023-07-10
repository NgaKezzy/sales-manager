import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_manager/screens/spending/controller/spending_controller.dart';
import 'package:sales_manager/widgets/header_center.dart';

import '../../config/app.font.dart';
import '../../config/app_color.dart';
import '../../config/app_size.dart';

class UpdateSpending extends StatefulWidget {
  const UpdateSpending({super.key});

  @override
  State<UpdateSpending> createState() => _UpdateSpendingState();
}

class _UpdateSpendingState extends State<UpdateSpending> {
  void initState() {
    SpendingController spendingController = context.read<SpendingController>();
    spendingController.moneyUpdateCOntroller.text = spendingController
        .listSpending[spendingController.indexSpending].revenueMoney
        .toString();
    spendingController.noteUpdateController.text = spendingController
        .listSpending[spendingController.indexSpending].revenueNote
        .toString();
    spendingController.fundUpdate = spendingController
        .listSpending[spendingController.indexSpending].revenueFund
        .toString();
    spendingController.dateUpdate = spendingController
        .listSpending[spendingController.indexSpending].revenueDate
        .toString();
    spendingController.idSpending = spendingController
        .listSpending[spendingController.indexSpending].id
        .toString();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SpendingController spendingController = context.read<SpendingController>();
    context.watch<SpendingController>().dateUpdate;
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
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    spendingController.setDateTimeUpdate(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.calendar_month),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        spendingController.dateUpdate.split(' ')[0],
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
                            color: AppColors.blue_028f76,
                            fontWeight: FontFamily.medium),
                      ),
                      SizedBox(
                        height: AppDimens.dimens_10,
                      ),
                      TextField(
                        controller: spendingController.moneyUpdateCOntroller,
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
                                width: 1,
                                color: AppColors.black), //<-- SEE HERE
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
                              spendingController.fundUpdate = 'Tiền mặt';
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: AppDimens.dimens_100,
                              height: AppDimens.dimens_35,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: spendingController.fundUpdate ==
                                            'Tiền mặt'
                                        ? AppColors.blue_0000ff
                                        : AppColors.grey_8A8A8A,
                                    width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                'Tiền mặt',
                                style: TextStyle(
                                  color: spendingController.fundUpdate ==
                                          'Tiền mặt'
                                      ? AppColors.blue_0000ff
                                      : AppColors.grey_8A8A8A,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              spendingController.fundUpdate = 'Ví điện tử';
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: AppDimens.dimens_100,
                              height: AppDimens.dimens_35,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: spendingController.fundUpdate ==
                                            'Ví điện tử'
                                        ? AppColors.blue_0000ff
                                        : AppColors.grey_8A8A8A,
                                    width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                'Ví điện tử',
                                style: TextStyle(
                                    color: spendingController.fundUpdate ==
                                            'Ví điện tử'
                                        ? AppColors.blue_0000ff
                                        : AppColors.grey_8A8A8A),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              spendingController.fundUpdate = 'Ngân hàng';
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: AppDimens.dimens_100,
                              height: AppDimens.dimens_35,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: spendingController.fundUpdate ==
                                            'Ngân hàng'
                                        ? AppColors.blue_0000ff
                                        : AppColors.grey_8A8A8A,
                                    width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                'Ngân hàng',
                                style: TextStyle(
                                  color: spendingController.fundUpdate ==
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
                        controller: spendingController.noteUpdateController,
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
                                width: 1,
                                color: AppColors.black), //<-- SEE HERE
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
                        onPressed: () {
                          spendingController.updateSpending();
                        },
                        child: Text('Cập nhật'),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.blue_028f76),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
