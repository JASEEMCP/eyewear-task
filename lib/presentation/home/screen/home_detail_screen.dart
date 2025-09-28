import 'dart:math';

import 'package:eyewear/domain/model/product_list_model/product_list_model.dart';
import 'package:eyewear/presentation/widget/custom_text.dart';
import 'package:eyewear/style/color.dart';
import 'package:eyewear/utils/extension.dart';
import 'package:eyewear/utils/string.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:palette_generator_master/palette_generator_master.dart';

class ScreenHomeDetail extends StatelessWidget {
  ScreenHomeDetail({super.key, required this.model});

  final ProductListModel model;

  final Random _random = Random();

  Color getRandomColor() {
    return Color.fromARGB(
      255, // full opacity
      _random.nextInt(256), // R
      _random.nextInt(256), // G
      _random.nextInt(256), // B
    );
  }

  toTitleCase(String text) {
    if (text.isEmpty) return text;
    return text
        .split(' ')
        .map(
          (word) => word.isNotEmpty
              ? '${word[0].toUpperCase()}${word.substring(1)}'
              : '',
        )
        .join(' ');
  }

  final ValueNotifier _currentPrice = ValueNotifier(0.0);
  Future<Color> generatePalette(String imageProvider) async {
    // Generate palette
    final PaletteGeneratorMaster paletteGenerator =
        await PaletteGeneratorMaster.fromImageProvider(
          NetworkImage(imageProvider),
        );
    return paletteGenerator.dominantColor?.color ?? Colors.black12;
  }

  @override
  Widget build(BuildContext context) {
    _currentPrice.value = model.price ?? 0.0;
    return Scaffold(
      backgroundColor: AppColor.kGrey,
      body: Stack(
        children: [
          Container(
            height: 200,
            width: context.mq().width,
            decoration: const BoxDecoration(
              color: AppColor.kWhite,
              boxShadow: [
                BoxShadow(
                  color: AppColor.kWhite,
                  blurRadius: 30,
                  spreadRadius: 0.5,
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              spacing: 15,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: context.mq().width,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: const BoxDecoration(
                    color: AppColor.kWhite,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(kToolbarHeight + 30),
                      SizedBox(
                        height: 180,
                        width: context.mq().width,
                        child: PageView.builder(
                          // padding: EdgeInsets.zero,
                          itemCount: model.images?.length ?? 0,
                          // shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (ctx, index) {
                            return Image.network(
                              getImageUrl(model.images?[index].image ?? ""),
                              errorBuilder: (context, error, stackTrace) =>
                                  Center(
                                    child: Icon(
                                      Icons.image_not_supported_outlined,
                                    ),
                                  ),
                            );
                          },
                        ),
                      ),

                      _buildColorSection(),
                      Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                txt: model.name ?? "N/A",
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                              CustomText(
                                txt: toTitleCase(model.metaTitle ?? "N/A"),
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ],
                          ),
                          ValueListenableBuilder(
                            valueListenable: _currentPrice,
                            builder: (context, price, child) {
                              return GradientText(
                                "\$$price",
                                style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.w600,
                                ),
                                gradient: LinearGradient(
                                  stops: [0, 1],
                                  colors: [
                                    AppColor.kGreyDark,
                                    const Color.fromARGB(255, 239, 96, 44),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      Gap(25),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 15,
                    children: [
                      CustomText(
                        txt: "Gallery",
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          spacing: 10,
                          children: [
                            for (
                              int i = 0;
                              i < (model.images?.length ?? 0);
                              i++
                            )
                              Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: AppColor.kWhite,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Image.network(
                                  getImageUrl(model.images?[i].image ?? ""),
                                  fit: BoxFit.contain,
                                  height: 25,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Center(
                                        child: Icon(
                                          Icons.image_not_supported_outlined,
                                        ),
                                      ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      CustomText(
                        txt: "Description",
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                      ),
                      CustomText(
                        txt: model.description ?? 'N/A',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: AppColor.kGreyDark,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            txt: "Size",
                            fontWeight: FontWeight.w600,
                            fontSize: 22,
                          ),
                          Row(
                            spacing: 10,
                            children: [
                              _buildSizeBtn("M"),
                              _buildSizeBtn("W"),
                              _buildSizeBtn("EW"),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: kToolbarHeight),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: CircleAvatar(
                radius: 25,
                backgroundColor: AppColor.kGrey,
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 15,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          spacing: 10,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(2),
                decoration: ShapeDecoration(
                  shape: StadiumBorder(),
                  gradient: LinearGradient(
                    stops: [0, 1],
                    colors: [
                      AppColor.kGreyDark,
                      const Color.fromARGB(255, 239, 96, 44),
                    ],
                  ),
                ),
                child: Container(
                  height: 65,
                  alignment: Alignment.center,
                  decoration: ShapeDecoration(
                    shape: StadiumBorder(),
                    color: AppColor.kGrey,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: IconButton(
                          padding: EdgeInsets.only(bottom: 15),
                          onPressed: () {
                            _itemQuantity.value = max(
                              0,
                              _itemQuantity.value - 1,
                            );
                          },
                          icon: Icon(Icons.minimize),
                        ),
                      ),
                      Expanded(
                        child: ValueListenableBuilder(
                          valueListenable: _itemQuantity,
                          builder: (context, value, child) {
                            return Center(
                              child: CustomText(
                                txt: "$value",
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: AppColor.kBlack,
                              ),
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          onPressed: () {
                            _itemQuantity.value = _itemQuantity.value + 1;
                          },
                          icon: Icon(Icons.add),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: 65,

                decoration: ShapeDecoration(
                  shape: StadiumBorder(),
                  gradient: LinearGradient(
                    stops: [0, 1],
                    colors: [
                      AppColor.kGreyDark,
                      const Color.fromRGBO(230, 117, 30, 1),
                    ],
                  ),
                  // color: AppColor.kOrange,
                ),
                child: Center(
                  child: CustomText(
                    txt: "Buy Now",
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColor.kWhite,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  final ValueNotifier _currentColorId = ValueNotifier(0);
  final ValueNotifier _itemQuantity = ValueNotifier(0);

  Row _buildColorSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 5,
      children: [
        for (int i = 0; i < (model.colorOptions?.length ?? 0); i++)
          GestureDetector(
            onTap: () {
              _currentColorId.value = model.colorOptions?[i].optionValueId ?? 0;
              _currentPrice.value =
                  model.colorOptions?[i].price ?? model.price ?? 0.0;
            },
            child: FutureBuilder(
              future: generatePalette(
                getImageUrl(model.colorOptions?[i].optionImage),
              ),
              builder: (context, snap) {
                return ValueListenableBuilder(
                  valueListenable: _currentColorId,
                  builder: (context, id, child) {
                    return Container(
                      width: 40,
                      height: 40,
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        border: id == model.colorOptions?[i].optionValueId
                            ? Border.all(
                                color: snap.hasData
                                    ? snap.requireData
                                    : Colors.black26,
                                width: 3,
                              )
                            : null,
                        color: AppColor.kWhite,
                        shape: BoxShape.circle,
                      ),

                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Image.network(
                          getImageUrl(model.colorOptions?[i].optionImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
      ],
    );
  }

  Container _buildSizeBtn(String txt) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 8,
      ),
      decoration: ShapeDecoration(
        shape: StadiumBorder(),
        color: AppColor.kWhite,
      ),
      child: CustomText(
        txt: txt,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    required this.gradient,
    this.style,
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}
