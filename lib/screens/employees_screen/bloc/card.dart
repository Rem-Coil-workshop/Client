import 'dart:async';

import 'package:slot_service_app/redux/settings/state.dart';
import 'package:slot_service_app/screens/employees_screen/view_models/card.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class CardBloc {
  late WebSocketChannel _channel;

  String _currentValue = '';

  final _inputController = StreamController<Event>();
  final _outputController = StreamController<CardViewModel>();

  StreamSink<Event> get inputSink => _inputController.sink;
  Stream<CardViewModel> get outputStateStream => _outputController.stream;

  CardBloc() {
    _inputController.stream.listen(_mapEventToStream);
  }

  void openSocket(Network network) {
    _channel = WebSocketChannel.connect(
      Uri.parse('ws://${network.host}:${network.port}/websocket'),
    );

    _channel.stream.listen((message) {
      _currentValue = message;
      _sendMessage();
    });
  }

  void _sendMessage() {
    final card = CardViewModel(_currentValue);
    _outputController.sink.add(card);
  }

  void _mapEventToStream(Event event) {
    switch (event) {
      case Event.getValue:
        _sendMessage();
        break;
    }
  }

  bool get isValid => _currentValue.isNotEmpty;

  String get value => _currentValue;


  void dispose() {
    _channel.sink.close();
    _inputController.close();
    _outputController.close();
  }
}

enum Event {getValue}