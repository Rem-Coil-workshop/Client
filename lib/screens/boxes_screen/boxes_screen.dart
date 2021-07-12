import 'package:flutter/material.dart';
import 'package:slot_service_app/base/base_main_screen.dart';

class BoxesScreen extends BaseMainScreen {
  static const String route = '/boxes';
  BoxesScreen({Key? key}) : super(key: key, screenIndex: 1);

  @override
  String getRoute() {
    return route;
  }

  @override
  Widget getMainWidget(BuildContext context) {
    return Center(
      child: Text('Boxes page'),
    );
  }
}
