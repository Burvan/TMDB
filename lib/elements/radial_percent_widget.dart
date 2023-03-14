import 'dart:math';

import 'package:flutter/material.dart';

class RadialPercentWidget extends StatelessWidget {
  final Widget child;

  final double percent;
  final Color fillColor;
  final Color lineColor; //цвет выполненной части
  final Color freeColor; //цвет невыполненной части
  final double lineWidth;
  const RadialPercentWidget(
      {Key? key,
        required this.child,
        required this.percent,
        required this.fillColor,
        required this.lineColor,
        required this.freeColor,
        required this.lineWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit
          .expand, //чтобы прогрессбар стремился занять максимум места, иначе по умолчанию он занимает минимум
      children: [
        CustomPaint(
            painter: MyPainter(
                percent: percent,
                fillColor: fillColor,
                lineColor: lineColor,
                freeColor: freeColor,
                lineWidth: lineWidth)),
        child,
      ],
    );
  }
}

// class PercentCircle extends StatefulWidget {
//   const PercentCircle({Key? key}) : super(key: key);
//
//   @override
//   State<PercentCircle> createState() => _PercentCircleState();
// }
//
// class _PercentCircleState extends State<PercentCircle> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           height: 100,
//           width: 100,
//           child: RadialPercentWidget(
//             percent: 0.7,
//             fillColor: Colors.blueGrey,
//             lineColor: Colors.green,
//             freeColor: Colors.red,
//             lineWidth: 5,
//             child: Center(
//                 child: Text(
//                   '70 %',
//                   style: TextStyle(color: Colors.yellow),
//                 )),
//           ),
//         ),
//       ),
//     );
//   }
// }

class MyPainter extends CustomPainter {
  final double percent;
  final Color fillColor;
  final Color lineColor; //цвет выполненной части
  final Color freeColor; //цвет невыполненной части
  final double lineWidth;

  MyPainter(
      {required this.percent,
        required this.fillColor,
        required this.lineColor,
        required this.freeColor,
        required this.lineWidth});
  @override
  void paint(Canvas canvas, Size size) {
    final arcRect = calculateArcsRect(size);

    drawBackground(canvas, size);

    drawFreeArc(canvas, arcRect);

    drawFilledArc(canvas, arcRect);
  }

  void drawFilledArc(Canvas canvas, Rect arcRect) {
    final paint = Paint();
    paint.color = lineColor;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = lineWidth;
    paint.strokeCap = StrokeCap.round; // скругление концов дуги
    canvas.drawArc(arcRect, 3 * pi / 2, pi * 2 * percent, false, paint);
  }

  void drawBackground(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = fillColor;
    paint.style = PaintingStyle.fill;
    canvas.drawOval(Offset.zero & size, paint);
  }

  void drawFreeArc(Canvas canvas, Rect arcRect) {
    final paint = Paint();
    paint.color = freeColor;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = lineWidth;
    canvas.drawArc(arcRect, 3 * pi / 2 + 2 * pi * percent,
        2 * pi - 2 * pi * percent, false, paint);
  }

  Rect calculateArcsRect(Size size) {
    final linesMargin = 3;
    final offset = lineWidth / 2 + linesMargin;
    final arcRect = Offset(offset, offset) &
    Size(size.width - offset * 2, size.height - offset * 2);
    return arcRect;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
