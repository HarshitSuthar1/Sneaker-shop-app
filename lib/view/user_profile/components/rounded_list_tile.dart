import 'package:flutter/material.dart';
import 'package:sneaker_app/theme/custom_app_theme.dart';
import 'package:sneaker_app/utils/constants.dart';

class RoundedListTile extends StatelessWidget {
  const RoundedListTile({
    Key? key,
    required this.icon,
    required this.title,
    this.leadingBackColor,
    required this.trailing,
  }) : super(key: key);

  final Color? leadingBackColor;
  final IconData icon;
  final String title;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
          leading: CircleAvatar(
            backgroundColor: leadingBackColor ?? Colors.grey[300],
            radius: 25,
            child: Icon(
              icon,
              color: AppConstantsColor.lightTextColor,
            ),
          ),
          title: Text(
            title,
            style: AppThemes.profileRepeatedListTileTitle,
          ),
          trailing: trailing,
        ),
      ),
    );
  }
}
