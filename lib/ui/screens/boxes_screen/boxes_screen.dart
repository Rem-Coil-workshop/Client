import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:slot_service_app/core/models/box.dart';
import 'package:slot_service_app/core/models/user.dart';
import 'package:slot_service_app/redux/boxes/thunk.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/ui/screens/base/base_main_screen.dart';
import 'package:slot_service_app/ui/screens/boxes_screen/widgets/box_item.dart';
import 'package:slot_service_app/ui/view_models/boxes.dart';

class BoxesScreen extends BaseMainScreen {
  static const route = '/boxes';
  static const privacyLevel = EMPLOYEE_PRIVACY_LEVEL;

  final ScrollController _scrollController = ScrollController();

  BoxesScreen({Key? key})
      : super(key: key, screenIndex: 1, title: 'Доступные ячейки');

  @override
  String get currentRoute => route;

  @override
  Widget getMainWidget(BuildContext context) {
    return StoreConnector<AppState, BoxesViewModel>(
      onInit: (store) => store.dispatch(OnFetchBoxes()),
      converter: (store) =>
          BoxesViewModel.success(boxes: store.state.boxesState.boxes),
      builder: (context, vm) => vm.when(
        success: (boxes) =>
            boxes.isEmpty ? _emptyScreen() : _screenWithItems(boxes),
      ),
    );
  }

  Widget _emptyScreen() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Center(
          child: Text('Нет элементов'),
        ),
      ),
    );
  }

  Widget _screenWithItems(List<Box> boxes) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Scrollbar(
        controller: _scrollController,
        isAlwaysShown: true,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: boxes.length,
          itemBuilder: (context, index) => BoxItem(box: boxes[index]),
        ),
      ),
    );
  }
}
