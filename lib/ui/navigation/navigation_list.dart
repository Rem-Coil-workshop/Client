import 'package:flutter/material.dart';
import 'package:slot_service_app/core/network/client.dart';
import 'package:slot_service_app/ui/constants.dart';
import 'package:slot_service_app/ui/navigation/widgets/navigation_item.dart';
import 'package:slot_service_app/ui/navigation/widgets/navigation_logo_item.dart';
import 'package:universal_html/html.dart';
import 'models/navigation_item_info.dart';

class NavigationList extends StatelessWidget {
  final List<NavigationItemInfo> navigationItems;
  final int selectedItem;

  const NavigationList({
    Key? key,
    required this.navigationItems,
    required this.selectedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: navigationItems.length + 1,
              itemBuilder: (context, index) {
                if (index == 0)
                  return NavigationLogoItem();
                else
                  return NavigationItem(
                    item: navigationItems[index - 1],
                    isSelected: index == selectedItem,
                  );
              },
            ),
          ),
          Container(
            width: double.infinity,
            height: 40,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: OutlinedButton.icon(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9),
                    side: BorderSide(color: secondaryColor),
                  ),
                ),
              ),
              onPressed: _download,
              label: Text('Руководство пользователя'),
              icon: Icon(
                Icons.info,
                size: 20,
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _download() async {
    final client = await HttpClient.instance();
    final url = 'http://${client.config.host}:${client.config.port}/manual';
    window.open(url, 'manual');
  }
}
