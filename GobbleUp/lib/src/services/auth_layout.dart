import 'package:flutter/material.dart';
import 'package:GobbleUp/src/services/auth_service.dart';
import 'package:GobbleUp/src/views/pages/login_pages/gobblerloginpage.dart';
import 'package:GobbleUp/src/views/pages/register_pages/gobblerregisterpage.dart';
import 'package:GobbleUp/src/views/pages/home_pages/gobblerrootpage.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({
    super.key,
    this.pageIfNotConnected,});

  final Widget? pageIfNotConnected;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AuthService>(
      valueListenable: authService,
      builder: (context, authService, child) {
        return StreamBuilder(
          stream: authService.authStateChanges,
          builder: (context, snapshot) {
            Widget widget;
            if (snapshot.connectionState == ConnectionState.waiting) {
              widget = const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData ) {
              widget = const GobblerRootPage();
            } else {
              widget = pageIfNotConnected ?? const GobblerLoginPage();
            }
            return widget;
            
          },
        );
      },
    );
  }
}