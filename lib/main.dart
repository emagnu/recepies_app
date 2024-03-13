//  ///
//  Import LIBRARIES
import 'package:flutter/material.dart';
//  Import FILES
import 'pages/login_page.dart';
//  OTHER
// https://dummyjson.com/docs/auth - https://dummyjson.com/auth/login - https://dummyjson.com/docs/recipes
// https://app.quicktype.io/ - Null Safety: ON and Generate CopyWith method: ON.
//  //   ///

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recepie App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          centerTitle: true,
          // backgroundColor: Colors.deepOrange,
          // foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      home: const LoginPage(),
    );
  }
}
