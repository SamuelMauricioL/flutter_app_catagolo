import 'package:app_catalogo/l10n/l10n.dart';
import 'package:app_catalogo/ui/app/bloc/app_bloc.dart';
import 'package:app_catalogo/ui/app/routes/app_routes.dart';
import 'package:app_catalogo/ui/shared/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:app_catalogo/ui/shared/custom_theme.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppPage extends StatelessWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AppBloc(),
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.light,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(
        body: FlowBuilder(
          state: context.select((AppBloc bloc) => bloc.state),
          onGeneratePages: onGenerateAppViewPages,
        ),
        bottomNavigationBar: BottomNavBar(appBloc: context.read<AppBloc>()),
      ),
    );
  }
}
