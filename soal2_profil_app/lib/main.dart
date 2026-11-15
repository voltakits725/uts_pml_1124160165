import 'package:flutter/material.dart';
import 'package:soal2_profil_app/app_theme.dart';
import './screens/login_page.dart';


void main(){
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override 
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  ThemeMode _themeMode = ThemeMode.system;

  void _changeTheme(ThemeMode mode){
    setState((){
      _themeMode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profil Mahasiswa',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _themeMode,

      home: LoginPage(
        onThemeChanged: _changeTheme,
      ),
    );
  }
}