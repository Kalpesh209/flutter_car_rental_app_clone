import 'package:flutter/material.dart';
import 'package:flutter_car_rental_app_clone/models/user_model.dart';
import 'package:flutter_car_rental_app_clone/presentation/screens/auth/auth.dart';
import 'package:flutter_car_rental_app_clone/presentation/screens/auth/authentication_service.dart';
import 'package:flutter_car_rental_app_clone/presentation/screens/home_page.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthenticationService>(context);
    return StreamBuilder<User?>(
      stream: authService.user,
      builder: (_, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
          return user == null
              ? const AuthPage() //xd
              : const HomePage();
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
