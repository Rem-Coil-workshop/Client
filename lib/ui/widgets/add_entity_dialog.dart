import 'package:flutter/material.dart';
import 'package:slot_service_app/ui/constants.dart';

class AddEntityDialog extends StatelessWidget {
  final String _title;
  final Widget fields;
  final bool Function() onSuccessButtonPressed;

  const AddEntityDialog({
    Key? key,
    required String title,
    required this.fields,
    required this.onSuccessButtonPressed,
  })  : _title = title,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(
          left: 2 * defaultPadding,
          top: 2 * defaultPadding,
          right: 2 * defaultPadding,
          bottom: defaultPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _getTitle(context),
            fields,
            SizedBox(height: defaultPadding),
            _getActions(context),
          ],
        ),
      ),
    );
  }

  _getActions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {
            if (onSuccessButtonPressed())
              Navigator.pop(context);
          },
          child: Text('Добавить'),
        ),
        SizedBox(width: defaultPadding),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Отмена'),
        ),
      ],
    );
  }

  _getTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Text(
        _title,
        style: Theme.of(context).textTheme.headline6,
        textAlign: TextAlign.start,
      ),
    );
  }
}
