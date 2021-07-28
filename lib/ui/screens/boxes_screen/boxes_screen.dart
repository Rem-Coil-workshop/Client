import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:slot_service_app/core/models/user.dart';
import 'package:slot_service_app/redux/boxes/thunk.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/ui/screens/base/base_main_screen.dart';
import 'package:slot_service_app/ui/screens/boxes_screen/widgets/box_empty_list.dart';
import 'package:slot_service_app/ui/screens/boxes_screen/widgets/box_list.dart';
import 'package:slot_service_app/ui/view_models/boxes.dart';

class BoxesScreen extends StatefulWidget {
  static const route = '/boxes';
  static const privacyLevel = EMPLOYEE_PRIVACY_LEVEL;
  static var screenNumber = 1;

  BoxesScreen({Key? key});

  @override
  _BoxesScreenState createState() => _BoxesScreenState();
}

class _BoxesScreenState extends State<BoxesScreen> {
  @override
  Widget build(BuildContext context) {
    return MainScreen(
      screenIndex: BoxesScreen.screenNumber,
      title: 'Доступные ячейки',
      currentRoute: BoxesScreen.route,
      child: StoreConnector<AppState, BoxesViewModel>(
        onInit: (store) => store.dispatch(OnFetchBoxes()),
        converter: (store) {
          final boxes = store.state.boxesState.boxes;
          if (boxes.isEmpty) {
            return BoxesViewModel.empty();
          } else {
            return BoxesViewModel.success(boxes: boxes);
          }
        },
        builder: (context, vm) => vm.when(
          success: (boxes) => BoxesList(boxes: boxes),
          empty: () => BoxesEmptyList(),
        ),
      ),
    );
  }
}
