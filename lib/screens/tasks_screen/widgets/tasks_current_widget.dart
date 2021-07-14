import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slot_service_app/screens/tasks_screen/models/task.dart';
import 'package:slot_service_app/screens/tasks_screen/widgets/tasks_item_widget.dart';

class CurrentTasksWidget extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final _tasks = Provider.of<List<Task>>(context);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white10),
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              "Существующие задачи",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Expanded(
            child: Scrollbar(
              controller: _scrollController,
              child: ListView.builder(
                controller: _scrollController,
                itemCount: _tasks.length,
                itemBuilder: (context, index) => TaskItemWidget(
                  task: _tasks[index],
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
