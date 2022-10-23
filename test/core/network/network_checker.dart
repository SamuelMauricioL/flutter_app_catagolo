import 'package:app_catalogo/core/network/network_checker.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockConnectivity extends Mock implements Connectivity {}

void main() {
  late NetworkCheckerImpl networkChecker;
  late MockConnectivity mockConnectivity;

  setUp(() {
    mockConnectivity = MockConnectivity();
    networkChecker = NetworkCheckerImpl(mockConnectivity);
  });

  group('isConnected', () {
    test(
      'should forward the call to Connectivity.hasConnection',
      () async {
        // arrange
        final tHasConnectionFuture = Future<ConnectivityResult>.value(
          ConnectivityResult.none,
        );
        when(mockConnectivity.checkConnectivity).thenAnswer(
          (_) => tHasConnectionFuture,
        );
        // act
        final networkCheckerResult = await networkChecker.isConnected;
        // assert
        expect(networkCheckerResult, false);
      },
    );
  });
}
