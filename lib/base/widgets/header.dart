import 'package:flutter/material.dart';
import 'package:slot_service_app/base/widgets/profile_card.dart';

class Header extends StatelessWidget {
  final String title;

  const Header({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 20),
        Text(
          title,
          style: Theme
              .of(context)
              .textTheme
              .headline6,
        ),
        SizedBox(width: 50),
        StatusWidget(
          message: 'Данные сохранены',
          isError: false,
          isLoad: false,
        ),
        Spacer(),
        ProfileCard(name: 'Илья Родионов')
      ],
    );
  }
}

class StatusWidget extends StatelessWidget {
  final String? message;
  final bool isLoad;
  final bool isError;

  const StatusWidget({
    Key? key,
    required this.message,
    required this.isLoad,
    required this.isError,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (message != null) {
      return Row(
        children: [
          getStatus(),
          SizedBox(width: 15),
          Text(message!),
        ],
      );
    } else {
      return Container();
    }
  }

  Widget getStatus() {
    if (isLoad) {
      return Container(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(),
      );
    } else {
      var color = Colors.green;
      if (isError) {
        color = Colors.red;
      }
      return Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border: Border.all(color: color),
          ));
    }
  }
}
