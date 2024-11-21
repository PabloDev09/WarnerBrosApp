import 'package:flutter/material.dart';
import 'package:warnerapp/config/routes/router.dart';  
import 'package:warnerapp/config/theme/app_theme.dart';
import 'package:warnerapp/screens/loading_screen.dart';
import 'package:warnerapp/screens/warner_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Warner Bros",
      routerConfig: router,  
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 2).theme(),
      builder: (context, child) {
        return FutureBuilder(
          future: Future.delayed(const Duration(seconds: 3)), 
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const LoadingScreen();
            }
            return const WarnerScreen(); 
          },
        );
      },
    );
  }
}
