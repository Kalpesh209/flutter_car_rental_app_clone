import 'package:flutter/material.dart';
import 'package:flutter_car_rental_app_clone/presentation/screens/auth/authentication_service.dart';
import 'package:flutter_car_rental_app_clone/presentation/screens/auth/wrapper.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<AuthenticationService>(
          create: (_) => AuthenticationService(),
        ),
      ],
      child: const GetMaterialApp(
        defaultTransition: Transition.rightToLeft,
        transitionDuration: Duration(milliseconds: 500),
        debugShowCheckedModeBanner: false,
        title: 'Car Rental App',
        home: Wrapper(),
      ),
    );
  }
}
