import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slot_service_app/core/models/box.dart';

part 'boxes.freezed.dart';

@freezed
class BoxesViewModel with _$BoxesViewModel {
  const factory BoxesViewModel.success({
    required List<Box> boxes,
  }) = Success;

  const factory BoxesViewModel.empty() = Empty;
}
