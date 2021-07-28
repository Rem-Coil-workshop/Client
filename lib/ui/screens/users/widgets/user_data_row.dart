import 'package:flutter/material.dart';
import 'package:slot_service_app/core/models/user.dart';
import 'package:slot_service_app/redux/user/thunk.dart';
import 'package:slot_service_app/ui/widgets/remove_row_button.dart';

class UserDataRow extends DataRow {
  UserDataRow({
    required bool isEven,
    required User user,
  }) : super(
          color: MaterialStateProperty.resolveWith(
              (states) => isEven ? Colors.blue[50] : Colors.white),
          cells: [
            DataCell(Text(user.firstname)),
            DataCell(Text(user.lastname)),
            DataCell(RemoveRowButton(action: OnDeleteUser(user))),
          ],
        );
}
