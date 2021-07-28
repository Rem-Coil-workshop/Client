import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:slot_service_app/core/models/user.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/redux/user/thunk.dart';
import 'package:slot_service_app/ui/constants.dart';

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
      child: Container(
        padding: EdgeInsets.all(2 * defaultPadding),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
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
                      (index) => _dataRow(index, _users[index], context),
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

  _dataRow(int index, User user, BuildContext context) {
    final store = StoreProvider.of<AppState>(context);
    return DataRow(
      color: MaterialStateProperty.resolveWith(
          (states) => index % 2 == 1 ? Colors.blue[50] : Colors.white),
      cells: [
        DataCell(Text(user.firstname)),
        DataCell(Text(user.lastname)),
        DataCell(Row(
          children: [
            Spacer(),
            IconButton(
              onPressed: () => store.dispatch(OnDeleteUser(user)),
              splashRadius: 8,
              icon: Icon(
                Icons.remove_circle,
                color: Colors.red,
              ),
            ),
          ],
        )),
      ],
    );
  }
}
