import 'package:flutter/cupertino.dart';

class RouteBuilder extends PageRouteBuilder {
  RouteBuilder({required Widget widget, required String name})
      : super(
          pageBuilder: (context, animation1, animation2) => widget,
          transitionDuration: Duration(seconds: 0),
          settings: RouteSettings(name: name),
        );
}
