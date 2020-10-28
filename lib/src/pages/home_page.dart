import 'package:flutter/material.dart';
import 'package:pinterest/src/widgets/pinterest_grid.dart';
import 'package:pinterest/src/widgets/pinterest_menu.dart';

class HomePage extends StatelessWidget {
  static const route = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(child: PinterestMenu()),

      ),
    );
  }
}