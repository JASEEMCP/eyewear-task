import 'package:eyewear/presentation/home/home_screen.dart';
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
                ],
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.kWhite,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    border: Border.all(
                      color: Colors.black12,
                    ),
                  ),

                  // your background color
                  child: Row(
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
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
