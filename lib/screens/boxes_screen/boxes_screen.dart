import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slot_service_app/base/base_main_screen.dart';
import 'package:slot_service_app/screens/boxes_screen/widgets/box_item_widget.dart';

import 'model/box.dart';

class BoxesScreen extends BaseMainScreen {
  static const String route = '/boxes';
  final ScrollController _scrollController = ScrollController();

  BoxesScreen({Key? key})
      : super(key: key, screenIndex: 1, title: 'Доступные ячейки');

  @override
  String getRoute() {
    return route;
  }

  @override
  Widget getMainWidget(BuildContext context) {
    final _boxes = Provider.of<List<Box>>(context);

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Scrollbar(
        controller: _scrollController,
        isAlwaysShown: true,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: _boxes.length,
          itemBuilder: (context, index) => BoxItemWidget(box: _boxes[index]),
        ),
      ),
    );
  }
}
