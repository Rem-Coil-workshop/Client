import 'package:slot_service_app/core/network/http_adapter.dart';
import 'package:slot_service_app/redux/settings/state.dart';

abstract class BaseRepository{
  HttpAdapter client = HttpAdapter(Network.initState);

  void changeNetworkClient(Network network) {
    client = HttpAdapter(network);
  }
}