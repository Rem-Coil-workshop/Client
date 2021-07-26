import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:slot_service_app/redux/auth/thunk.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/ui/constants.dart';
import 'package:slot_service_app/ui/screens/boxes_screen/boxes_screen.dart';


class NavigateButton extends StatelessWidget {
  const NavigateButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: secondaryColor),
            ),
          ),
        ),
        onPressed: () {
          final store = StoreProvider.of<AppState>(context);
          store.dispatch(OnEnterInApp(BoxesScreen.route));
        },
        child: Text('Начать'),
      ),
    );
  }
}
