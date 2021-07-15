import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:slot_service_app/core/models/box.dart';
import 'package:slot_service_app/core/models/task.dart';
import 'package:slot_service_app/redux/boxes/thunk.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/screens/boxes_screen/widgets/box_button_widget.dart';
import 'package:slot_service_app/screens/boxes_screen/widgets/box_number_widget.dart';
import 'package:slot_service_app/screens/boxes_screen/widgets/box_select_task_widget.dart';

import '../../../constants.dart';

class BoxItemWidget extends StatelessWidget {
  final Box _box;

  const BoxItemWidget({
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
        leading: BoxNumberWidget(number: _box.number),
        mouseCursor: SystemMouseCursors.basic,
        title: Row(
          children: [
            SizedBox(width: 50),
            BoxSelectTaskWidget(
              tasks: [...tasks, Task.nullValue],
              onChanged: (Task? task) {
                store.dispatch(OnTaskChange(
                  box: _box,
                  task: task!,
                ));
              },
              currentTask: _getTask(tasks),
            ),
            Spacer(),
            BoxButtonWidget(
              onPressed: () {},
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
