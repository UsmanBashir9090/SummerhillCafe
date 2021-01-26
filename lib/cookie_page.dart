import 'package:flutter/material.dart';
import 'package:summerhillCafe/cookie_detail.dart';

class CookiePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 15.0),
          Container(
              padding: EdgeInsets.only(right: 15.0),
              width: MediaQuery.of(context).size.width - 30.0,
              height: MediaQuery.of(context).size.height - 220,

              child: GridView.count(
                crossAxisCount: 2,
                primary: false,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 15.0,
                childAspectRatio: 0.8,
                children: <Widget>[

                    _buildCard('Italian Cut Pizza', 'Rs 100/-', 'assets/new/italianpizza.jpg',
                        false, false, context),
                    _buildCard('Summerhill B.B.Q Burger', 'Rs 100/-', 'assets/burgerbbq.jpg',
                        false, false, context),
                    _buildCard('Summerhill Malai Burger', 'Rs 100/-', 'assets/new/summerhillBurgermalai.jpg',
                        false, false, context),
                    _buildCard('Summerhill Burger Platter', 'Rs 150/-', 'assets/new/summerhillDouble.jpg',
                        false, false, context),
                    _buildCard('Chicken Shawarma', 'Rs 100/-', 'assets/new/shawarma.jpg',
                        false, false, context),
                    _buildCard('Sandwich Platter', 'Rs 150/-', 'assets/new/sandwichPlatter.jpg',
                        false, false, context),
                    _buildCard('Pizza Slice', 'Rs 100/-', 'assets/new/pizzaSlice.jpg',
                        false, false, context),
                    _buildCard('Pizza Sandwich', 'Rs 100/-', 'assets/new/pizzaSandwich.jpg',
                        false, false, context),
                    _buildCard('Pizza Roll', 'Rs 100/-', 'assets/longpizza.jpg',
                        false, false, context),
                    _buildCard('Chicken Cross', 'Rs 80/-', 'assets/new/crossmini.jpg',
                        false, false, context),
                    _buildCard('Cheese Roll', 'Rs 100/-', 'assets/new/cheeseroll.jpg',
                        false, false, context),
                    _buildCard('Bread Roll', 'Rs 100/-', 'assets/new/breadRoll.jpg',
                        false, false, context),


                  //Biscuits
                  _buildCard('Butter Cookies', 'Rs 100/-', 'assets/new/cookie.jpg',
                      false, false, context),
                  _buildCard('Cake Rusks', 'Rs 100/-', 'assets/new/cakerusk.jpg',
                      false, false, context),
                  _buildCard('Zeera Biscuits', 'Rs 100/-', 'assets/new/biscuitsZeera.jpg',
                      false, false, context),
                  _buildCard('Jam Biscuits', 'Rs 100/-', 'assets/new/biscuitJam.jpg',
                      false, false, context),
                  _buildCard('Chocolate Biscuits', 'Rs 100/-', 'assets/new/biscuitchocolate.jpg',
                      false, false, context),
                  _buildCard('Check Biscuits', 'Rs 100/-', 'assets/new/biscuitCheck.jpg',
                      false, false, context),

                  //patties
                  _buildCard('Chicken Patties', 'Rs 30/-', 'assets/chickenpatties.jpg',
                      false, false, context),
                  _buildCard('Patties Vegetable Triangle', 'Rs 30/-', 'assets/new/pattiesVegetriangle.jpg',
                      false, false, context),
                  _buildCard('Vegetable Patties', 'Rs 30/-', 'assets/vegetablepatties.jpg',
                      false, true, context),

                  //desserts
                  _buildCard('Banana Bread', 'Rs 100/-', 'assets/new/bananaBread.jpg',
                      false, false, context),
                  _buildCard('Chocolate Brownie', 'Rs 100/-', 'assets/new/brownieChoc.jpg',
                      false, false, context),
                  _buildCard('Choclate Cake', 'Rs 100/-', 'assets/new/cake.jpg',
                      false, false, context),
                  _buildCard('Cupcake', 'Rs 50/-', 'assets/cupcake.jpg',
                      false, false, context),
                  _buildCard('Fruit Cup', 'Rs 100/-', 'assets/new/fruitCup.jpg',
                      false, false, context),

                  //Donuts
                  _buildCard('Chocolate Sprinkle Donut ', 'Rs 100/-', 'assets/new/donutSprinkle.jpg',
                      false, false, context),
                  _buildCard('Chocolate Chip Donut ', 'Rs 100/-', 'assets/new/donutChip.jpg',
                      false, false, context),
                  _buildCard('Vanilla Donut', 'Rs 100/-', 'assets/donut.jpg',
                      false, false, context),
                ],
              )),
          SizedBox(height: 15.0)
        ],
      ),
    );
  }

  Widget _buildCard(String name, String price, String imgPath, bool added,
      bool isFavorite, context) {
    return Padding(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CookieDetail(
                    assetPath: imgPath,
                    cookieprice:price,
                    cookiename: name
                  )));
            },
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3.0,
                          blurRadius: 5.0)
                    ],
                    color: Colors.white),
                child: Column(children: [
                  Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            isFavorite
                                ? Icon(Icons.favorite, color: Color(0xFFEF7532))
                                : Icon(Icons.favorite_border,
                                    color: Color(0xFFEF7532))
                          ])),
                  Hero(
                      tag: imgPath,
                      child: Container(
                          height: 125.0,
                          width: 125.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(imgPath),
                                  fit: BoxFit.contain)))),
                  SizedBox(height: 7.0),
                  Text(price,
                      style: TextStyle(
                          color: Color(0xFFCC8053),
                          fontFamily: 'Varela',
                          fontSize: 18.0)),
                  SizedBox(height: 5.0),
                  Text(name,
                      style: TextStyle(
                          color: Color(0xFF575E67),
                          fontFamily: 'Varela',
                          fontSize: 16.0)),
                  Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Container(color: Color(0xFFEBEBEB), height: 2.0)),

                ]))));
  }
}
