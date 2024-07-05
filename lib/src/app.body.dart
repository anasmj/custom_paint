import 'package:flutter/material.dart';

class CustomPaintExample extends StatefulWidget {
  const CustomPaintExample({super.key});

  @override
  State<CustomPaintExample> createState() => _CustomPaintExampleState();
}

class _CustomPaintExampleState extends State<CustomPaintExample> {
  bool hasMoved = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom Paint')),
      body: Center(
        child: Container(
          color: Colors.grey.shade200,
          child: CustomPaint(
            size: const Size(300, 300),
            painter: CirclePainter(),
          ),
        ),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  final painter = Paint()
    ..strokeWidth = 2
    ..style = PaintingStyle.stroke //PaintingStyle.solid for solid circle
    ..color = Colors.black;

  @override
  paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    //CIRCLE
    canvas.drawCircle(center, 10, painter);

    //OVAL
    canvas.drawOval(const Rect.fromLTWH(0, 0, 100, 200), painter);

    // RECTANGLE: CENTER + WIDTH +HEIGHT
    canvas.drawRect(
      Rect.fromCenter(center: center, width: 20, height: 10),
      painter,
    );
    //RECTANGLE: CENTER + RADIUS
    canvas.drawRect(
      Rect.fromCircle(center: center, radius: 20),
      painter,
    );
    // RECTANGLE: from values of top left + height +width
    canvas.drawRect(const Rect.fromLTWH(10, 10, 100, 200), painter);
    //RECTANGLE: takes width = R-L, height = T-B
    canvas.drawRect(const Rect.fromLTRB(10, 10, 100, 200), painter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
