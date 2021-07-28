import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:provider/provider.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/redux/user/thunk.dart';
import 'package:slot_service_app/ui/screens/base/widgets/exit_app_dialog.dart';
import 'package:slot_service_app/ui/view_models/auth.dart';
import 'package:slot_service_app/ui/view_models/route.dart';
import 'package:slot_service_app/ui/widgets/rounded_button.dart';

import '../../../constants.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);
    final route = Provider.of<RouteHolder>(context);
    return Container(
      child: RoundedButton(
        radius: 18,
        onPressed: () => showDialog(
          context: context,
          builder: (_) => ExitAppDialog(),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: defaultPadding / 2,
              ),
              child: StoreConnector<AppState, AuthViewModel>(
                converter: (store) {
                  final user = store.state.authState.currentUser;
                  if (user == null) {
                    return AuthViewModel.noUser();
                  } else {
                    return AuthViewModel.success(user: user);
                  }
                },
                builder: (context, vm) => vm.when(
                  success: (employee) =>
                      Text("${employee.lastname} ${employee.firstname}"),
                  noUser: () {
                    store.dispatch(OnEnterInApp(route.route));
                    return Text('Без пользователя');
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding / 4,
              ),
              child: Icon(
                Icons.exit_to_app_rounded,
                color: Colors.white,
                size: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
