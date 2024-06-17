import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
            painter: RectPainter(),
          ),
        ),
      ),
    );
  }
}

class RectPainter extends CustomPainter {
  final rectPainter = Paint()
    ..color = Colors.black
    ..style = PaintingStyle.stroke;
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    //Center offset + with
    final rect1 = Rect.fromCenter(
      center: center,
      width: size.width * 0.5,
      height: size.height * 0.5,
    );

    ///Rect from values of a circle
    final rect2 = Rect.fromCircle(center: center, radius: 40);

    // Renders difference between left ||right and top ||bottom
    const rect3 = Rect.fromLTRB(20, 20, 100, 100);

    //roudned corners
    canvas.drawRRect(
      RRect.fromRectAndRadius(rect3, const Radius.circular(10)),
      rectPainter,
    );

    // roudned specific corners
    canvas.drawRRect(
      RRect.fromRectAndCorners(rect2, topLeft: const Radius.circular(10)),
      rectPainter,
    );
    //different radius in x and y axis
    canvas.drawRRect(RRect.fromRectXY(rect1, 20, 5), rectPainter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
