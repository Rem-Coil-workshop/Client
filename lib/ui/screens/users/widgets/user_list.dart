import 'package:flutter/material.dart';
import 'package:slot_service_app/core/models/user.dart';
import 'package:slot_service_app/ui/constants.dart';
import 'package:slot_service_app/ui/screens/users/widgets/user_data_row.dart';
import 'package:slot_service_app/ui/widgets/background_container.dart';

class UserList extends StatelessWidget {
  final _controller = ScrollController();
  final String _title;
  final List<User> _users;

  UserList({
    Key? key,
    required String title,
    required List<User> users,
  })  : _title = title,
        _users = users,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BackgroundContainer(
        child: Column(
          children: [
            Text(_title, style: Theme.of(context).textTheme.headline5),
            SizedBox(height: 2 * defaultPadding),
            Expanded(
              child: SingleChildScrollView(
                controller: _controller,
                child: SizedBox(
                  width: double.infinity,
                  child: DataTable(
                    headingRowColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.blue[50]),
                    columns: [
                      DataColumn(label: Text('Имя')),
                      DataColumn(label: Text('Фамилия')),
                      DataColumn(label: Container()),
                    ],
                    rows: List.generate(
                      _users.length,
                      (index) => UserDataRow(
                        isEven: index % 2 == 1,
                        user: _users[index],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
