import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_complete_guide/models/catalog.dart';
import 'package:flutter_complete_guide/pages/cart_page.dart';
import 'package:flutter_complete_guide/pages/home_page_detail.dart';
import 'package:flutter_complete_guide/utils/routes.dart';
import 'package:flutter_complete_guide/widgets/drawer.dart';

import '../widgets/item_widget.dart';
import 'package:velocity_x/velocity_x.dart';

class homepage extends StatefulWidget {
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  void initState() {
    super.initState();
    LoadData();
  }

  LoadData() async {
    final catalogjson =
        await rootBundle.loadString("assets/files/catalog.json");
    final DecodedData = jsonDecode(catalogjson);
    var ProductsData = DecodedData["products"];
    CatalogModel.items = List.from(ProductsData)
        .map<item>((item1) => item.fromMap(item1))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.cyan[50],
        floatingActionButton: FloatingActionButton(onPressed: (() {
          Navigator.pushNamed(context, Myroutes.cart);
        }),
        child: Icon(CupertinoIcons.cart)
        ),
        body: SafeArea(
            child: Container(
                padding: Vx.m32,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CatalogHeader(),
                    if (CatalogModel.items != null &&
                        CatalogModel.items.isNotEmpty)
                      cataloglist().expand()
                    else
                      Center(
                        child: CircularProgressIndicator().centered().expand(),
                      )
                  ],
                ))));
  }
}

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.make(),
        "Trending products".text.xl.make().p12(),
      ],
    );
  }
}

class cataloglist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.items[index];
          return InkWell(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeDetailPage(catalog: catalog))),
            child: catalogitem(catalog: catalog),
          );
        });
          
          
  }
}

class catalogitem extends StatelessWidget {
  const catalogitem({Key key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);
  final item catalog;

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(tag: Key(catalog.id.toString()),
         child:catalogimage(image: catalog.image,
       )
       ),
       Expanded(
        child: 
       Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        catalog.name.text.bold.lg.make(),
        catalog.desc.text.make(),
        ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
          catalog.price.text.xl.make(),
          ElevatedButton(onPressed: () {}, child: "Add to Cart".text.make(),
          style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.blue),)),

        ],)
       ],)
       )
      ],
    )).white.square(150).py16.make();
  }
}

class catalogimage extends StatelessWidget {
  const catalogimage({Key key, this.image}) : super(key: key);

  @override
  final String image;
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .p16
        .color(Colors.cyan[50])
        .make()
        .p16()
        .w40(context);
  }
}
