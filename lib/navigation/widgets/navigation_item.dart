import 'package:flutter/material.dart';
import 'package:slot_service_app/navigation/models/navigation_item_info.dart';
import 'package:slot_service_app/navigation/route_builder.dart';

class NavigationItem extends StatelessWidget {
  final NavigationItemInfo item;
  final bool isSelected;

  const NavigationItem({
    Key? key,
    required this.item,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: isSelected
          ? BoxDecoration(
              color: Colors.blue[50],
              border: Border(
                left: BorderSide(
                  color: Colors.blue,
                  width: 5,
                ),
              ),
            )
          : null,
      child: ListTile(
        onTap: () {
          Navigator.of(context).pushReplacement(
            RouteBuilder(widget: item.widget, name: item.widget.getRoute()),
          );
        },
        horizontalTitleGap: 0.0,
        leading: Icon(
          item.icon,
          color: isSelected ? Theme.of(context).primaryColor : Colors.grey[800],
          size: 20,
        ),
        title: Text(
          item.title,
          style: TextStyle(
            color:
                isSelected ? Theme.of(context).primaryColor : Colors.grey[800],
          ),
        ),
      ),
    );
  }
}
