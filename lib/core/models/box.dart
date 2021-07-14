import 'package:freezed_annotation/freezed_annotation.dart';

part 'box.freezed.dart';

@freezed
abstract class Box with _$Box {
  const factory Box({
    required int id,
    required int number,
    required int taskId,
  }) = _Box;
}
