import 'package:flutter/material.dart';
import 'package:pinterest/src/models/menu_model.dart';
import 'package:pinterest/src/widgets/pinterest_grid.dart';
import 'package:pinterest/src/widgets/pinterest_menu.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static const route = "/home";
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MenuModel(),
      child: Scaffold(
        body: Stack(
          children: [
            PinterestGrid(),
            _PinterestMenuWithAlignment(),
          ],
        ),
      ),
    );
  }
}

class _PinterestMenuWithAlignment extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final show = Provider.of<MenuModel>(context).show;

    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(bottom: 30.0),
      child: PinterestMenu(show: show),
      );
  }
}