import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sales_manager/config/app.font.dart';
import 'package:sales_manager/config/app_size.dart';
import 'package:sales_manager/config/print_color.dart';
import '../../../config/app_color.dart';

class Warehouse extends StatelessWidget {
  Warehouse({super.key});

  String check = 'product is out';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppDimens.dimens_10, vertical: AppDimens.dimens_10),
      color: AppColors.grey_8A8A8A.withOpacity(0.2),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              height: AppDimens.dimens_260,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10),
                // boxShadow: [
                //   BoxShadow(
                //       color: AppColors.grey_8A8A8A,
                //       offset: Offset(0, 2),
                //       blurRadius: 2)
                // ]
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          check = 'warehouse value';
                          printRed('check = ' + check.toString());
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          height: AppDimens.dimens_100,
                          width: MediaQuery.of(context).size.width * 0.43,
                          decoration: BoxDecoration(
                            color: AppColors.grey_8A8A8A.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset('assets/svg/money.svg',
                                  height: 25, color: AppColors.green_55b135),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    '100.000.000',
                                    style: TextStyle(
                                        fontSize: AppDimens.dimens_18,
                                        fontWeight: FontFamily.semiBold),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'đ',
                                    style: TextStyle(
                                        fontSize: AppDimens.dimens_18,
                                        fontWeight: FontFamily.semiBold),
                                  ),
                                ],
                              ),
                              Text(
                                'Giá trị kho',
                                style: TextStyle(
                                    fontSize: AppDimens.dimens_15,
                                    color: AppColors.grey_8A8A8A),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          check = 'quantity';
                          printRed('check = ' + check.toString());
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          height: AppDimens.dimens_100,
                          width: MediaQuery.of(context).size.width * 0.43,
                          decoration: BoxDecoration(
                            color: AppColors.grey_8A8A8A.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset('assets/svg/container.svg',
                                  height: 25, color: AppColors.red_FF5151),
                              Text(
                                '105',
                                style: TextStyle(
                                    fontSize: AppDimens.dimens_18,
                                    fontWeight: FontFamily.semiBold),
                              ),
                              Text(
                                'Số lượng',
                                style: TextStyle(
                                    fontSize: AppDimens.dimens_15,
                                    color: AppColors.grey_8A8A8A),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          check = 'remaining products';
                          printRed('check = ' + check.toString());
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          height: AppDimens.dimens_100,
                          width: MediaQuery.of(context).size.width * 0.43,
                          decoration: BoxDecoration(
                            color: AppColors.grey_8A8A8A.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset('assets/svg/cart-check.svg',
                                  height: 25, color: AppColors.blue_0000ff),
                              Text(
                                '15',
                                style: TextStyle(
                                    fontSize: AppDimens.dimens_18,
                                    fontWeight: FontFamily.semiBold),
                              ),
                              Text(
                                'Sản phẩm còn bán',
                                style: TextStyle(
                                    fontSize: AppDimens.dimens_15,
                                    color: AppColors.grey_8A8A8A),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          check = 'product is out';
                          printRed('check = ' + check.toString());
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          height: AppDimens.dimens_100,
                          width: MediaQuery.of(context).size.width * 0.43,
                          decoration: BoxDecoration(
                            color: AppColors.grey_8A8A8A.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset('assets/svg/cart-close.svg',
                                  height: 25, color: AppColors.red_d31900),
                              Text(
                                '105',
                                style: TextStyle(
                                    fontSize: AppDimens.dimens_18,
                                    fontWeight: FontFamily.semiBold),
                              ),
                              Text(
                                'Sản phẩm hết hàng',
                                style: TextStyle(
                                    fontSize: AppDimens.dimens_15,
                                    color: AppColors.grey_8A8A8A),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            if (check == 'warehouse value') WarehouseValue(),
            if (check == 'quantity') Quantity(),
            if (check == 'remaining products') RemainingProducts(),
            if (check == 'product is out') ProductIsOut(),
            SizedBox(
              // để cuộn hết đc trang
              height: 80,
            )
          ],
        ),
      ),
    );
  }
}

class ProductIsOut extends StatelessWidget {
  const ProductIsOut({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tổng quan hàng hết hàng',
            style: TextStyle(
                fontSize: AppDimens.dimens_16, fontWeight: FontFamily.medium),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Sản phẩm',
            style: TextStyle(
                fontSize: AppDimens.dimens_13, color: AppColors.grey_8A8A8A),
          ),
          SizedBox(
            height: 20,
          ),
          ItemProductIsOut()
        ],
      ),
    );
    ;
  }
}

