import 'package:flutter/material.dart';
import 'package:slot_service_app/core/models/box.dart';

import 'box_item.dart';

class BoxesList extends StatefulWidget {
  final List<Box> boxes;

  const BoxesList({Key? key, required this.boxes}) : super(key: key);

  @override
  _BoxesListState createState() => _BoxesListState();
}

class _BoxesListState extends State<BoxesList> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Scrollbar(
        controller: _scrollController,
        isAlwaysShown: true,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: widget.boxes.length,
          itemBuilder: (context, index) => BoxItem(box: widget.boxes[index]),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
