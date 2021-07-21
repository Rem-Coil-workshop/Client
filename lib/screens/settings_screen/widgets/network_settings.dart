import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:slot_service_app/redux/settings/thunk.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/screens/settings_screen/view_models/network.dart';

import '../../../constants.dart';

class NetworkSettings extends StatefulWidget {
  const NetworkSettings({Key? key}) : super(key: key);

  @override
  _NetworkSettingsState createState() => _NetworkSettingsState();
}

class _NetworkSettingsState extends State<NetworkSettings> {
  final _hostController = TextEditingController();
  final _portController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, NetworkViewModel>(
      converter: (store) {
        final network = store.state.settingsState.network;
        return NetworkViewModel.update(host: network.host, port: network.port);
      },
      builder: (context, vm) => vm.when(
        update: (String host, int port) {
          final store = StoreProvider.of<AppState>(context);
          _hostController.text = host;
          _portController.text = port.toString();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Настройки подключения',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: defaultPadding),
              Row(
                children: [
                  Text('Host:'),
                  SizedBox(width: defaultPadding),
                  SizedBox(
                      width: 200,
                      child: TextField(
                        controller: _hostController,
                      )),
                ],
              ),
              SizedBox(height: defaultPadding),
              Row(
                children: [
                  Text('Port:'),
                  SizedBox(width: defaultPadding),
                  SizedBox(
                      width: 200,
                      child: TextField(
                        controller: _portController,
                      )),
                ],
              ),
              SizedBox(height: defaultPadding),
              ElevatedButton(
                onPressed: () {
                  final host = _hostController.text;
                  final port = int.parse(_portController.text);
                  store.dispatch(OnChangeNetworkConfig(host, port));
                },
                child: Text('Применить'),
              ),
            ],
          );
        },
      ),
    );
  }
}
