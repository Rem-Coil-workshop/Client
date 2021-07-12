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
        SizedBox(
          width: 20,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        Spacer(),
        ProfileCard(name: 'Илья Родионов')
      ],
    );
  }
}
