import 'package:app_catalogo/ui/app/app.dart';
import 'package:app_catalogo/ui/app/bloc/app_bloc.dart';
import 'package:app_catalogo/ui/favorites/presentation/routes/favorites_routing.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../helpers/helpers.dart';

void main() {
  // group('AppPage', () {
  //   testWidgets('renders AppPage', (tester) async {
  //     await tester.pumpApp(
  //       const AppPage(),
  //     );
  //     expect(find.byType(AppView), findsOneWidget);
  //   });
  // });

  group('AppView', () {
    testWidgets(
        'renders FavoritesRouting when app state is AppPageStatus.favorites',
        (tester) async {
      final appBloc = MockAppBloc();
      when(() => appBloc.state).thenReturn(
        const AppState(
          pageStatus: AppPageStatus.favorites,
        ),
      );
      await tester.pumpApp(const AppView(), appBloc: appBloc);
      await tester.pumpAndSettle();
      expect(find.byType(FavoritesRouting), findsOneWidget);
    });
  });
}
