import 'package:flutter/material.dart';
import 'package:slot_service_app/core/models/user.dart';
import 'package:slot_service_app/ui/constants.dart';
import 'package:slot_service_app/ui/widgets/dropdown.dart';

class UserSelectField extends StatelessWidget {
  final _roles = [
    RoleHolder(UserRole.EMPLOYEE),
    RoleHolder(UserRole.ADMIN),
  ];

  final RoleHolder? _currentRole;
  final ValueChanged<RoleHolder?> _onChanged;

  UserSelectField({
    Key? key,
    required RoleHolder? role,
    required ValueChanged<RoleHolder?> onChanged,
  })  : _currentRole = role,
        _onChanged = onChanged,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: DropdownWidget<RoleHolder>(
        elements: _roles,
        onChanged: _onChanged,
        currentElement: _currentRole,
        hintText: 'Уровень привилегий пользователя',
        isExpanded: true,
      ),
    );
  }
}
