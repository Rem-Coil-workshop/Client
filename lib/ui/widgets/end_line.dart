import 'package:flutter/material.dart';

class EndLineRow extends StatelessWidget {
  final List<Widget> widgets;
  final bool isInRow;
  final int flex;

  const EndLineRow({
    Key? key,
    required this.widgets,
    this.isInRow = false,
    this.flex = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isInRow)
      return Expanded(child: _row());
    else
      return _row();
  }

  _row() {
    return Row(children: [
      Spacer(flex: flex),
      ...widgets,
    ]);
  }
}

class EndLineSingleWidget extends StatelessWidget {
  final Widget child;
  final bool isInRow;
  final int flex;

  const EndLineSingleWidget({
    Key? key,
    required this.child,
    this.isInRow = false,
    this.flex = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EndLineRow(
      widgets: [child],
      isInRow: isInRow,
      flex: flex,
    );
  }
}
