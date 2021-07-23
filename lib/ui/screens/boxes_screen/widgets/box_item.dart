import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:slot_service_app/core/models/box.dart';
import 'package:slot_service_app/core/models/task.dart';
import 'package:slot_service_app/redux/boxes/thunk.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/ui/screens/boxes_screen/widgets/box_open_button.dart';
import 'package:slot_service_app/ui/screens/boxes_screen/widgets/box_number.dart';
import 'package:slot_service_app/ui/widgets/dropdown.dart';

import '../../../constants.dart';

class BoxItem extends StatelessWidget {
  final Box _box;

  const BoxItem({
    Key? key,
    required Box box,
  })  : _box = box,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);
    final tasks = store.state.tasksState.tasks;

    return Container(
      padding: EdgeInsets.all(defaultPadding),
      margin: EdgeInsets.only(right: 20, top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white10),
      ),
      child: ListTile(
        leading: BoxNumber(number: _box.number),
        mouseCursor: SystemMouseCursors.basic,
        title: Row(
          children: [
            SizedBox(width: 50),
            DropdownWidget<Task>(
              elements: [...tasks, Task.nullValue],
              onChanged: (Task? task) {
                store.dispatch(OnTaskChange(
                  box: _box,
                  task: task!,
                ));
              },
              currentElement: _getTask(tasks),
            ),
            Spacer(),
            BoxOpenButton(
              onPressed: () => store.dispatch(OnOpenBox(_box)),
            ),
          ],
        ),
      ),
    );
  }

  Task _getTask(List<Task> tasks) {
    final searchResult = tasks.where((element) => element.id == _box.taskId);
    if (searchResult.length == 0) {
      return Task.nullValue;
    } else {
      return searchResult.single;
    }
  }
}
