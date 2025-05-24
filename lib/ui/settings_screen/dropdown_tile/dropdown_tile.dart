import 'package:flutter/material.dart';

class DropdownTile<T> extends StatelessWidget {
  final String label;
  final IconData? icon;
  final T? initialSelection;
  final List<DropdownMenuEntry<T>> dropdownMenuEntries;
  final void Function(T?) onSelected;

  const DropdownTile({
    super.key,
    required this.label,
    this.icon,
    this.initialSelection,
    required this.dropdownMenuEntries,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final inputDecorationTheme = InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      filled: true,
      fillColor: Theme.of(context).colorScheme.onPrimary.withAlpha(150),
    );

    return Material(
      color: theme.colorScheme.surface.withAlpha(200),
      borderRadius: BorderRadius.circular(20),
      child: ListTile(
        minTileHeight: 75,
        leading: Icon(icon),
        title: Text(
          label,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        trailing: DropdownMenu<T>(
          width: 150,
          inputDecorationTheme: inputDecorationTheme,
          initialSelection: initialSelection,
          dropdownMenuEntries: dropdownMenuEntries,
          onSelected: onSelected,
        ),
      ),
    );
  }
}
