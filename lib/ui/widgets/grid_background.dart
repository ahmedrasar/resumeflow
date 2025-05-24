import 'package:flutter/material.dart';

class GridBackground extends StatelessWidget {
  final Widget? child;

  const GridBackground({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).colorScheme.surface;
    final brightness = Theme.of(context).brightness;
    final gridColor = Theme.of(
      context,
    ).colorScheme.inverseSurface.withAlpha(100);
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
          blendMode:
              brightness == Brightness.light
                  ? BlendMode.multiply
                  : BlendMode.screen,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return SizedBox(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                child: GridPaper(
                  divisions: 75,
                  subdivisions: 1,
                  interval: constraints.maxWidth,
                  color: gridColor,
                ),
              );
            },
          ),
        ),
        if (child != null) child!,
      ],
    );
  }
}
