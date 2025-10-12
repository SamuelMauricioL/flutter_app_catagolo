import 'package:app_catalogo/features/app/bloc/app_bloc.dart';
import 'package:bloc_test/bloc_test.dart';

/// * Mocks

class MockAppBloc extends MockBloc<AppEvent, AppState> implements AppBloc {}
