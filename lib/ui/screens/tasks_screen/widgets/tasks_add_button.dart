import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/ui/constants.dart';

class AddTaskButton extends StatelessWidget {
  final Function(Store<AppState>) _onTap;

  const AddTaskButton({
    Key? key,
    required Function(Store<AppState>) onTap,
  })  : _onTap = onTap,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);
    return InkWell(
      onTap: () => _onTap(store),
      child: Container(
        padding: EdgeInsets.all(defaultPadding * 0.5),
        margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
