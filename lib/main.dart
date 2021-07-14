import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slot_service_app/constants.dart';
import 'package:slot_service_app/screens/boxes_screen/boxes_screen.dart';
import 'package:slot_service_app/screens/boxes_screen/model/box.dart';
import 'package:slot_service_app/screens/employees_screen/employees_screen.dart';
import 'package:slot_service_app/screens/logs_screen/logs_screen.dart';
import 'package:slot_service_app/screens/tasks_screen/models/task.dart';
import 'package:slot_service_app/screens/tasks_screen/tasks_screen.dart';

void main() {
  final tasks = [
    Task(id: 1, name: '12-1/12'),
    Task(id: 2, name: '12-2/12'),
    Task(id: 3, name: '12-3/12'),
    Task(id: 4, name: '12-3/12'),
  ];

  final boxes = [
    Box(number: 1, id: 1, taskId: 1),
    Box(number: 2, id: 2, taskId: 1),
    Box(number: 3, id: 3, taskId: 1),
    Box(number: 4, id: 4, taskId: 1),
  ];

  runApp(
    MultiProvider(
      providers: [
        Provider<List<Task>>(create: (_) => tasks),
        Provider<List<Box>>(create: (_) => boxes)
      ],
      child: MyApp(),
    ),
  );
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
      initialRoute: TasksScreen.route,
    );
  }
}
