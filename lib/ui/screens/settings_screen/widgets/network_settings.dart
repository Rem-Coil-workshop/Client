import 'package:flutter/material.dart';
import 'package:slot_service_app/core/network/config.dart';
import 'package:slot_service_app/core/network/network.dart';

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
    return FutureBuilder(
      future: NetworkConfigRepository.loadConfig(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final config = snapshot.data as NetworkConfig;
          return _network(config.host, config.port);
        }
        return CircularProgressIndicator();
      },
    );
  }

  _network(String host, int port) {
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
        SettingField(controller: _hostController, title: 'Host:'),
        SizedBox(height: defaultPadding),
        SettingField(controller: _portController, title: 'Port:'),
        SizedBox(height: defaultPadding),
        ElevatedButton(
          onPressed: () {
            final host = _hostController.text;
            final port = int.parse(_portController.text);
            NetworkConfigRepository.updateConfig(host, port);
          },
          child: Text('Применить'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _hostController.dispose();
    _portController.dispose();
    super.dispose();
  }
}

class SettingField extends StatelessWidget {
  final String title;
  final TextEditingController controller;

  const SettingField({Key? key, required this.controller, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title),
        SizedBox(width: defaultPadding),
        SizedBox(
          width: 180,
          child: TextField(
            controller: controller,
          ),
        ),
      ],
    );
  }
}
