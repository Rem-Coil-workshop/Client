import 'package:flutter/material.dart';
import 'package:slot_service_app/base/widgets/header.dart';
import 'package:slot_service_app/constants.dart';
import 'package:slot_service_app/navigation/navigation_widget.dart';

abstract class BaseMainScreen extends StatelessWidget {
  final int screenIndex;
  final String title;

  const BaseMainScreen({
    Key? key,
    required this.screenIndex,
    required this.title,
  }) : super(key: key);

  Widget getMainWidget(BuildContext context);

  String getRoute();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationWidget(selectedItem: screenIndex),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(child: NavigationWidget(selectedItem: screenIndex)),
          Expanded(
            flex: 5,
            child: Container(
              padding: EdgeInsets.all(defaultPadding),
              child: Column(
                children: [
                  _getHeader(),
                  _getMainWidgetDecoration(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getHeader() => Expanded(child: Header(title: title));

  Widget _getMainWidgetDecoration(BuildContext context) => Expanded(
        flex: 19,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            border: Border.all(color: Colors.white10),
          ),
          margin: EdgeInsets.only(left: defaultPadding, top: 30),
          padding: EdgeInsets.symmetric(
            horizontal: defaultPadding,
            vertical: defaultPadding,
          ),
          child: getMainWidget(context),
        ),
      );
}
