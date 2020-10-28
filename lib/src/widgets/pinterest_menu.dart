import 'package:flutter/material.dart';

class PinterestMenu extends StatelessWidget {
  
  final List<PinterestButton> items = [
    PinterestButton(icon: Icons.pie_chart, onPressed: (){}),
    PinterestButton(icon: Icons.search, onPressed: (){}),
    PinterestButton(icon: Icons.notifications, onPressed: (){}),
    PinterestButton(icon: Icons.supervised_user_circle, onPressed: (){}),
  ];

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 250,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
        boxShadow: [
          BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: 5)
        ]
      ),
      child: _MenuItems(menuItems: items,),
    );
  }
}

class _MenuItems extends StatelessWidget {

  final List<PinterestButton> menuItems;

  _MenuItems({this.menuItems});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(menuItems.length, (index) => _PinterestMenuButton(index, menuItems[index]))
      );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;

  _PinterestMenuButton(this.index, this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(item.icon),
    );
  }
}

class PinterestButton{
  final Function onPressed;
  final IconData icon;

  PinterestButton({this.icon, this.onPressed});
}