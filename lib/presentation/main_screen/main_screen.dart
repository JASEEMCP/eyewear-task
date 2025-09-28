import 'package:eyewear/presentation/home/home_screen.dart';
import 'package:eyewear/presentation/widget/hexogon_button.dart';
import 'package:eyewear/style/color.dart';
import 'package:flutter/material.dart';

class ScreenMain extends StatelessWidget {
  ScreenMain({super.key});

  final ValueNotifier<int> currentIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: currentIndex,
        builder: (context, index, child) {
          return Stack(
            children: [
              IndexedStack(
                index: index,
                children: [
                  ScreenHome(),
                  Container(),
                  Container(),
                  Container(),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildItem(true),
                    _buildNormalItem(),
                    _buildNormalItem(),

                    _buildItem(false),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  SizedBox _buildItem(bool isLeft) {
    return SizedBox(
      height: 100,
      width: 100,
      child: Stack(
        children: [
          Align(
            alignment: Alignment(0, -0.1),
            child: HexagonButton(
              imagePath: "",
              width: 50,
              height: 70,
            ),
          ),
          CustomPaint(
            size: const Size(
              150,
              100,
            ), // adjust size
            painter: isLeft
                ? SquareHexagonTopLeftRadiusPainter()
                : SquareHexagonTopRightRadiusPainter(),
          ),
        ],
      ),
    );
  }

  SizedBox _buildNormalItem() {
    return SizedBox(
      height: 100,
      width: 100,
      child: Stack(
        children: [
          Align(
            alignment: Alignment(0, -0.1),
            child: HexagonButton(
              imagePath: "",
              width: 50,
              height: 70,
            ),
          ),
          CustomPaint(
            size: const Size(
              150,
              100,
            ), // adjust size
            painter: SquareHexagonPainter(),
          ),
        ],
      ),
    );

    // Align(
    //   alignment: Alignment.bottomCenter,
    //   child: Container(
    //     padding: const EdgeInsets.symmetric(
    //       vertical: 20,
    //       horizontal: 20,
    //     ),
    //     decoration: BoxDecoration(
    //       color: AppColor.kWhite,
    //       borderRadius: const BorderRadius.only(
    //         topLeft: Radius.circular(30),
    //         topRight: Radius.circular(30),
    //       ),
    //       border: Border.all(
    //         color: Colors.black12,
    //       ),
    //     ),

    //     // your background color
    //     child: Padding(
    //       padding: const EdgeInsets.all(8.0),
    //       child: CustomPaint(
    //         size: const Size(
    //           double.maxFinite,
    //           80,
    //         ), // adjust size
    //         painter: SquareHexagonGapPainter(),
    //       ),
    //     ),
    //     //  _buildBottomNav(index),
    //   ),
    // ),

    Row _buildBottomNav(int index) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              currentIndex.value = 0;
            },
            icon: Icon(
              Icons.home,
              size: 30,
              color: index == 0 ? AppColor.kOrange : Colors.black26,
            ),
          ),
          IconButton(
            onPressed: () {
              currentIndex.value = 1;
            },
            icon: Icon(
              Icons.search,
              size: 30,
              color: index == 1 ? AppColor.kOrange : Colors.black26,
            ),
          ),
          IconButton(
            onPressed: () {
              currentIndex.value = 2;
            },
            icon: Icon(
              Icons.shopping_cart,
              size: 30,
              color: index == 2 ? AppColor.kOrange : Colors.black26,
            ),
          ),
          IconButton.filled(
            style: TextButton.styleFrom(
              backgroundColor: index == 3
                  ? AppColor.kOrangeLight
                  : Colors.black12,
            ),
            onPressed: () {
              currentIndex.value = 3;
            },
            icon: Icon(
              Icons.person,
              color: index == 3 ? AppColor.kOrange : Colors.black26,
              size: 20,
            ),
          ),
        ],
      );
    }
  }
}
