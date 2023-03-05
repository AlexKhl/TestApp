import 'package:flutter/material.dart';
import 'package:test_app/widgets/manufacturers_list.dart';

void main() {
  runApp(VehiclesApp());
}

class VehiclesApp extends StatelessWidget {
  VehiclesApp({super.key});

  final MaterialColor kPrimaryColor = const MaterialColor(
    0xFF37B1B4,
    const <int, Color>{
      50: const Color(0xFF37B1B4),
      100: const Color(0xFF37B1B4),
      200: const Color(0xFF37B1B4),
      300: const Color(0xFF37B1B4),
      400: const Color(0xFF37B1B4),
      500: const Color(0xFF37B1B4),
      600: const Color(0xFF37B1B4),
      700: const Color(0xFF37B1B4),
      800: const Color(0xFF37B1B4),
      900: const Color(0xFF37B1B4),
    },
  );

  // The root point of the app
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Vehicles Application',
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: kPrimaryColor,
        ),
        home: Scaffold(
          resizeToAvoidBottomInset : false,
          body: ManufacturersList(),
        )
    );
  }
}
