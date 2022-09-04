import 'package:app_catalogo/ui/shared/custom_style.dart';
import 'package:app_catalogo/ui/shared/page_transitions/fade_transition.dart';
import 'package:flutter/material.dart';

class OfferPage extends StatelessWidget {
  const OfferPage._();

  static Page<void> page() => const FadeTransitionOnPage<void>(
        child: OfferPage._(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Center(
                child: Text(
                  'Oferta',
                  style: CustomStyle.textH3,
                ),
              ),
              const SizedBox(height: 30),
              Image.asset(
                'assets/images/thumbnails_black.png',
                width: 160,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
