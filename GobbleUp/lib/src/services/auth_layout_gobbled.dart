import 'package:GobbleUp/src/views/pages/home_pages/gobbledrootpage.dart';
import 'package:GobbleUp/src/views/pages/onboarding_pages/gobbledloginpage.dart';
import 'package:flutter/material.dart';
import 'package:GobbleUp/src/services/auth_service.dart';

class AuthLayoutGobbled extends StatelessWidget {
  const AuthLayoutGobbled({
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
              widget = const GobbledRootPage();
            } else {
              widget = pageIfNotConnected ?? const GobbledLoginPage();
            }
            return widget;
            
          },
        );
      },
    );
  }
}