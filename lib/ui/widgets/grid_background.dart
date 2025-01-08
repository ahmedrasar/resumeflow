import 'package:flutter/material.dart';

class GridBackground extends StatelessWidget {
  final Widget? child;

  const GridBackground({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).colorScheme.surface;
    final brightness = Theme.of(context).brightness;
    final gridColor = Theme.of(context).colorScheme.inverseSurface;
    final maskColor = Colors.lightBlue.shade700;

    return Stack(
      children: [
        ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [maskColor, backgroundColor],
            ).createShader(bounds);
          },
          blendMode: brightness == Brightness.light
              ? BlendMode.multiply
              : BlendMode.screen,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return CustomPaint(
                size: Size(constraints.maxWidth, constraints.maxHeight),
                painter: _Grid(gridColor),
              );
            },
          ),
        ),
        if (child != null) child!,
      ],
    );
  }
}

class _Grid extends CustomPainter {
  static const _space = 20.0;
  static const _alpha = 10;
  static const _strokeWidth = 0.75;

  final Color color;

  _Grid(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withAlpha(_alpha)
      ..strokeWidth = _strokeWidth;

    // Vertical lines
    for (double h = 0; h < size.width; h += _space) {
      canvas.drawLine(Offset(h, 0), Offset(h, size.height), paint);
    }

    // Horizontal lines
    for (double v = 0; v < size.height; v += _space) {
      canvas.drawLine(Offset(0, v), Offset(size.width, v), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
