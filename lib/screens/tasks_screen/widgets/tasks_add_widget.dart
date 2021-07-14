import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/redux/tasks/thunk.dart';

import '../../../constants.dart';

class AddTaskWidget extends StatelessWidget {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);
    return Container(
      padding: const EdgeInsets.only(left: 20),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Text(
              'Создать новую задачу: ',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(),
          ),
          Expanded(
            flex: 15,
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Qr код задачи",
                fillColor: Colors.white,
                hoverColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                suffixIcon: InkWell(
                  onTap: () {
                    store.dispatch(OnCreateTask(_controller.value.text));
                    _controller.clear();
                  },
                  child: Container(
                    padding: EdgeInsets.all(defaultPadding * 0.5),
                    margin:
                        EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
