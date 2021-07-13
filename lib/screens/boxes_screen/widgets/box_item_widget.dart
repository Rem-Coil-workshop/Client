import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slot_service_app/screens/boxes_screen/model/box.dart';
import 'package:slot_service_app/screens/boxes_screen/widgets/box_button_widget.dart';
import 'package:slot_service_app/screens/boxes_screen/widgets/box_number_widget.dart';
import 'package:slot_service_app/screens/boxes_screen/widgets/box_select_task_widget.dart';
import 'package:slot_service_app/screens/tasks_screen/models/task.dart';

import '../../../constants.dart';

class BoxItemWidget extends StatefulWidget {
  final Box _box;

  const BoxItemWidget({
    Key? key,
    required Box box,
  })  : _box = box,
        super(key: key);

  @override
  _BoxItemWidgetState createState() => _BoxItemWidgetState();
}

class _BoxItemWidgetState extends State<BoxItemWidget> {
  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<List<Task>>(context);

    return Container(
      padding: EdgeInsets.all(defaultPadding),
      margin: EdgeInsets.only(right: 20, top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white10),
      ),
      child: ListTile(
        leading: BoxNumberWidget(number: widget._box.number),
        mouseCursor: SystemMouseCursors.basic,
        title: Row(
          children: [
            SizedBox(width: 50),
            BoxSelectTaskWidget(
              tasks: tasks,
              onChanged: (Task? task) {
                setState(() {
                  widget._box.taskId = task!.id;
                });
              },
              currentTask: tasks.where((element) => element.id == widget._box.taskId).single,
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
}
