import 'package:flutter/material.dart';
import 'package:productos_app/providers/navbar_provider.dart';
import 'package:productos_app/screens/login_screen.dart';
import 'package:productos_app/services/auth_service.dart';
import 'package:productos_app/widgets/bottom_navigation_bar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'inicio';

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    final mp = Provider.of<NavbarProvider>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          mp.items[mp.selectedIndex].label.toString(),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                await authService.logout();
              },
              icon: const Icon(Icons.logout))
        ],
        backgroundColor: const Color.fromRGBO(35, 35, 35, 1),
      ),
      body: mp.items[mp.selectedIndex].widget,
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
