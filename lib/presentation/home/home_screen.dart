import 'dart:math' as math;

import 'package:eyewear/presentation/home/screen/home_detail_screen.dart';
import 'package:eyewear/presentation/widget/custom_text.dart';
import 'package:eyewear/style/color.dart';
import 'package:eyewear/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});

  final List<String> categories = [
    "All",
    "Trending",
    "Recommended",
    "Best Seller",
  ];

  @override
  Widget build(BuildContext context) {
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
                  HexagonButton(),
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                        child: ListView.separated(
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
                                color: AppColor.kBlack,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          itemCount: categories.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                    ],
                  ),
                  Gap(15),
                  GridView.builder(
                    itemCount: 6,
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.9,
                    ),
                    itemBuilder: (ctx, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ScreenHomeDetail(),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppColor.kWhite,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            spacing: 5,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 100,
                                width: context.mq().width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColor.kOrangeLight,
                                ),
                              ),
                              CustomText(
                                txt: "Urban Edge",
                                fontWeight: FontWeight.w500,
                              ),
                              Gap(10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Stack(
                                    children: [
                                      for (int i = 0; i < 4; i++)
                                        Padding(
                                          padding: EdgeInsets.only(left: i * 8),
                                          child: CircleAvatar(
                                            radius: 8,
                                            backgroundColor: Colors.red,
                                          ),
                                        ),
                                    ],
                                  ),
                                  CustomText(
                                    txt: "\$250",
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HexagonButton extends StatelessWidget {
  const HexagonButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: HexagonClipper(),
      child: Container(
        width: 80,
        height: 80,
        color: AppColor.kWhite,
        child: const Center(
          child: Icon(
            Icons.home,
            color: Colors.black,
            size: 32,
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
