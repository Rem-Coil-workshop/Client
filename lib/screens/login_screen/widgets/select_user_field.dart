import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:slot_service_app/core/models/user.dart';
import 'package:slot_service_app/redux/auth/thunk.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/screens/widgets/dropdown.dart';

class SelectUserField extends StatelessWidget {
  final List<User> _users;
  final User? _currentUser;

  const SelectUserField({
    Key? key,
    required List<User> users,
    required User? currentUser,
  })  : _users = users,
        _currentUser = currentUser,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);
    return DropdownWidget<User>(
      currentElement: _currentUser,
      hintText: 'Выбирете пользователя',
      elements: _users,
      onChanged: (value) {
        store.dispatch(OnChangeCurrentUser(value));
      },
      isExpanded: true,
    );
  }
}
