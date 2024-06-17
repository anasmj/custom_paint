import 'dart:typed_data';
import 'dart:ui';

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
            painter: PointPainter(),
          ),
        ),
      ),
    );
  }
}

class PointPainter extends CustomPainter {
  final painter = Paint()
    ..color = Colors.black
    ..strokeWidth = 5
    ..strokeCap = StrokeCap.round;
  @override
  void paint(Canvas canvas, Size size) {
    final points = <Offset>[
      Offset.zero,
      Offset(size.width, 0),
      Offset(size.width / 2, size.height / 2),
      Offset.zero,
    ];
    final rawPoints = Float32List.fromList(
      [
        0,
        0,
        size.width,
        0,
        size.width / 2,
        size.height / 2,
        0,
        0,
      ],
    );
    // canvas.drawPoints(PointMode.polygon, points, painter);
    canvas.drawRawPoints(PointMode.polygon, rawPoints, painter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
