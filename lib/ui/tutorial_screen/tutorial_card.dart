import 'package:flutter/material.dart';

class TutorialCard extends StatelessWidget {
  final int _step;
  final String _header, _body;

  final IconData backgroundIconData;

  static const _backgroundIconSize = 100.0;

  const TutorialCard(
      {super.key,
      required int step,
      required this.backgroundIconData,
      required String header,
      required String body})
      : _body = body,
        _header = header,
        _step = step;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final directionality = Directionality.of(context);

    return Stack(
      children: [
        Card(
          margin: const EdgeInsets.symmetric(vertical: 10),
          elevation: 5,
          child: Stack(
            children: [
              Positioned.directional(
                textDirection: directionality,
                top: 5,
                end: 5,
                child: Opacity(
                    opacity: 0.25,
                    child: Icon(
                      backgroundIconData,
                      size: _backgroundIconSize,
                      color: theme.colorScheme.onSurface,
                    )),
              ),
              Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                  child: RichText(
                    textAlign: TextAlign.center,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      text: '$_header\n',
                      style: theme.textTheme.titleLarge!,
                      children: [
                        TextSpan(
                          text: _body,
                          style: theme.textTheme.bodyMedium!,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned.directional(
          textDirection: directionality,
          top: -10,
          start: 20,
          child: Text(
            '${_step.toString()}.',
            style: theme.textTheme.displayMedium!.copyWith(
                color: theme.colorScheme.primary, fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}
