import 'package:flutter/material.dart';

class MenuModel with ChangeNotifier{
  int _itemSelected = 0;
  bool _show = true;

  Color _backgroundColor = Colors.white;
  Color _activeColor = Colors.black;
  Color _inactiveColor = Colors.blueGrey;

  int get itemSelected =>  this._itemSelected;
  set itemSelected (int index){
    this._itemSelected = index;
    this.notifyListeners();
  }

  bool get show => this._show;
  set show (bool s){
    this._show = s;
    this.notifyListeners();
  }

  Color get backgroundColor => this._backgroundColor;
  set backgroundColor (Color c){
    this._backgroundColor = c;
    //this.notifyListeners();
  }

  Color get activeColor => this._activeColor;
  set activeColor (Color c){
    this._activeColor = c;
    //this.notifyListeners();
  }

  Color get inactiveColor => this._inactiveColor;
  set inactiveColor (Color c){
    this._inactiveColor = c;
    //this.notifyListeners();
  }
}