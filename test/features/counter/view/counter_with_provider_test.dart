import 'package:app_catalogo/core/storage/storage.dart';
import 'package:app_catalogo/ui/products/detail/data/datasource/detail_local_data_source.dart';
import 'package:app_catalogo/ui/products/detail/data/repositories/detail_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final repositoryA = RepositoryProvider.of<DetailRepositoryImpl>(context);

    // final response = repositoryA.value;
    return Scaffold(
      body: Column(
        children: const [
          Text(
            'value',
            key: Key('RepositoryA_data'),
          ),
        ],
      ),
    );
  }
}

void main() {
  group('MultiRepositoryProvider', () {
    testWidgets('passes values to children', (tester) async {
      await tester.pumpWidget(
        MultiRepositoryProvider(
          providers: [
            RepositoryProvider<DetailRepositoryImpl>(
              create: (_) => DetailRepositoryImpl(
                localDatasource: DetailLocalDataSource(storage: Storage()),
              ),
            ),
          ],
          child: const MaterialApp(
            home: CounterPage(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final repositoryAFinder = find.byKey(const Key('RepositoryA_data'));
      expect(repositoryAFinder, findsOneWidget);

      final repositoryAText = tester.widget(repositoryAFinder) as Text;
      expect(repositoryAText.data, 'value');
    });
  });
}
