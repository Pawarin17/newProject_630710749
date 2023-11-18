import 'package:flutter/material.dart';

import '../models/order_item.dart';

class AlbumList extends StatelessWidget {
  static const iconSize = 18.0;

  final Album albums;

  const AlbumList({super.key, required this.albums});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          title: Text('ID:${albums.ib}'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: ${albums.name}'),
              Text('Phone: ${albums.phone}'),
              Text('Date: ${albums.date}'),
              Text('Price: ${albums.price}.-'),
            ],
          )
      ),
    );
  }
}
