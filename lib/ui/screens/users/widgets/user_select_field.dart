import 'package:flutter/material.dart';
import 'package:slot_service_app/core/models/user.dart';
import 'package:slot_service_app/ui/constants.dart';
import 'package:slot_service_app/ui/widgets/dropdown.dart';

class UserSelectField extends StatefulWidget {
  final _roles = [
    RoleHolder(UserRole.EMPLOYEE),
    RoleHolder(UserRole.ADMIN),
  ];
  final _controller = RoleController();

  UserRole get value => _controller.role!.role;

  bool get isValid => _controller.role != null;

  UserSelectField({Key? key}) : super(key: key);

  @override
  _UserSelectFieldState createState() => _UserSelectFieldState();
}

class _UserSelectFieldState extends State<UserSelectField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: DropdownWidget<RoleHolder>(
        elements: widget._roles,
        onChanged: (value) => setState(() => widget._controller.role = value),
        currentElement: widget._controller.role,
        hintText: 'Уровень привилегий пользователя',
        isExpanded: true,
      ),
    );
  }
}

class RoleController {
  RoleHolder? _role;

  RoleHolder? get role => _role;

  set role(RoleHolder? newRole) => _role = newRole;
}
