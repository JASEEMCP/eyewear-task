import 'dart:math';

import 'package:eyewear/domain/model/product_list_model/product_list_model.dart';
import 'package:eyewear/domain/provider/product_list_provider.dart';
import 'package:eyewear/presentation/home/screen/home_detail_screen.dart';
import 'package:eyewear/presentation/widget/custom_text.dart';
import 'package:eyewear/presentation/widget/hexogon_button.dart';
import 'package:eyewear/presentation/widget/shimmer_effect.dart';
import 'package:eyewear/style/color.dart';
import 'package:eyewear/utils/extension.dart';
import 'package:eyewear/utils/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class ScreenHome extends ConsumerWidget {
  ScreenHome({super.key});

  final List<String> categories = [
    "All",
    "Trending",
    "Recommended",
    "Best Seller",
  ];

  final Random _random = Random();

  Color getRandomColor() {
    return Color.fromARGB(
      255, // full opacity
      _random.nextInt(256), // R
      _random.nextInt(256), // G
      _random.nextInt(256), // B
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var postsAsync = ref.watch(productListProvider);
    var shapeListAsync = ref.watch(shapeListProvider);
    ref.watch(filteredProductProvider);
    return Scaffold(
      backgroundColor: AppColor.kOrange,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: context.mq().width,

              decoration: BoxDecoration(
                color: AppColor.kWhite,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,

                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                            top: kToolbarHeight,
                            bottom: 10,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                txt: "Next-Gen Shades.",
                                fontSize: 24,
                                maxLines: 1,
                              ),
                              CustomText(
                                txt: "Face-Mapped Fit.",
                                fontSize: 26,
                                maxLines: 1,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                        ),
                      ),

                      Expanded(
                        child: Container(
                          height: kToolbarHeight + 15,
                          decoration: BoxDecoration(
                            color: AppColor.kOrange,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CircleAvatar(
                                backgroundColor: AppColor.kWhite,
                                radius: 23,
                                child: Icon(
                                  Icons.notifications_none,
                                  color: AppColor.kBlack,
                                  size: 20,
                                ),
                              ),
                              Gap(20),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),

              child: Column(
                children: [
                  Gap(20),
                  shapeListAsync.maybeWhen(
                    orElse: () => const SizedBox.shrink(),
                    loading: () => _buildLoadingEffect(),

                    error: (error, stackTrace) => Column(
                      children: [
                        CustomText(
                          txt: "Network Error",
                          color: AppColor.kWhite,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            ref.refresh(shapeListProvider);
                          },

                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.kWhite,
                          ),
                          child: CustomText(
                            txt: "Try Again",
                            color: AppColor.kBlack,
                          ),
                        ),
                      ],
                    ),

                    data: (data) => SizedBox(
                      height: kToolbarHeight + 50,

                      child: ListView.separated(
                        padding: EdgeInsets.only(left: 20),
                        separatorBuilder: (context, index) => Gap(25),
                        itemCount: data.length,

                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (ctx, index) => Column(
                          children: [
                            HexagonButton(
                              imagePath: getImageUrl(data[index].image ?? ""),
                            ),
                            CustomText(
                              txt: data[index].name ?? "N/A",
                              fontSize: 12,
                              color: AppColor.kWhite,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  shapeListAsync.maybeWhen(
                    orElse: () => const SizedBox.shrink(),
                    loading: () => ShimmerEffect(
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Container(
                          height: 150,
                          width: context.mq().width,
                          clipBehavior: Clip.hardEdge,

                          decoration: BoxDecoration(
                            color: AppColor.kWhite,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),

                    data: (data) => Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: TextField(
                            onChanged: (value) {
                              ref.read(searchQueryProvider.notifier).state =
                                  value;
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColor.kGrey,
                              prefixIcon: Icon(
                                Icons.search,
                                color: AppColor.kGreyDark,
                              ),
                              hintText: "Search for your favorite shades",
                              hintStyle: TextStyle(
                                color: AppColor.kGreyDark,
                                fontSize: 14,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 0,
                                horizontal: 20,
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Container(
                            width: context.mq().width,
                            clipBehavior: Clip.hardEdge,

                            decoration: BoxDecoration(
                              color: AppColor.kWhite,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        txt: "Scan Face with AI",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),

                                      CustomText(
                                        txt:
                                            "Customized sunglasses\nMade for you",
                                        fontSize: 14,
                                      ),
                                      Gap(10),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 5,
                                        ),
                                        decoration: ShapeDecoration(
                                          color: AppColor.kBlack,
                                          shape: StadiumBorder(),
                                        ),

                                        child: CustomText(
                                          txt: "Try With AI",
                                          color: AppColor.kWhite,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Image.asset(
                                    "assets/image/img-bg.png",
                                    width: 200,
                                    height: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(25),
                  postsAsync.maybeWhen(
                    orElse: () => Container(),
                    loading: () => ShimmerEffect(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 30,
                            child: ListView.separated(
                              padding: EdgeInsets.only(left: 20),
                              separatorBuilder: (context, index) => Gap(10),
                              itemBuilder: (ctx, index) => ClipRRect(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 5,
                                  ),
                                  decoration: ShapeDecoration(
                                    color: AppColor.kWhite,

                                    shape: StadiumBorder(),
                                  ),

                                  child: CustomText(
                                    txt: categories[index],

                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              itemCount: categories.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                          Gap(15),
                          GridView.builder(
                            itemCount: 5,
                            shrinkWrap: true,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: 0.85,
                                  mainAxisExtent: 220,
                                ),
                            itemBuilder: (ctx, index) {
                              return Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: AppColor.kWhite,
                                  borderRadius: BorderRadius.circular(33),
                                ),
                                child: Column(
                                  spacing: 5,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 100,
                                      width: context.mq().width,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: AppColor.kOrangeLight,
                                      ),
                                    ),
                                    CustomText(
                                      txt: "N/A",
                                      fontWeight: FontWeight.w500,
                                    ),
                                    Gap(10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Stack(
                                          children: [
                                            for (int i = 0; i < 5; i++)
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  left: i * 8,
                                                ),
                                                child: CircleAvatar(
                                                  radius: 8,
                                                  backgroundColor:
                                                      getRandomColor(),
                                                ),
                                              ),
                                          ],
                                        ),
                                        CustomText(
                                          txt: "\$ ffdfsdf",
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    error: (error, stackTrace) => Center(
                      child: Column(
                        children: [
                          CustomText(
                            txt: "Network Error",
                            color: AppColor.kWhite,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              postsAsync = ref.refresh(productListProvider);
                              // ref.refresh(shapeListProvider);
                            },

                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.kWhite,
                            ),
                            child: CustomText(
                              txt: "Try Again",
                              color: AppColor.kBlack,
                            ),
                          ),
                        ],
                      ),
                    ),
                    data: (data) {
                      final query = ref
                          .watch(searchQueryProvider)
                          .toLowerCase();

                      final filteredProducts = query.isEmpty
                          ? data
                          : data
                                .where(
                                  (p) => (p.name ?? "").toLowerCase().contains(
                                    query,
                                  ),
                                )
                                .toList();

                      return _buildProductList(context, filteredProducts);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView _buildLoadingEffect() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: NeverScrollableScrollPhysics(),
      child: Row(
        spacing: 20,
        children: [
          Gap(15),
          for (int i = 0; i < 8; i++)
            ShimmerEffect(
              child: const HexagonButton(
                imagePath: "imagePath",
              ),
            ),
        ],
      ),
    );
  }

  Column _buildProductList(BuildContext context, List<ProductListModel> data) {
    ValueNotifier currentTab = ValueNotifier("All");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 30,
          child: ListView.separated(
            padding: EdgeInsets.only(left: 20),
            separatorBuilder: (context, index) => Gap(10),
            itemBuilder: (ctx, index) => ClipRRect(
              child: GestureDetector(
                onTap: () => currentTab.value = categories[index],
                child: ValueListenableBuilder(
                  valueListenable: currentTab,
                  builder: (context, value, child) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: ShapeDecoration(
                        color: value == categories[index]
                            ? AppColor.kWhite
                            : Colors.transparent,
                        shape: StadiumBorder(),
                      ),

                      child: CustomText(
                        txt: categories[index],
                        fontWeight: value == categories[index]
                            ? FontWeight.w500
                            : FontWeight.w400,
                        color: value == categories[index]
                            ? AppColor.kBlack
                            : AppColor.kWhite,
                        fontSize: 14,
                      ),
                    );
                  },
                ),
              ),
            ),
            itemCount: categories.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
          ),
        ),
        Gap(15),

        GridView.builder(
          itemCount: data.length,
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 20),
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.85,
            mainAxisExtent: 195,
          ),
          itemBuilder: (ctx, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScreenHomeDetail(
                      model: data[index],
                    ),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColor.kWhite,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  spacing: 5,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 105,
                      width: context.mq().width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColor.kOrangeLight,
                      ),
                      child: Image.network(
                        getImageUrl(data[index].images?[0].image.toString()),
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) => Center(
                          child: Icon(Icons.image_not_supported_rounded),
                        ),
                        height: 20,
                      ),
                    ),
                    CustomText(
                      txt: data[index].name ?? "N/A",
                      fontWeight: FontWeight.w600,
                    ),
                    Gap(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          children: [
                            for (
                              int i = 0;
                              i < (data[index].colorOptions?.length ?? 0);
                              i++
                            )
                              Padding(
                                padding: EdgeInsets.only(
                                  left: i * 15,
                                ),
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),

                                  child: Image.network(
                                    getImageUrl(
                                      data[index].colorOptions?[i].optionImage,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        CustomText(
                          txt: "\$${data[index].price ?? "N/A"}",
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        Gap(100),
      ],
    );
  }
}
