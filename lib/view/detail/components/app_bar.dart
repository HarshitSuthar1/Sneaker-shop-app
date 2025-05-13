import 'package:flutter/material.dart';
import 'package:sneaker_app/theme/custom_app_theme.dart';
import 'package:sneaker_app/utils/constants.dart';

class CustomDetailsViewAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomDetailsViewAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Text(
        "Nike",
        style: AppThemes.detailsAppBar,
      ),
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppConstantsColor.lightTextColor,
          )),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.favorite_border,
            color: Colors.white,
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(65);
}
