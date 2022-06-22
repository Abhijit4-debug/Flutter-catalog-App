import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final item product;

  const ItemWidget({Key key, @required this.product})
      : assert(product != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Image.network(product.image),
      title: Text(product.name),
      subtitle: Text(product.desc),
      trailing: Text(' \$${product.price}',
      textScaleFactor: 2,
      style: TextStyle(
        color: Colors.deepPurple,
        fontWeight: FontWeight.bold,
      
        
      ),),
    ),);
  }
}
