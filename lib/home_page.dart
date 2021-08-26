import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'google_signin_api.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future signIn() async {
      final user = await GoogleSignInApi.login();
      if (user == null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Sign In Failed')));
      } else {
        print(user.email);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(user.email)));
      }
    }

    return Container(
      color: Color(0xffffffff),
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: TextButton(
            onPressed: () {
              print('mantap');
              signIn();
            },
            child: Text('Login')),
      ),
    );
  }
}
