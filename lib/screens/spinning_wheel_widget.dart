import 'dart:math';

import 'package:flutter/material.dart';

class WheelPainter extends CustomPainter {
  final List<String> questions;
  final List<Color> segmentColors = const [
    Color(0xFFE74C3C), // Red
    Color(0xFFF39C12), // Orange
    Color(0xFF27AE60), // Green
    Color(0xFF2980B9), // Blue
    Color(0xFFF1C40F), // Yellow
    Color(0xFF8E44AD), // Purple
    Color(0xFFE67E22), // Dark Orange
    Color(0xFF1ABC9C), // Turquoise
    Color(0xFF3498DB), // Light Blue
    Color(0xFFD35400), // Dark Red
  ];

  WheelPainter(this.questions);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 4.0;

    const textStyle = TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.bold,
    );

    final radius = size.width / 2;
    final anglePerSegment = 2 * pi / questions.length;

    for (int i = 0; i < questions.length; i++) {
      final angle = i * anglePerSegment;
      paint.color = segmentColors[i % segmentColors.length];

      canvas.drawArc(
        Rect.fromCircle(center: Offset(radius, radius), radius: radius),
        angle,
        anglePerSegment,
        true,
        paint,
      );

      canvas.save();
      canvas.translate(radius, radius);
      canvas.rotate(angle + anglePerSegment / 2);
      canvas.rotate(pi / 2);

      final textPainter = TextPainter(
        text: TextSpan(text: questions[i], style: textStyle),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
        maxLines: 1,
      );

      textPainter.layout(
        minWidth: 0,
        maxWidth: radius * 0.8,
      );

      final textOffset = Offset(
        -textPainter.width / 2,
        -radius * 0.85,
      );

      textPainter.paint(canvas, textOffset);

      canvas.restore();
    }

    paint.color = Colors.white;
    canvas.drawCircle(Offset(radius, radius), 30, paint);

    paint.color = Colors.black;
    canvas.drawCircle(Offset(radius, radius), 20, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
