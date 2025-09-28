import 'package:eyewear/style/color.dart';
import 'package:flutter/material.dart';

class HexagonButton extends StatelessWidget {
  const HexagonButton({
    super.key,
    required this.imagePath,
    this.width,
    this.height, this.child, this.color,
  });

  final String imagePath;
  final double? width;
  final double? height;
  final Widget? child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: HexagonClipper(),
      child: Container(
        width: width ?? 60,
        height: height ?? 80,
        color: color??AppColor.kWhite,
        child: Center(
          child: child?? Image.network(
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
    path.lineTo(w * 0.05, h * 0.58);
    path.lineTo(0, h * 0.15);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class SquareHexagonGapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors
          .white // fill color
      ..style = PaintingStyle.fill
      ..strokeWidth = 3;

    final itemCount = 4;
    final itemWidth = size.width / itemCount;

    for (int i = 0; i < itemCount; i++) {
      canvas.save();
      // Shift canvas horizontally for each shape
      canvas.translate(i * itemWidth, 0);
      _drawShape(canvas, Size(itemWidth, size.height), paint);
      canvas.restore();
    }
  }

  void _drawShape(Canvas canvas, Size size, Paint paint) {
    final w = size.width;
    final h = size.height;

    final path = Path();

    final hexHeight = h * 0.25;

    // Start bottom-left
    path.moveTo(0, h);
    path.lineTo(0, h * 0.25);

    // Hexagon gap at top
    path.lineTo(w * 0.2, hexHeight);
    path.lineTo(w * 0.25, h * 0.58);
    path.lineTo(w * 0.5, h * 0.85);
    path.lineTo(w * 0.75, h * 0.58);
    path.lineTo(w * 0.82, hexHeight);

    // Continue to bottom-right
    path.lineTo(w, h * 0.25);
    path.lineTo(w, h);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class SquareHexagonTopLeftRadiusPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeWidth = 3;

    _drawShape(canvas, size, paint);
  }

  void _drawShape(Canvas canvas, Size size, Paint paint) {
    final w = size.width;
    final h = size.height;

    final path = Path();
    final hexHeight = h * 0.25;
    final radius = 20.0; // top-left corner radius

    // Start from bottom-left
    path.moveTo(0, h);

    // Move up to just below the top-left corner
    path.lineTo(0, hexHeight + radius);

    // Rounded top-left corner
    path.quadraticBezierTo(0, hexHeight, radius, hexHeight);

    // Hexagon gap at top
    path.lineTo(w * 0.2, hexHeight);
    path.lineTo(w * 0.25, h * 0.58);
    path.lineTo(w * 0.5, h * 0.8);
    path.lineTo(w * 0.75, h * 0.58);
    path.lineTo(w * 0.8, hexHeight);

    // Continue to bottom-right
    path.lineTo(w, hexHeight);
    path.lineTo(w, h);

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class SquareHexagonTopRightRadiusPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeWidth = 3;

    _drawShape(canvas, size, paint);
  }

  void _drawShape(Canvas canvas, Size size, Paint paint) {
    final w = size.width;
    final h = size.height;

    final path = Path();
    final hexHeight = h * 0.25;
    final radius = 20.0; // top-right corner radius

    // Start from bottom-left
    path.moveTo(0, h);

    // Move up to top-left of hexagon gap
    path.lineTo(0, hexHeight);
    path.lineTo(w * 0.2, hexHeight);
    path.lineTo(w * 0.25, h * 0.58);
    path.lineTo(w * 0.5, h * 0.8);
    path.lineTo(w * 0.75, h * 0.58);
    path.lineTo(w * 0.8, hexHeight);

    // Move towards top-right with rounded corner
    path.lineTo(w - radius, hexHeight);
    path.quadraticBezierTo(w, hexHeight, w, hexHeight + radius);

    // Continue down to bottom-right
    path.lineTo(w, h);

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class SquareHexagonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeWidth = 3;

    _drawShape(canvas, size, paint);
  }

  void _drawShape(Canvas canvas, Size size, Paint paint) {
    final w = size.width;
    final h = size.height;

    final path = Path();

    final hexHeight = h * 0.25;

    // Start bottom-left
    path.moveTo(0, h);
    path.lineTo(0, h * 0.25);

    // Hexagon gap at top
    path.lineTo(w * 0.2, hexHeight);
    path.lineTo(w * 0.25, h * 0.58);
    path.lineTo(w * 0.5, h * 0.8);
    path.lineTo(w * 0.75, h * 0.58);
    path.lineTo(w * 0.8, hexHeight);

    // Continue to bottom-right
    path.lineTo(w, h * 0.25);
    path.lineTo(w, h);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
