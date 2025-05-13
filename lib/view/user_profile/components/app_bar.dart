import 'package:flutter/material.dart';
import 'package:sneaker_app/theme/custom_app_theme.dart';
import 'package:sneaker_app/utils/constants.dart';

class UserViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const UserViewAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: const Text(
          'My Profile',
          style: AppThemes.profileAppBarTitle,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 8, right: 15),
          child: Icon(
            Icons.more_vert,
            color: AppConstantsColor.darkTextColor,
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56.0);
}
