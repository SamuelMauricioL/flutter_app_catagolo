import 'package:app_catalogo/ui/app/bloc/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailAppBar extends StatelessWidget {
  const DetailAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context
            .read<AppBloc>()
            .add(const AppPageChangedTo(page: AppPageStatus.home));
        return false;
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => context
                .read<AppBloc>()
                .add(const AppPageChangedTo(page: AppPageStatus.home)),
            child: SvgPicture.asset(
              'assets/icons/arrow_left.svg',
              height: 40,
              width: 40,
            ),
          ),
          const SizedBox(width: 17),
          SvgPicture.asset(
            'assets/icons/notification.svg',
            height: 40,
            width: 40,
          ),
        ],
      ),
    );
  }
}
