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
                    Expanded(
                      child: index == 0
                          ? _buildItem(true, Icons.home)
                          : _buildIcon(0, Icons.home_outlined, 20),
                    ),
                    Expanded(
                      child: index == 1
                          ? _buildNormalItem(Icons.search)
                          : _buildIcon(1, Icons.search, null),
                    ),
                    Expanded(
                      child: index == 2
                          ? _buildNormalItem(Icons.shopping_cart)
                          : _buildIcon(2, Icons.shopping_cart_outlined, null),
                    ),
                    Expanded(
                      child: index == 3
                          ? _buildItem(false, Icons.people)
                          : _buildIcon(3, Icons.people_outline, 20),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  GestureDetector _buildIcon(int index, IconData icon, double? radius) {
    return GestureDetector(
      onTap: () {
        currentIndex.value = index;
      },
      child: Container(
        height: 75,
        width: 100,
        padding: const EdgeInsets.symmetric(
          // vertical: 20,
          // horizontal: 20,
        ),
        decoration: BoxDecoration(
          color: AppColor.kWhite,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(radius ?? 0),
          ),
        ),

        // your background color
        child: Icon(
          icon,
          size: 30,
          color: index == 0 ? AppColor.kOrange : Colors.black26,
        ),
        //  _buildBottomNav(index),
      ),
    );
  }

  SizedBox _buildItem(bool isLeft, IconData icon) {
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
              color: AppColor.kOrange,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Icon(
                  icon,
                  color: AppColor.kWhite,
                ),
              ),
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

  SizedBox _buildNormalItem(IconData icon) {
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
              color: AppColor.kOrange,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Icon(
                  icon,
                  color: AppColor.kWhite,
                ),
              ),
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
  }
}
