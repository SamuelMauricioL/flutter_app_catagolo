import 'package:app_catalogo/l10n/l10n.dart';
import 'package:app_catalogo/ui/app/bloc/app_bloc.dart';
import 'package:app_catalogo/ui/app/routes/app_routes.dart';
import 'package:app_catalogo/ui/detail/data/repositories/detail_repository.dart';
import 'package:app_catalogo/ui/detail/presentation/bloc/detail_bloc.dart';
import 'package:app_catalogo/ui/favorites/data/repositories/favorites_repository.dart';
import 'package:app_catalogo/ui/favorites/presentation/bloc/favorites_bloc.dart';
import 'package:app_catalogo/ui/products/data/repositories/products_repository.dart';
import 'package:app_catalogo/ui/products/presentation/bloc/products_bloc.dart';
import 'package:app_catalogo/ui/shared/custom_theme.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppPage extends StatelessWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AppBloc()),
        BlocProvider(
          create: (_) => ProductsBloc(
            repository: context.read<ProductsRepositoryImpl>(),
          ),
        ),
        BlocProvider(
          create: (_) => DetailBloc(
            repository: context.read<DetailRepositoryImpl>(),
          ),
        ),
        BlocProvider(
          create: (_) => FavoritesBloc(
            repository: context.read<FavoritesRepositoryImpl>(),
          ),
        ),
      ],
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
      home: FlowBuilder(
        state: context.select((AppBloc bloc) => bloc.state),
        onGeneratePages: onGenerateAppViewPages,
      ),
    );
  }
}
