import 'package:flutter/material.dart';
import 'package:pinterest/src/models/menu_model.dart';
import 'package:provider/provider.dart';

class PinterestMenu extends StatelessWidget {

  final bool show;
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;

  final List<PinterestButton> items;

  PinterestMenu({
    this.show = true,
    this.backgroundColor = Colors.white,
    this.activeColor = Colors.black,
    this.inactiveColor = Colors.blueGrey,
    @required this.items
    });

  @override
  Widget build(BuildContext context) {

    return AnimatedOpacity(
      opacity: (show)? 1 : 0,
      duration: Duration(milliseconds: 500),
      child: Builder(
        builder: (cxt){
          Provider.of<MenuModel>(cxt).backgroundColor = this.backgroundColor;
          Provider.of<MenuModel>(cxt).activeColor = this.activeColor;
          Provider.of<MenuModel>(cxt).inactiveColor = this.inactiveColor;
          
          return _PinterestMenuBackground(
            child: _MenuItems(menuItems: items,),
          );
        },
      ),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;
  const _PinterestMenuBackground({@required this.child});

  @override
  Widget build(BuildContext context) {
    final background = Provider.of<MenuModel>(context).backgroundColor;
    return Container(
      width: 250,
      height: 60,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
        boxShadow: [
          BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: 5)
        ]
      ),
      child: child,
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
    final menuModel = Provider.of<MenuModel>(context);

    final itemSelected = Provider.of<MenuModel>(context).itemSelected;
    return GestureDetector(
      onTap: (){
        Provider.of<MenuModel>(context, listen: false).itemSelected = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          size: (itemSelected == index)? 35 : 25,
          color:(itemSelected == index)? menuModel.activeColor : menuModel.inactiveColor,
        ),
      ),
    );
  }
}

class PinterestButton{
  final Function onPressed;
  final IconData icon;

  PinterestButton({this.icon, this.onPressed});
}