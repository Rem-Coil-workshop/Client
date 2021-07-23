import 'package:freezed_annotation/freezed_annotation.dart';

part 'network.freezed.dart';

@freezed
class NetworkViewModel with _$NetworkViewModel {
  const factory NetworkViewModel.update({
    required String host,
    required int port,
  }) = Update;
}