class ItemProductIsOut extends StatelessWidget {
  const ItemProductIsOut({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
      width: MediaQuery.of(context).size.width,
      height: AppDimens.dimens_80,
      color: AppColors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                '1',
                style: TextStyle(
                    fontWeight: FontFamily.medium,
                    fontSize: AppDimens.dimens_16,
                    color: AppColors.black),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.grey_A49797),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Loa',
                    style: TextStyle(
                        fontSize: AppDimens.dimens_16,
                        fontWeight: FontFamily.medium),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Mã : ',
                        style: TextStyle(
                            fontSize: AppDimens.dimens_16,
                            color: AppColors.grey_8A8A8A),
                      ),
                      Text(
                        'SP0001',
                        style: TextStyle(
                            fontSize: AppDimens.dimens_16,
                            color: AppColors.grey_8A8A8A),
                      ),
                      Expanded(child: SizedBox()),
                    ],
                  ),
                ],
              ))
            ],
          ),
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width,
            color: AppColors.grey_8A8A8A,
          )
        ],
      ),
    );
  }
}

class ItemRemainingProducts extends StatelessWidget {
  const ItemRemainingProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
      width: MediaQuery.of(context).size.width,
      height: AppDimens.dimens_80,
      color: AppColors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                '1',
                style: TextStyle(
                    fontWeight: FontFamily.medium,
                    fontSize: AppDimens.dimens_16,
                    color: AppColors.black),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.grey_A49797),
              ),
              Expanded(
                  child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Loa',
                        style: TextStyle(
                            fontSize: AppDimens.dimens_16,
                            fontWeight: FontFamily.medium),
                      ),
                      Text(
                        '52',
                        style: TextStyle(
                            fontSize: AppDimens.dimens_16,
                            color: AppColors.red_FC0000,
                            fontWeight: FontFamily.medium),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Mã : ',
                        style: TextStyle(
                            fontSize: AppDimens.dimens_16,
                            color: AppColors.grey_8A8A8A),
                      ),
                      Text(
                        'SP0001',
                        style: TextStyle(
                            fontSize: AppDimens.dimens_16,
                            color: AppColors.grey_8A8A8A),
                      ),
                      Expanded(child: SizedBox()),
                      Text(
                        'GT : ',
                        style: TextStyle(
                            fontSize: AppDimens.dimens_16,
                            color: AppColors.grey_8A8A8A),
                      ),
                      Text(
                        '50.254.165',
                        style: TextStyle(
                            fontSize: AppDimens.dimens_16,
                            color: AppColors.grey_8A8A8A),
                      )
                    ],
                  ),
                ],
              ))
            ],
          ),
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width,
            color: AppColors.grey_8A8A8A,
          )
        ],
      ),
    );
  }
}

class RemainingProducts extends StatelessWidget {
  const RemainingProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tổng quan hàng còn bán',
            style: TextStyle(
                fontSize: AppDimens.dimens_16, fontWeight: FontFamily.medium),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Sản phẩm',
                style: TextStyle(
                    fontSize: AppDimens.dimens_13,
                    color: AppColors.grey_8A8A8A),
              ),
              Text(
                'Số lượng',
                style: TextStyle(
                    fontSize: AppDimens.dimens_13,
                    color: AppColors.grey_8A8A8A),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ItemRemainingProduct()
        ],
      ),
    );
    ;
  }
}

class ItemRemainingProduct extends StatelessWidget {
  const ItemRemainingProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
      width: MediaQuery.of(context).size.width,
      height: AppDimens.dimens_80,
      color: AppColors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                '1',
                style: TextStyle(
                    fontWeight: FontFamily.medium,
                    fontSize: AppDimens.dimens_16,
                    color: AppColors.black),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.grey_A49797),
              ),
              Expanded(
                  child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Loa',
                        style: TextStyle(
                            fontSize: AppDimens.dimens_16,
                            fontWeight: FontFamily.medium),
                      ),
                      Text(
                        '52',
                        style: TextStyle(
                            fontSize: AppDimens.dimens_16,
                            color: AppColors.red_FC0000,
                            fontWeight: FontFamily.medium),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Mã : ',
                        style: TextStyle(
                            fontSize: AppDimens.dimens_16,
                            color: AppColors.grey_8A8A8A),
                      ),
                      Text(
                        'SP0001',
                        style: TextStyle(
                            fontSize: AppDimens.dimens_16,
                            color: AppColors.grey_8A8A8A),
                      ),
                      Expanded(child: SizedBox()),
                      Text(
                        'GT : ',
                        style: TextStyle(
                            fontSize: AppDimens.dimens_16,
                            color: AppColors.grey_8A8A8A),
                      ),
                      Text(
                        '50.254.165',
                        style: TextStyle(
                            fontSize: AppDimens.dimens_16,
                            color: AppColors.grey_8A8A8A),
                      )
                    ],
                  ),
                ],
              ))
            ],
          ),
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width,
            color: AppColors.grey_8A8A8A,
          )
        ],
      ),
    );
  }
}

