import 'package:flutter/material.dart';
import 'package:slot_service_app/constants.dart';
import 'package:slot_service_app/screens/boxes_screen/boxes_screen.dart';
import 'package:slot_service_app/screens/employees_screen/employees_screen.dart';
import 'package:slot_service_app/screens/logs_screen/logs_screen.dart';
import 'package:slot_service_app/screens/tasks_screen/tasks_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rem&Coil Slots Admin Panel',
      theme: ThemeData(
        canvasColor: bgColor,
        scaffoldBackgroundColor: bgColor,
        primaryColor: primaryColor,
      ),
      routes: {
        BoxesScreen.route: (context) => BoxesScreen(),
        TasksScreen.route: (context) => TasksScreen(),
        EmployeesScreen.route: (context) => EmployeesScreen(),
        LogsScreen.route: (context) => LogsScreen(),
      },
      initialRoute: BoxesScreen.route,
    );
  }
}
