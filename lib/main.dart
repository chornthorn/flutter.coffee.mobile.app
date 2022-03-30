import 'package:flutter/material.dart';
import 'constants/theme_x.dart';
import 'screens/authentication_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ThemeX.initialize();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeX.themeMode;

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        ThemeX.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee-Mobile',
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: _themeMode,
      home: AuthenticationScreen(),
    );
  }
}
