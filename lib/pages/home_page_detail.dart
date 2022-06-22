import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final item catalog;

  const HomeDetailPage({Key key, @required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
          catalog.price.text.xl4.make(),
          ElevatedButton(onPressed: () {}, child: "Buy".text.center.xl3.make().p12().wh(100, 50),
          style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.blue),)),

        ],).p16(),
      body:
      SafeArea(bottom: false,
        child: Column( 
      
        
        children: [
          Hero(
            tag: Key(catalog.id.toString()), 
          child: 
        Image.network(catalog.image)
        ).p16(),
        Expanded(
          child:VxArc(
            height: 30,
            arcType: VxArcType.CONVEY, 
            edge: VxEdge.TOP,

            
          child:  
          Container(
            width: context.screenWidth,
            color: Colors.red,
            child: Column(
              children: [
                catalog.name.text.xl4.bold.make(),
                catalog.desc.text.xl.make(),
              ],

            ).p64(),
             
          ),
          ),
        )

      ],
      ).pLTRB(0, 32, 0, 0).centered(),
    ));
  }
}
