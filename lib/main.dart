import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_application1/Screens/provider/student_provider.dart';
import 'package:provider_application1/Screens/splashScreen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => StudentList()),
        ChangeNotifierProvider(create: (context) => StudentProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SplashScreen(), debugShowCheckedModeBanner: false);
  }
}
