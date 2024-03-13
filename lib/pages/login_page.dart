//  ///
//  Import LIBRARIES
import 'package:flutter/material.dart';
//  Import FILES
import '../services/auth_service.dart';
//  //   ///

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? username, password;

  final GlobalKey<FormState> _loginFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.green,
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SafeArea(
        child: _buildUI(),
      ),
    );
  }

  Widget _buildUI() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, //start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _title(),
          _loginForm(),
        ],
      ),
    );
  }

  Widget _title() {
    return const Text(
      'Recipe Book',
      style: TextStyle(fontSize: 32),
    );
  }

  Widget _loginForm() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.90,
      height: MediaQuery.sizeOf(context).height * 0.30,
      child: Form(
        key: _loginFormKey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              initialValue: 'kminchelle',
              onSaved: (value) {
                debugPrint(value);
                setState(() {
                  username = value;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a username';
                }
                return null;
              },
              decoration: const InputDecoration(hintText: 'Username'),
            ),
            TextFormField(
              initialValue: '0lelplR',
              onSaved: (value) {
                debugPrint(value);
                setState(() {
                  password = value;
                });
              },
              obscureText: true,
              validator: (value) {
                if (value == null || value.length < 5) {
                  return 'Please enter a password';
                }
                return null;
              },
              decoration: const InputDecoration(hintText: 'Password'),
            ),
            _loginButton(),
          ],
        ),
      ),
    );
  }

  Widget _loginButton() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.60,
      child: ElevatedButton(
        onPressed: () async {
          if (_loginFormKey.currentState?.validate() ?? false) {
            _loginFormKey.currentState?.save();
            bool result = await AuthService().login(username!, password!);
            // if (result) {
            //   Navigator.pushReplacementNamed(context, '/home');
            // } else {
            //   ScaffoldMessenger.of(context).showSnackBar(
            //     const SnackBar(
            //       content: Text('Login failed'),
            //     ),

            debugPrint("$username - $password");
          }
        },
        child: const Text(
          'Login',
        ),
      ),
    );
  }
}
