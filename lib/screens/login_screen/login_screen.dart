import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:slot_service_app/constants.dart';
import 'package:slot_service_app/core/models/user.dart';
import 'package:slot_service_app/redux/auth/thunk.dart';
import 'package:slot_service_app/redux/state.dart';
import 'package:slot_service_app/screens/login_screen/view_models/login_view_model.dart';
import 'package:slot_service_app/screens/widgets/dropdown.dart';

class LoginScreen extends StatelessWidget {
  static const route = "/login";
  final _controller = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: StoreConnector<AppState, LoginViewModel>(
          onInit: (store) => store.dispatch(OnGetUsers()),
          converter: (store) {
            final users = store.state.authState.users;
            if (users.isNotEmpty) {
              return LoginViewModel.withUsers(users: users);
            } else {
              return LoginViewModel.load();
            }
          },
          builder: (context, vm) => vm.when(
            withUsers: (users) => Container(
              padding: EdgeInsets.all(2 * defaultPadding),
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'Вход',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(height: 30),
                  DropdownWidget<User>(
                    currentElement: users[0],
                    elements: users,
                    onChanged: (value) {},
                    isExpanded: true,
                  ),
                  SizedBox(height: 20),
                  TextField(
                    obscureText: true,
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Пароль",
                      fillColor: Colors.white,
                      hoverColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: secondaryColor),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Text('Войти'),
                    ),
                  ),
                ],
              ),
            ),
            load: () => CircularProgressIndicator(color: Colors.white,),
          ),
        ),
      ),
    );
  }
}
