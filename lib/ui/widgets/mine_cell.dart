import 'package:flutter/material.dart';

class MineCell extends StatelessWidget {
  final int index;
  const MineCell({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 184, 88, 125),
        border: Border.all(
          color: const Color.fromARGB(255, 16, 37, 21),
          width: 1.5,
        ),
      ),
    );
  }
}
