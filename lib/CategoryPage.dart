import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:groceryapp/Tools/Products.dart';

class CategoryPage extends StatefulWidget {
  final String title;
  final String catImage;
  final String tag;
  const CategoryPage({Key key, this.title, this.catImage, this.tag})
      : super(key: key);
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<Products> productList = [];
  @override
  void initState() {
    super.initState();
    DatabaseReference productRef =
        FirebaseDatabase.instance.reference().child("Products");
    productRef
        .orderByChild("category")
        .equalTo(widget.title)
        .once()
        .then((DataSnapshot snap) {
      var KEYS = snap.value.keys;
      var DATA = snap.value;

      productList.clear();
      for (var individualKey in KEYS) {
        Products products = new Products(
          DATA[individualKey]['category'],
          DATA[individualKey]['pName'],
          DATA[individualKey]['price'],
          DATA[individualKey]['pid'],
          DATA[individualKey]['image'],
          DATA[individualKey]['type'],
          DATA[individualKey]['description'],
          DATA[individualKey]['kgs'],
        );
        productList.add(products);
      }
      setState(() {
        print('Length:${productList.length}');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: new Text(
                widget.title,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              backgroundColor: Colors.white,
              expandedHeight: 140,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  height: 140,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(widget.catImage),
                          fit: BoxFit.cover)),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomRight,
                            colors: [
                          Colors.black.withOpacity(.0),
                          Colors.black.withOpacity(.6)
                        ])),
                  ),
                ),
              ),
            )
          ];
        },
        body: Container(
            child: productList.length == 0
                ? Center(
                    child: CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(
                          Colors.orangeAccent),
                    ),
                  )
                : new GridView.builder(
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: productList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return productsUI(
                        productList[index].category,
                        productList[index].pName,
                        productList[index].price,
                        productList[index].pid,
                        productList[index].image,
                        productList[index].type,
                        productList[index].description,
                        productList[index].kgs,
                      );
                    })),
      ),
    );
  }

  Widget productsUI(
    String category,
    String pName,
    String price,
    String pid,
    String image,
    String type,
    String description,
    String kgs,
  ) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ListView(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 140,
                    width: 160,
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              description,
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 8,
                  color: Colors.black54),
            ),
            Center(
              child: Text(
                pName,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black),
              ),
            ),
            Center(
              child: Text(
                "$kgs kg/kgs Rs. $price",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
