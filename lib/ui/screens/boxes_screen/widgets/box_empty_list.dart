import 'package:flutter/material.dart';

class BoxesEmptyList extends StatelessWidget {
  const BoxesEmptyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Center(child: Text('Пока нет доступных ячеек')),
      ),
    );
  }
}
