import 'package:app_catalogo/ui/shared/custom_style.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage._();

  static Page<void> page() => const MaterialPage<void>(
        child: ProfilePage._(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Profile',
                  style: CustomStyle.textH3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
