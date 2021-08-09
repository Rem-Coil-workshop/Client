import 'package:slot_service_app/core/models/task.dart';

class JsonTask {
  final int id;
  final String qrCode;

  JsonTask({required this.id, required this.qrCode});

  factory JsonTask.fromJson(Map<String, dynamic> json) {
    return JsonTask(
      id: json['id'],
      qrCode: json['qrCode'],
    );
  }

  Task toTask() {
    return Task(
      id: id,
      name: qrCode,
    );
  }
}
