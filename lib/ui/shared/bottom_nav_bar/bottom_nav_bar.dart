import 'package:app_catalogo/ui/app/bloc/app_bloc.dart';
import 'package:app_catalogo/ui/shared/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key, required this.appBloc}) : super(key: key);

  final AppBloc appBloc;

  Map<String, IconData> _icons() => <String, IconData>{
        'Home': Iconsax.home,
        'Favorites': Iconsax.favorite_chart,
        'Profile': Iconsax.user,
      };

  Map<String, AppPageStatus> _pages() => <String, AppPageStatus>{
        'Home': AppPageStatus.home,
        'Favorites': AppPageStatus.favorites,
        'Profile': AppPageStatus.profile,
      };

  List<BottomNavigationBarItem> _getItems() {
    return _icons()
        .map(
          (key, icon) => MapEntry(
            key,
            BottomNavigationBarItem(
              icon: Icon(icon),
              label: key,
            ),
          ),
        )
        .values
        .toList();
  }

  int _getCurrentIndex() {
    return _pages().values.toList().indexWhere(
          (e) => e == appBloc.state.pageStatus,
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        if (state.pageStatus == AppPageStatus.home ||
            state.pageStatus == AppPageStatus.profile ||
            state.pageStatus == AppPageStatus.favorites) {
          return BottomNavigationBar(
            items: _getItems(),
            currentIndex: _getCurrentIndex(),
            type: BottomNavigationBarType.fixed,
            selectedItemColor: CustomColor.primary,
            unselectedItemColor: Colors.grey.shade400,
            onTap: (index) {
              appBloc.add(
                AppPageChangedTo(
                  page: _pages().values.toList()[index],
                ),
              );
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
