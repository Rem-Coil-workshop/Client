import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/ui/widgets/end_line.dart';
import 'package:slot_service_app/ui/widgets/rounded_button.dart';

class LogItem extends StatelessWidget {
  final String log;
  final dynamic action;

  const LogItem({Key? key, required this.log, required this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);
    return ListTile(
      mouseCursor: SystemMouseCursors.basic,
      title: Row(
        children: [
          Text(log, style: Theme.of(context).textTheme.headline6),
          EndLineSingleWidget(
            child: RoundedButton(
              radius: 10,
              onPressed: () => store.dispatch(action),
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
            isInRow: true,
          ),
        ],
      ),
    );
  }
}
