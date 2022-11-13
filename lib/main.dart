import 'package:flutter/material.dart';
import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/services/auth_service.dart';
import 'package:productos_app/ui/notifications.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthService(),
        )
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: Notifications.messengerKey,
      title: 'Material App',
      initialRoute: AuthTokenScreen.routerName,
      routes: {
        LoginScreen.routerName: (context) => LoginScreen(),
        RegisterScreen.routerName: (context) => const RegisterScreen(),
        HomeScreen.routerName: (context) => HomeScreen(),
        AuthTokenScreen.routerName: (context) => const AuthTokenScreen(),
      },
    );
  }
}
