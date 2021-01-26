import 'package:flutter/material.dart';
import 'package:summerhillCafe/bottom_bar.dart';
import 'main.dart';

class CookieDetail extends StatelessWidget {
  final CallService _service = locator<CallService>();
  final assetPath, cookieprice, cookiename;

  CookieDetail({this.assetPath, this.cookieprice, this.cookiename});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF545D68)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),

        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Image.asset(
                    'assets/berry.png',
                    fit: BoxFit.contain,
                    height: 28,
                  ),
                ),
                Container(
                    padding: const EdgeInsets.fromLTRB(4.0, 5.0, 90.0, 0.0),
                    child: Text('SummerHill Cafe',
                        style: TextStyle(
                          color: Colors.red,
                          fontFamily: 'Varela',
                          fontSize: 16.0,
                        ))),
              ],
            ),
          ],
        ),
      ),

      body: ListView(
        children: [
          SizedBox(height: 15.0),
          Padding(
            padding: EdgeInsets.only(left: 50.0, top: 10.0, bottom: 10.0),
            child: Text(
              cookiename,
              style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF575E67))
            ),
          ),
            SizedBox(height: 15.0),
            Hero(
              tag: assetPath,
              child: Image.asset(assetPath,
              height: 200.0,
              width: 150.0,
              fit: BoxFit.contain
              )
            ),
            SizedBox(height: 20.0),
            Center(
              child: Text(cookieprice,
                  style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF17532))),
            ),
            SizedBox(height: 10.0),
            Center(
              child: Text('',
                  style: TextStyle(
                      color: Color(0xFF575E67),
                      fontFamily: 'Varela',
                  )),
            ),
            SizedBox(height: 20.0),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 120.0,
                height: 10.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Color(0xFFF17532)
                ),
                child: Center(
                  child: Text('',
                    style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                ),
                  )
                )
              )
            )
        ]
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFF17532),
        child: Icon(Icons.call),
        onPressed: ()=> _service.call("03213659343"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );
  }
}
