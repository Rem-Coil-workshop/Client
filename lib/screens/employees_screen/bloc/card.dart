import 'dart:async';

import 'package:slot_service_app/core/network/config.dart';
import 'package:slot_service_app/screens/employees_screen/view_models/card.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class CardBloc {
  final _channel = WebSocketChannel.connect(
    Uri.parse('ws://$HOST:$PORT/websocket'),
  );

  String _currentValue = '';

  final _inputController = StreamController<Event>();
  final _outputController = StreamController<CardViewModel>();

  StreamSink<Event> get inputSink => _inputController.sink;
  Stream<CardViewModel> get outputStateStream => _outputController.stream;

  CardBloc() {
    _inputController.stream.listen(_mapEventToStream);

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