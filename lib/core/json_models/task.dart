import 'package:slot_service_app/core/models/task.dart';

class JsonTask {
  final int id;
  final String qrCode;

  JsonTask({required this.id, required this.qrCode});

  factory JsonTask.fromTask(Task task) {
    return JsonTask(id: task.id, qrCode: task.name);
  }

  factory JsonTask.fromJson(Map<String, dynamic> json) {
    return JsonTask(id: json['id'], qrCode: json['qrCode']);
  }

  Task toTask() {
    return Task(id: id, name: qrCode);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'qrCode': qrCode,
    };
  }
}
