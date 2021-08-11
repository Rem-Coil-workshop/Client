import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:slot_service_app/redux/state.dart';

class ListIconButton extends StatelessWidget {
  final Color color;
  final VoidCallback onPressed;
  final IconData icon;

  const ListIconButton({
    Key? key,
    required this.color,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      splashRadius: 8,
      icon: Icon(
        icon,
        color: color,
      ),
    );
  }
}

class RemoveIconButton extends StatelessWidget {
  final action;

  const RemoveIconButton({Key? key, required this.action}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);
    return ListIconButton(
      color: Colors.red,
      onPressed: () => store.dispatch(action),
      icon: Icons.remove_circle,
    );
  }
}