class Quantity extends StatelessWidget {
  const Quantity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tổng quan số lượng hàng',
            style: TextStyle(
                fontSize: AppDimens.dimens_16, fontWeight: FontFamily.medium),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Sản phẩm',
                style: TextStyle(
                    fontSize: AppDimens.dimens_13,
                    color: AppColors.grey_8A8A8A),
              ),
              Text(
                'Số lượng',
                style: TextStyle(
                    fontSize: AppDimens.dimens_13,
                    color: AppColors.grey_8A8A8A),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ItemWarehouseQuantity()
        ],
      ),
    );
  }
}

class ItemWarehouseQuantity extends StatelessWidget {
  const ItemWarehouseQuantity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
      width: MediaQuery.of(context).size.width,
      height: AppDimens.dimens_80,
      color: AppColors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                '1',
                style: TextStyle(
                    fontWeight: FontFamily.medium,
                    fontSize: AppDimens.dimens_16,
                    color: AppColors.black),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.grey_A49797),
              ),
              Expanded(
                  child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Loa',
                        style: TextStyle(
                            fontSize: AppDimens.dimens_16,
                            fontWeight: FontFamily.medium),
                      ),
                      Text(
                        '52',
                        style: TextStyle(
                            fontSize: AppDimens.dimens_16,
                            color: AppColors.red_FC0000,
                            fontWeight: FontFamily.medium),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Mã : ',
                        style: TextStyle(
                            fontSize: AppDimens.dimens_16,
                            color: AppColors.grey_8A8A8A),
                      ),
                      Text(
                        'SP0001',
                        style: TextStyle(
                            fontSize: AppDimens.dimens_16,
                            color: AppColors.grey_8A8A8A),
                      ),
                      Expanded(child: SizedBox()),
                      Text(
                        'GT : ',
                        style: TextStyle(
                            fontSize: AppDimens.dimens_16,
                            color: AppColors.grey_8A8A8A),
                      ),
                      Text(
                        '50.254.165',
                        style: TextStyle(
                            fontSize: AppDimens.dimens_16,
                            color: AppColors.grey_8A8A8A),
                      )
                    ],
                  ),
                ],
              ))
            ],
          ),
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width,
            color: AppColors.grey_8A8A8A,
          )
        ],
      ),
    );
  }
}

class WarehouseValue extends StatelessWidget {
  const WarehouseValue({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tổng quan giá trị kho',
            style: TextStyle(
                fontSize: AppDimens.dimens_16, fontWeight: FontFamily.medium),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Sản phẩm',
                style: TextStyle(
                    fontSize: AppDimens.dimens_13,
                    color: AppColors.grey_8A8A8A),
              ),
              Text(
                'Giá trị',
                style: TextStyle(
                    fontSize: AppDimens.dimens_13,
                    color: AppColors.grey_8A8A8A),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ItemWarehouseValue(),
          ItemWarehouseValue(),
          ItemWarehouseValue(),
          ItemWarehouseValue(),
        ],
      ),
    );
  }
}

class ItemWarehouseValue extends StatelessWidget {
  const ItemWarehouseValue({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
      width: MediaQuery.of(context).size.width,
      height: AppDimens.dimens_80,
      color: AppColors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                '1',
                style: TextStyle(
                    fontWeight: FontFamily.medium,
                    fontSize: AppDimens.dimens_16,
                    color: AppColors.black),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.grey_A49797),
              ),
              Expanded(
                  child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Loa',
                        style: TextStyle(
                            fontSize: AppDimens.dimens_16,
                            fontWeight: FontFamily.medium),
                      ),
                      Text(
                        '52.005.666',
                        style: TextStyle(
                            fontSize: AppDimens.dimens_16,
                            color: AppColors.red_FC0000,
                            fontWeight: FontFamily.medium),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Mã : ',
                        style: TextStyle(
                            fontSize: AppDimens.dimens_16,
                            color: AppColors.grey_8A8A8A),
                      ),
                      Text(
                        'SP0001',
                        style: TextStyle(
                            fontSize: AppDimens.dimens_16,
                            color: AppColors.grey_8A8A8A),
                      ),
                      Expanded(child: SizedBox()),
                      Text(
                        'SL :',
                        style: TextStyle(
                            fontSize: AppDimens.dimens_16,
                            color: AppColors.grey_8A8A8A),
                      ),
                      Text(
                        '50',
                        style: TextStyle(
                            fontSize: AppDimens.dimens_16,
                            color: AppColors.grey_8A8A8A),
                      )
                    ],
                  ),
                ],
              ))
            ],
          ),
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width,
            color: AppColors.grey_8A8A8A,
          )
        ],
      ),
    );
  }
}
