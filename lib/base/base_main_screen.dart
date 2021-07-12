import 'package:flutter/material.dart';
import 'package:slot_service_app/navigation/navigetion_widget.dart';

abstract class BaseMainScreen extends StatelessWidget {
  final int screenIndex;

  const BaseMainScreen({Key? key, required this.screenIndex}) : super(key: key);

  Widget getMainWidget(BuildContext context);

  String getRoute();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigetionWidget(
        selectedItem: screenIndex,
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: NavigetionWidget(
              selectedItem: screenIndex,
            ),
          ),
          Expanded(
            flex: 5,
            child: getMainWidget(context),
          ),
        ],
      ),
    );
  }
}
