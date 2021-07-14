import 'package:slot_service_app/core/models/box.dart';
import 'package:slot_service_app/core/models/task.dart';
import 'package:slot_service_app/core/repository/base_repository.dart';

class BoxesRepository extends BaseRepository {
  final _boxes = <Box>[
    Box(number: 1, id: 1, taskId: 1),
    Box(number: 2, id: 2, taskId: 1),
    Box(number: 3, id: 3, taskId: 1),
    Box(number: 4, id: 4, taskId: 1),
  ];

  List<Box> get boxes => _boxes;

  void changeBoxTask(Box box, Task task) {
    final boxIndex = _boxes.indexOf(box);
    _boxes[boxIndex] = box.copyWith(taskId: task.id);
  }
}
