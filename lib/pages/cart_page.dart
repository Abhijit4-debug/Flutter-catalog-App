import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class cartpage extends StatelessWidget {
  const cartpage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:"cart".text.xl3 .black.make().centered(),
      ),
      
    );
  }
}
