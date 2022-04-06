import 'package:app_catalogo/ui/app/bloc/app_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppBloc', () {
    const page = AppPageStatus.favorites;

    blocTest<AppBloc, AppState>(
      'emits [AppPageChangedTo] when AppPageChangedTo is added.',
      build: AppBloc.new,
      act: (bloc) => bloc.add(const AppPageChangedTo(page: page)),
      expect: () => <AppState>[const AppState(pageStatus: page)],
    );
  });
}
