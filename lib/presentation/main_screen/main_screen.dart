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
          return IndexedStack(index: index, children: [ScreenHome()]);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColor.kOrange,
        backgroundColor: AppColor.kWhite,
        onTap: (value) {
          currentIndex.value = value;
        },

        type: BottomNavigationBarType.fixed,
        unselectedItemColor: AppColor.kGreyDark,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(child: Icon(Icons.person)),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
