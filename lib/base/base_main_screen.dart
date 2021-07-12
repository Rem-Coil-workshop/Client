import 'package:flutter/material.dart';
import 'package:slot_service_app/base/widgets/header.dart';
import 'package:slot_service_app/constants.dart';
import 'package:slot_service_app/navigation/navigetion_widget.dart';

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
            child: SafeArea(
              child: Container(
                padding: EdgeInsets.all(defaultPadding),
                child: Column(
                  children: [
                    Header(title: title),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.white10),
                      ),
                      margin: EdgeInsets.only(left: defaultPadding),
                      padding: EdgeInsets.symmetric(
                        horizontal: defaultPadding,
                        vertical: defaultPadding / 2,
                      ),
                      child: getMainWidget(context),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
