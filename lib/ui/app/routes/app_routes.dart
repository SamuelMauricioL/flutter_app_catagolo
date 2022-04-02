import 'package:app_catalogo/ui/app/bloc/app_bloc.dart';
import 'package:app_catalogo/ui/counter/view/counter_page.dart';
import 'package:flutter/material.dart';

List<Page> onGenerateAppViewPages(AppState state, List<Page> pages) {
  switch (state.pageStatus) {
    case AppPageStatus.home:
      return [
        CounterPage.page(),
      ];
    case AppPageStatus.traking:
      return [
        CounterPage.page(),
      ];
    case AppPageStatus.profile:
      return [
        CounterPage.page(),
      ];
  }
}
