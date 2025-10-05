import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_application1/Screens/provider/student_provider.dart';
import 'package:provider_application1/Screens/provider/theme_provider.dart';
import 'package:provider_application1/Screens/splashScreen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => StudentProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProv = context.watch<ThemeProvider>();

    return MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      themeMode: themeProv.currentTheme,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
    );
  }
}
