import 'package:flutter/material.dart';
import 'package:slot_service_app/ui/constants.dart';

abstract class AddEntityDialog extends StatelessWidget {
  final String _title;

  const AddEntityDialog({
    Key? key,
    required String title,
  })  : _title = title,
        super(key: key);

  Widget getFields(BuildContext context);
  Widget getActions(BuildContext context);

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
            getFields(context),
            SizedBox(height: defaultPadding),
            getActions(context),
          ],
        ),
      ),
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
