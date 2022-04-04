import 'package:app_catalogo/ui/products/detail/presentation/detail_app_bar.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  static Page page() {
    return const MaterialPage<void>(
      child: DetailPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              DetailAppBar(),
            ],
          ),
        ),
      ),
    );
  }
}
