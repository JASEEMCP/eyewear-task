import 'dart:math';

import 'package:eyewear/domain/model/product_list_model/product_list_model.dart';
import 'package:eyewear/domain/provider/product_list_provider.dart';
import 'package:eyewear/presentation/home/screen/home_detail_screen.dart';
import 'package:eyewear/presentation/widget/custom_text.dart';
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
    final postsAsync = ref.watch(productListProvider);
    final shapeListAsync = ref.watch(shapeListProvider);
    return Scaffold(
      backgroundColor: AppColor.kOrange,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              width: context.mq().width,
              decoration: BoxDecoration(
                color: AppColor.kWhite,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(),
            ),

            SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),

              child: Column(
                children: [
                  Gap(20),
                  shapeListAsync.maybeWhen(
                    orElse: () => const SizedBox.shrink(),
                    loading: () => Center(
                      child: CircularProgressIndicator(),
                    ),
                    error: (error, stackTrace) => Center(
                      child: Text('Error: $error'),
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
                          spacing: 5,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  txt: "Scan Face with AI",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),

                                CustomText(
                                  txt: "Customized sunglasses\nMade for you",
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
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Gap(25),
                  postsAsync.maybeWhen(
                    orElse: () => Container(),
                    loading: () => Center(
                      child: CircularProgressIndicator(),
                    ),
                    error: (error, stackTrace) => Center(
                      child: Text('Error: $error'),
                    ),
                    data: (data) => _buildProductList(context, data),
                  ),
                ],
              ),
            ),
          ],
        ),
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
                            : Colors.white,
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
                      fontWeight: FontWeight.w500,
                    ),
                    Gap(10),
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
                                  left: i * 8,
                                ),
                                child: CircleAvatar(
                                  radius: 8,
                                  backgroundColor: getRandomColor(),
                                ),
                              ),
                          ],
                        ),
                        CustomText(
                          txt: "\$${data[index].price ?? "N/A"}",
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class HexagonButton extends StatelessWidget {
  const HexagonButton({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: HexagonClipper(),
      child: Container(
        width: 60,
        height: 80,
        color: AppColor.kWhite,
        child: Center(
          child: Image.network(
            imagePath,
            fit: BoxFit.contain,
            color: Colors.black,
            errorBuilder: (context, error, stackTrace) => Center(
              child: Icon(
                Icons.image_not_supported_rounded,
              ),
            ),
            height: 32,
          ),
        ),
      ),
    );
  }
}

class HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final w = size.width;
    final h = size.height;

    path.moveTo(w * 0.5, 0);
    path.lineTo(w, h * 0.25);
    path.lineTo(w, h * 0.65);
    // final newX = (w * 0.5) + w * math.cos(120);
    // final newY = 0 + w * math.sin(120);
    path.lineTo(w * 0.5, h);
    path.lineTo(0, h * 0.65);
    path.lineTo(0, h * 0.25);
    path.close();

    return path;
  }

  

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// class CurvedHeader extends StatelessWidget {
//   const CurvedHeader({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 160,
//       child: Stack(
//         children: [
//           // Orange curved background
//           Align(
//             alignment: Alignment.topRight,
//             child: ClipPath(
//               clipper: CurvedShapeClipper(),
//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: 160,
//                 color: Colors.deepOrange,
//               ),
//             ),
//           ),

//           // Content (Text + Notification)
//           Padding(
//             padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
//             child: Row(
//               children: [
//                 // Left texts
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: const [
//                       Text(
//                         "Next-Gen Shades.",
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.w400,
//                           color: Colors.black87,
//                         ),
//                       ),
//                       SizedBox(height: 4),
//                       Text(
//                         "Face-Mapped Fit.",
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 // Notification Icon inside white circle
//                 Container(
//                   decoration: const BoxDecoration(
//                     color: Colors.white,
//                     shape: BoxShape.circle,
//                   ),
//                   padding: const EdgeInsets.all(10),
//                   child: Stack(
//                     clipBehavior: Clip.none,
//                     children: [
//                       const Icon(
//                         Icons.notifications_none,
//                         color: Colors.black,
//                         size: 22,
//                       ),
//                       // Red dot badge
//                       Positioned(
//                         top: -2,
//                         right: -2,
//                         child: Container(
//                           width: 8,
//                           height: 8,
//                           decoration: const BoxDecoration(
//                             color: Colors.red,
//                             shape: BoxShape.circle,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Custom clipper for orange curved shape
// class CurvedShapeClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();

//     path.lineTo(size.width * 0.75, 0); // straight line till 75% width
//     path.quadraticBezierTo(
//       size.width, size.height * 0.2, // control point
//       size.width, size.height * 0.5, // end point
//     );
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.close();

//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
// }
