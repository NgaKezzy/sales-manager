import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sales_manager/config/app.font.dart';
import 'package:sales_manager/config/app_color.dart';
import 'package:sales_manager/config/app_size.dart';
import 'package:sales_manager/config/print_color.dart';
import 'package:sales_manager/screens/manager/controller/products_controller.dart';
import 'package:sales_manager/widgets/header_center.dart';

class CreateProduct extends StatefulWidget {
  const CreateProduct({super.key});

  @override
  State<CreateProduct> createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {
  late ProductsController productsController;
  void didChangeDependencies() {
    productsController = context.read<ProductsController>();
  }

  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) {
        return;
      }
      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      printRed('failed to pick image : $e');
    }
  }

  Future uploadFile() async {
    final storageRef =
        FirebaseStorage.instance.ref().child("images").child("${image}");
    final uploadTask = storageRef.putFile(image!);
    final snapshot = await uploadTask.whenComplete(() {});
    productsController.url = await snapshot.ref.getDownloadURL();
    printCyan(productsController.url);
  }

  @override
  Widget build(BuildContext context) {
    ProductsController productsController = context.read<ProductsController>();
    return Scaffold(
      body: Form(
        key: productsController.keyCreateProduct,
        child: Column(
          children: [
            HeaderCenter(txt_header: 'Tạo sản phẩm'),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: AppDimens.dimens_120,
                      width: MediaQuery.of(context).size.width,
                      color: AppColors.grey_8A8A8A.withOpacity(0.1),
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                  onTap: () {
                                    pickImage();
                                  },
                                  child: image != null
                                      ? SizedBox()
                                      : Container(
                                          padding: EdgeInsets.all(5),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.4,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: AppColors.black,
                                                  width: 1)),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.add_a_photo,
                                                size: 30,
                                                color: AppColors.blue_028f76,
                                              ),
                                              Expanded(child: SizedBox()),
                                              Text(
                                                'Upload image',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontFamily.medium),
                                              )
                                            ],
                                          ),
                                        )),
                            ],
                          ),
                          image != null
                              ? Image.file(
                                  image!,
                                  width: AppDimens.dimens_100,
                                  height: AppDimens.dimens_100,
                                  fit: BoxFit.cover,
                                )
                              : SizedBox(),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tên sản phẩm ',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontFamily.medium),
                          ),
                          SizedBox(
                              height: 50,
                              child: TextFormField(
                                controller:
                                    productsController.nameProductController,
                                validator: productsController.validator,
                                decoration: InputDecoration(isDense: true),
                                textAlign: TextAlign.center,
                                textCapitalization:
                                    TextCapitalization.sentences,
                              )),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                // padding: EdgeInsets.only(right: 10, left: 10),
                                width: MediaQuery.of(context).size.width - 20,
                                child: Column(children: [
                                  Text(
                                    'Số lượng',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontFamily.medium,
                                        color: AppColors.grey_8A8A8A),
                                  ),
                                  SizedBox(
                                      height: 50,
                                      child: TextFormField(
                                        controller: productsController
                                            .quantityProductController,
                                        decoration:
                                            InputDecoration(isDense: true),
                                        validator: productsController.validator,
                                        textAlign: TextAlign.center,
                                        keyboardType: TextInputType.number,
                                      )),
                                ]),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Column(children: [
                                  Text(
                                    'Giá vốn',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontFamily.medium,
                                        color: AppColors.grey_8A8A8A),
                                  ),
                                  SizedBox(
                                      height: 50,
                                      child: TextFormField(
                                        decoration:
                                            InputDecoration(isDense: true),
                                        controller: productsController
                                            .importPriceProductController,
                                        validator: productsController.validator,
                                        textAlign: TextAlign.center,
                                        keyboardType: TextInputType.number,
                                      )),
                                ]),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Column(children: [
                                  Text(
                                    'Giá bán',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontFamily.medium,
                                        color: AppColors.grey_8A8A8A),
                                  ),
                                  SizedBox(
                                      height: 50,
                                      child: TextFormField(
                                        controller: productsController
                                            .priceProductController,
                                        decoration:
                                            InputDecoration(isDense: true),
                                        validator: productsController.validator,
                                        textAlign: TextAlign.center,
                                        keyboardType: TextInputType.number,
                                      )),
                                ]),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: AppDimens.dimens_30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              AppColors.blue_028f76),
                                      onPressed: () {
                                        uploadFile();
                                        productsController.createProduct(
                                            productsController.url);
                                        productsController
                                            .priceProductController.text = '';
                                        productsController
                                            .importPriceProductController
                                            .text = '';

                                        productsController
                                            .quantityProductController
                                            .text = '';
                                        productsController
                                            .nameProductController.text = '';

                                        Navigator.pop(context);
                                      },
                                      child: Text('Tạo'))),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
