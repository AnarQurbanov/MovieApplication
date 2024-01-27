import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSize {
  final Widget title;
  final Widget actionButton;
  const MyAppBar({
    Key? key,
    required this.title,
    required this.actionButton,
  }) : super(key: key);

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      title: title,
      centerTitle: true,
      actions: [
        actionButton,
      ],
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
