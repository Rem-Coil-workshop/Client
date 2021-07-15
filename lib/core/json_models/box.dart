import 'package:slot_service_app/core/models/box.dart';

class JsonBox {
  final int id;
  final int number;
  final int? taskId;

  JsonBox({
    required this.id,
    required this.number,
    required this.taskId,
  });

  factory JsonBox.fromBox(Box box) {
    return JsonBox(id: box.id, number: box.number, taskId: box.taskId);
  }

  factory JsonBox.fromJson(Map<String, dynamic> json) {
    return JsonBox(
      id: json['id'],
      number: json['number'],
      taskId: json['taskId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'number': number,
      'taskId': taskId,
    };
  }

  Box toBox() {
    return Box(
      id: id,
      number: number,
      taskId: taskId == null ? 0 : taskId!,
    );
  }

  @override
  String toString() {
    return 'Box(id: $id, number: $number, taskId: $taskId)';
  }
}
