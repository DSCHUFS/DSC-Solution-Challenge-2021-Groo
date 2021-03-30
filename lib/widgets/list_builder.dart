import 'package:flutter/material.dart';

typedef ItemWidgetBuilder<T> = Widget Function(BuildContext context, T item);

class ListBuilder<T> extends StatelessWidget {
  const ListBuilder({
    Key key,
    @required this.snapshot,
    @required this.itemBuilder,
    @required this.constraints,
  }) : super(key: key);
  final AsyncSnapshot<List<T>> snapshot;
  final ItemWidgetBuilder<T> itemBuilder;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    if (snapshot.hasData) {
      final List<T> items = snapshot.data;
      if (items.isNotEmpty) {
        return _buildList(items, constraints);
      } else {
        return _emptyContent(
          title: 'Nothing here',
          message: 'Add a new item to get started',
        );
      }
    } else if (snapshot.hasError) {
      return _emptyContent(
        title: 'Something went wrong',
        message: 'Can\'t load items right now',
      );
    }
    return Center(child: CircularProgressIndicator());
  }

  Widget _emptyContent({String title, String message}) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontSize: 32.0, color: Colors.black54),
          ),
          Text(
            message,
            style: TextStyle(fontSize: 16.0, color: Colors.black54),
          ),
        ],
      ),
    );
  }

  Widget _buildList(List<T> items, BoxConstraints constraints) {
    return ListView.builder(
      itemCount: items.length + 1,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        if (index == items.length)
          return SizedBox(width: 10 * constraints.maxWidth / 100);
        return itemBuilder(context, items[index]);
      },
    );
  }
}
