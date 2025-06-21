import 'package:flutter/material.dart';
import 'package:resumeflow/ui/widgets/grid_background.dart';

class Dashboard extends StatelessWidget {
  final String createLabel;
  final IconData icon;
  final void Function() createCardOnTap;

  const Dashboard({
    super.key,
    required this.createLabel,
    required this.icon,
    required this.createCardOnTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GridBackground(
      child: Builder(
        builder: (context) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 0.75,
            ),
            padding: const EdgeInsets.all(20),
            itemCount: 1,
            itemBuilder: (_, int index) {
              // For unuknown reason the grid builder context does not rebuild the widget
              return _buildCreateCard(theme);
            },
          );
        },
      ),
    );
  }

  Widget _buildCreateCard(ThemeData theme) => _buildCard(
    createLabel,
    theme.textTheme.titleSmall!,
    SizedBox.expand(
      child: ColoredBox(
        color: theme.colorScheme.primary.withAlpha(100),
        child: Icon(icon, size: 75),
      ),
    ),
    createCardOnTap,
  );

  Widget _buildCard(
    String label,
    TextStyle textStyle,
    Widget preview,
    void Function() onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Card(
          elevation: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [Expanded(child: preview), Text(label, style: textStyle)],
          ),
        ),
      ),
    );
  }
}
