import 'package:flutter/material.dart';
import 'package:movie_application/product/card/my_card.dart';

import '../../core/extension/context_extension.dart';

class MyGridView extends StatefulWidget {
  final List<MyCard> myCardList;

  const MyGridView({super.key, required this.myCardList});

  @override
  State<MyGridView> createState() => _MyGridViewState();
}

class _MyGridViewState extends State<MyGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.7,
      crossAxisCount: 2,
      padding: context.paddingLow,
      children: widget.myCardList,
    );
  }
}
