import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PinterestGrid extends StatelessWidget {
  final items = List.generate(200, (index) => index);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      padding: EdgeInsets.all(10),
      crossAxisCount: 4,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinterestItem(index),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2 : 3),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinterestItem extends StatelessWidget {

  final int index;
  _PinterestItem(this.index);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.all(Radius.circular(20.0))
      ),
        
        child: new Center(
          child: new CircleAvatar(
            backgroundColor: Colors.white,
            child: new Text('$index'),
          ),
        ));
  }
}