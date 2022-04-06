import 'package:app_catalogo/ui/app/bloc/app_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppEvent', () {
    const page = AppPageStatus.favorites;
    group('AppPageChangedTo', () {
      test('supports value comparison', () {
        expect(
          const AppPageChangedTo(page: page),
          const AppPageChangedTo(page: page),
        );
      });
    });
  });
}
