import 'package:eyewear/domain/model/product_list_model/product_list_model.dart';
import 'package:eyewear/presentation/widget/custom_text.dart';
import 'package:eyewear/style/color.dart';
import 'package:eyewear/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ScreenHomeDetail extends StatelessWidget {
  const ScreenHomeDetail({super.key, required this.model});

  final ProductListModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kGrey,
      body: Stack(
        children: [
          Container(
            height: 200,
            decoration: const BoxDecoration(
              color: AppColor.kWhite,
              boxShadow: [
                BoxShadow(
                  color: AppColor.kWhite,
                  blurRadius: 5,
                  spreadRadius: 30,
                  offset: Offset(0, 5),
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
                          itemCount: 3,
                          // shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (ctx, index) {
                            return Image.asset(
                              'assets/image/sunglass.png',
                            );
                          },
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 5,
                        children: [
                          for (int i = 0; i < 4; i++)
                            Container(
                              width: 35,
                              height: 35,

                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColor.kOrange,
                                  width: 2,
                                ),
                                color: AppColor.kWhite,
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: CircleAvatar(
                                  backgroundColor: AppColor.kOrange,
                                ),
                              ),
                            ),
                        ],
                      ),
                      Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                txt: "Jade Green",
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                              CustomText(
                                txt: "Full Rim Wayfarer",
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ],
                          ),
                          GradientText(
                            "\$35",
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
                            for (int i = 0; i < 5; i++)
                              Container(
                                padding: EdgeInsets.all(28),
                                decoration: BoxDecoration(
                                  color: AppColor.kWhite,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Icon(Icons.gavel_sharp),
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
                        txt:
                            "The eyr fdsj fjksh fdksj fsdjs dfjd fskjflsdjl;lknk dfjojsdl ",
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
                      IconButton(
                        padding: EdgeInsets.only(bottom: 15),
                        onPressed: () {},
                        icon: Icon(Icons.minimize),
                      ),
                      Center(
                        child: CustomText(
                          txt: "1",
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppColor.kBlack,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.add),
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
                      const Color.fromARGB(255, 239, 96, 44),
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
