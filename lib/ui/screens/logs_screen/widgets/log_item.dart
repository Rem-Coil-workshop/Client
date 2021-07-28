import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:slot_service_app/redux/logs/thunk.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/ui/widgets/rounded_button.dart';

class LogItem extends StatelessWidget {
  final String log;

  const LogItem({Key? key, required this.log}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);
    return ListTile(
      mouseCursor: SystemMouseCursors.basic,
      title: Row(
        children: [
          Text(log, style: Theme.of(context).textTheme.headline6),
          Spacer(),
          RoundedButton(
            radius: 10,
            onPressed: () => store.dispatch(OnDownloadFileButtonPressed(log)),
            child: Container(
              width: 200,
              height: 40,
              child: Center(
                child: Text(
                  'Скачать',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
