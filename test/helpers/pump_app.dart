// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:app_catalogo/l10n/l10n.dart';
import 'package:app_catalogo/ui/app/bloc/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mocks.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp(Widget widget, {AppBloc? appBloc}) {
    return pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider.value(value: appBloc ?? MockAppBloc()),
        ],
        child: MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: Material(
            child: widget,
          ),
        ),
      ),
    );
  }
}
