import 'package:flutter/material.dart';
import 'package:tm_db/theme/app_button_style.dart';

import '../../main_screen/main_screen_widget.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login to your account'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: const [
              _HeaderWidget(),
              SizedBox(height: 10),
              _FormWidget(),
            ],
          ),
        ));
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 16,
      color: Colors.black,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        const Text(
          'In order to use the editing and rating capabilities ofTMDbm as '
          'well as get ptrsonal recomendations you will need to login to '
          'your account. If you do not have an accountm registering for '
          'an account is free and simple. Click here to get started.',
          style: textStyle,
        ),
        TextButton(
          style: AppButtonStyle.linkedStyle,
          onPressed: () {},
          child: const Text('Register'),
        ),
        //const SizedBox(height: 20),
        const Text(
          'If you signed up but didn\'t get your verification email, click '
          'here to have it resent',
          style: textStyle,
        ),
        TextButton(
          style: AppButtonStyle.linkedStyle,
          onPressed: () {},
          child: const Text('Verify email'),
        ),
        //const SizedBox(height: 20),
      ],
    );
  }
}

class _FormWidget extends StatefulWidget {
  const _FormWidget({Key? key}) : super(key: key);

  @override
  State<_FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<_FormWidget> {
  final _loginTextController = TextEditingController(text: '123');     // in real app you shouldn't do that.
  final _passwordTextController = TextEditingController(text: '123');  // I'm just tired of entering data every time.
  String? errorText = null;
  void _auth() {
    final login = _loginTextController.text;
    final password = _passwordTextController.text;

    setState(() {
      if (login == '123' && password == '123') {
        errorText = null;
        Navigator.of(context).pushNamed('/main_screen');
      } else {
        errorText = 'Ошибка доступа. Неправильный пароль или логин';
      }
    });
  }

  void _resetPassword() {
    print('Reset password');
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 16,
      color: Color(0xFF212529),
    );

    const color = Color(0xFF01B4E4);

    const decoration = InputDecoration(
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      isCollapsed: true,
    );

    final errorText = this.errorText;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Username', style: textStyle),
        const SizedBox(height: 5),
        TextField(
          controller: _loginTextController,
          decoration: decoration,
        ),
        const SizedBox(height: 25),
        const Text('Password', style: textStyle),
        const SizedBox(height: 5),
        TextField(
          controller: _passwordTextController,
          decoration: decoration,
          obscureText: true,
          
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            TextButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
                  backgroundColor: MaterialStateProperty.all(color),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  textStyle: MaterialStateProperty.all(
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 15)),
                ),
                onPressed: _auth,
                child: const Text('Login')),
            const SizedBox(width: 25),
            TextButton(
                style: AppButtonStyle.linkedStyle,
                onPressed: _resetPassword,
                child: const Text('Reset password')),
          ],
        ),
        if (errorText != null)
          Text(
            '$errorText',
            style: const TextStyle(
                color: Colors.red, fontSize: 17, fontWeight: FontWeight.w600),
          ),
      ],
    );
  }
}
