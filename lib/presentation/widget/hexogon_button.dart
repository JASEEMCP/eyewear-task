import 'package:eyewear/style/color.dart';
import 'package:flutter/material.dart';

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
    path.lineTo(w, h * 0.15);
    path.lineTo(w * 0.95, h * 0.58);
    // // final newX = (w * 0.5) + w * math.cos(120);
    // // final newY = 0 + w * math.sin(120);
    path.lineTo(w * 0.5, h * 0.85);
    path.lineTo(w*0.05, h * 0.58);
    path.lineTo(0, h * 0.15);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

