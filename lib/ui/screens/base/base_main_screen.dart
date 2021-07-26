import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slot_service_app/ui/constants.dart';
import 'package:slot_service_app/ui/navigation/navigation_controller.dart';
import 'package:slot_service_app/ui/screens/base/widgets/header.dart';
import 'package:slot_service_app/ui/view_models/route.dart';

abstract class BaseMainScreen extends StatelessWidget {
  final int screenIndex;
  final String title;

  const BaseMainScreen({
    Key? key,
    required this.screenIndex,
    required this.title,
  }) : super(key: key);

  Widget getMainWidget(BuildContext context);

  String get currentRoute;

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (BuildContext context) => RouteHolder(currentRoute),
      child: Scaffold(
        drawer: NavigationController(currentScreen: screenIndex),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(child: NavigationController(currentScreen: screenIndex)),
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
