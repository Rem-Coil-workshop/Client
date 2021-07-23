import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/ui/screens/base/widgets/profile_card.dart';
import 'package:slot_service_app/ui/screens/base/widgets/status.dart';
import 'package:slot_service_app/ui/view_models/status.dart';
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
          style: Theme.of(context).textTheme.headline6,
        ),
        SizedBox(width: 50),
        StoreConnector<AppState, StatusViewModel>(
          converter: (store) {
            final state = store.state.statusState;
            if (state.message == null)
              return StatusViewModel.disable();
            else if (state.isLoad)
              return StatusViewModel.loading(message: state.message!);
            else if (state.isError)
              return StatusViewModel.error(message: state.message!);
            else
              return StatusViewModel.success(message: state.message!);
          },
          builder: (context, vm) => vm.when(
            success: (message) => Status(
              message: message,
              isError: false,
              isLoad: false,
            ),
            loading: (message) => Status(
              message: message,
              isError: false,
              isLoad: true,
            ),
            error: (message) => Status(
              message: message,
              isError: true,
              isLoad: false,
            ),
            disable: () => Container(),
          ),
        ),
        Spacer(),
        ProfileCard()
      ],
    );
  }
}
