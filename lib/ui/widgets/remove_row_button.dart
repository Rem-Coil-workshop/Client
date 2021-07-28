import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:slot_service_app/redux/state.dart';

class RemoveRowButton extends StatelessWidget {
  final dynamic action;

  const RemoveRowButton({Key? key, required this.action}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);
    return Row(
      children: [
        Spacer(),
        IconButton(
          onPressed:  () => store.dispatch(action),
          splashRadius: 8,
          icon: Icon(
            Icons.remove_circle,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
