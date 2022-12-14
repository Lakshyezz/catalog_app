import 'package:flutter/material.dart';
import 'package:flutter_cataloge/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => print("$item.name pressed"),
        leading: Image.network(item.imgUrl),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          "\$${item.price}",
          textScaleFactor: 1.2,
          style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
