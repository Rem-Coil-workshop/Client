import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:slot_service_app/constants.dart';
import 'package:slot_service_app/core/models/user.dart';
import 'package:slot_service_app/redux/auth/thunk.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/screens/login_screen/view_models/login_view_model.dart';
import 'package:slot_service_app/screens/login_screen/widgets/enter_button.dart';
import 'package:slot_service_app/screens/login_screen/widgets/error_title.dart';
import 'package:slot_service_app/screens/login_screen/widgets/password_field.dart';
import 'package:slot_service_app/screens/login_screen/widgets/select_user_field.dart';
import 'package:slot_service_app/screens/login_screen/widgets/title_widget.dart';
import 'package:slot_service_app/screens/widgets/login_container.dart';

class LoginScreen extends StatefulWidget {
  static const route = "/login";

  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _controller = TextEditingController();
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LoginViewModel>(
      onInit: (store) => store.dispatch(OnGetUsers()),
      converter: (store) {
        final state = store.state;

        if (state.statusState.isLoad) {
          return LoginViewModel.load();
        }

        if (state.statusState.isError || state.authState.users.isEmpty) {
          return LoginViewModel.error(context: context);
        }

        if (!state.authState.isPasswordCorrect) {
          _errorMessage = 'Неверный пароль';
        }

        return LoginViewModel.success(
          users: state.authState.users,
          currentUser: state.authState.currentUser,
        );
      },
      builder: (context, vm) => vm.when(
        load: _onLoad,
        success: _onSuccess,
        error: _onError,
      ),
    );
  }

  Widget _onLoad() =>
      LoginContainer(child: Center(child: CircularProgressIndicator()));

  Widget _onSuccess(List<User> users, User? currentUser) {
    return LoginContainer(
      child: Column(
        children: [
          TitleWidget(),
          SizedBox(height: defaultPadding),
          SelectUserField(users: users, currentUser: currentUser),
          SizedBox(height: defaultPadding),
          PasswordField(controller: _controller),
          SizedBox(height: 5),
          ErrorTitle(errorMessage: _errorMessage),
          Spacer(),
          EnterButton(
            onWrongFields: _setErrorMessage,
            passwordController: _controller,
          ),
        ],
      ),
    );
  }

  Widget _onError(BuildContext context) {
    return LoginContainer(
      child: Center(
        child: Text(
          'Произошла ошибка загрузки данных, поробуйте позже или обратитесь к администратору',
          style: Theme.of(context).textTheme.headline6,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  void _setErrorMessage(String? message) {
    setState(() {
      _errorMessage = message;
    });
  }
}