import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:groceryapp/CategoryPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: false,
                title: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                  decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.all(Radius.circular(22))),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.only(left: 10),
                          child: SimpleAutoCompleteTextField(
                            key: key,
                            suggestions: [
                              "Carrot",
                              "Broccoli",
                              "Asparagus",
                              "Cauliflower",
                              "Corn",
                              "Cucumber",
                              "Eggplant",
                              "Green pepper",
                              "Lettuce",
                              "Mushrooms",
                              "Chili",
                              "Onion",
                              "Pumpkin",
                              "Red pepper",
                              "Tomato",
                              "Beetroot",
                              "Brussel sprouts",
                              "Peas",
                              "Zucchini",
                              "Radish",
                              "Sweet potato",
                              "Artichoke",
                              "Leek",
                              "Cabbage",
                              "Celery",
                              "Garlic",
                              "Basil",
                              "Coriander",
                              "Parsley",
                              "Dill",
                              "Rosemary",
                              "Oregano",
                              "Cinnamon",
                              "Saffron",
                              "Green bean",
                              "Bean",
                              "Chickpea",
                              "Lentil",
                            ],
                            textCapitalization: TextCapitalization.sentences,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search",
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 0,
                        child: Row(
                          children: <Widget>[
                            IconButton(
                              color: Colors.black,
                              icon: Icon(Icons.search),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                backgroundColor: Colors.white,
                expandedHeight: 150,
                flexibleSpace: FlexibleSpaceBar(
                  background: new SizedBox(
                    height: 150,
                    width: double.infinity,
                    child: Carousel(
                      images: [
                        AssetImage('images/banner1.png'),
                        AssetImage('images/banner2.png'),
                      ],
                      dotBgColor: Colors.transparent,
                      animationDuration: Duration(milliseconds: 700),
                    ),
                  ),
                ),
              )
            ];
          },
          body: GridView.count(
            crossAxisCount: 3,
            children: <Widget>[
              makeCategory(
                  catImage: 'images/vegitables.jpg',
                  title: 'Vegitables',
                  tag: 'Vegitable'),
              makeCategory(
                  catImage: 'images/fruits.jpg',
                  title: 'Fruits',
                  tag: 'Fruits'),
              makeCategory(
                  catImage: 'images/meats.jpg',
                  title: 'Fresh Meat',
                  tag: 'Meat'),
              makeCategory(
                  catImage: 'images/rice.jpg',
                  title: 'Cereals & Grains',
                  tag: 'Cereals'),
              makeCategory(
                  catImage: 'images/bread.jpg', title: 'Bakery', tag: 'Bakery'),
              makeCategory(
                  catImage: 'images/fish.jpeg',
                  title: 'Fresh Fish',
                  tag: 'Fish'),
            ],
          )),
    );
  }

  Widget makeCategory({catImage, title, tag}) {
    return AspectRatio(
        aspectRatio: 2 / 2,
        child: Hero(
          tag: title,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CategoryPage(
                          catImage: catImage, title: title, tag: tag)));
            },
            child: Column(
              children: <Widget>[
                Container(
                  height: 70,
                  width: 80,
                  margin: EdgeInsets.only(right: 10, bottom: 10),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: AssetImage(catImage), fit: BoxFit.cover)),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Colors.black),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
