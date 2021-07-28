import 'package:slot_service_app/core/network/client.dart';
import 'package:slot_service_app/redux/settings/state.dart';

abstract class BaseRepository{
  HttpClient client = HttpClient(Network.initState);

  void changeNetworkClient(Network network) {
    client = HttpClient(network);
  }
}

// TODO - Неплохо бы было сохранять настройки в локальном хранилище