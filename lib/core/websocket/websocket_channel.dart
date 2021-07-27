import 'package:slot_service_app/redux/settings/state.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class CardChannel {
  late WebSocketChannel _channel;
  bool _isOpened = false;
  final void Function(dynamic data) onData;

  CardChannel({required this.onData});

  open(Network config) {
    if (!_isOpened) {
      _channel = WebSocketChannel.connect(
          Uri.parse('ws://${config.host}:${config.port}/card'));
      _channel.stream.listen(onData);
      _isOpened = true;
    }
  }

  close() {
    if (_isOpened) {
      _channel.sink.close();
      _isOpened = false;
    }
  }
}
