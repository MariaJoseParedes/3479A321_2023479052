import 'package:flutter/material.dart';

class MineCell extends StatelessWidget {
  final int index;
  const MineCell({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary, // Usa el color de fondo del tema
        border: Border.all(color: theme.colorScheme.outline, width: 1.5),
      ),
      child: Center(
        child: Image.asset(
          'assets/icons/bomba.png',
          width: 64,
          height: 64,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
