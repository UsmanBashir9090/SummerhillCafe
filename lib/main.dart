import 'package:flutter/material.dart';
import 'package:summerhillCafe/bottom_bar.dart';
import 'package:summerhillCafe/cookie_page.dart';
import 'package:get_it/get_it.dart';
import 'package:url_launcher/url_launcher.dart';


class CallService{
  void call(String number)=>launch("tel:$number");
}

GetIt locator = GetIt.instance;

void setCall(){
  locator.registerSingleton(CallService());
}

void main() {
  setCall();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}



class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  final CallService _service = locator<CallService>();
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_none, color: Color(0xFF545D68)),
            onPressed: () {},
          ),
        ],
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/berry.png',
                  fit: BoxFit.contain,
                  height: 28,
                ),
                Container(
                    padding: const EdgeInsets.fromLTRB(4.0, 8.0, 0, 0),
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
        padding: EdgeInsets.only(left: 20.0),
        children: <Widget>[
          SizedBox(height: 10.0),
          Text('Menu',
              textAlign:TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 36.0,
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold)
          ),
          SizedBox(height: 0.0),
          /*
          TabBar(
              controller: _tabController,
              indicatorColor: Colors.transparent,
              labelColor: Color(0xFFC88D67),
              isScrollable: true,
              labelPadding: EdgeInsets.only(right: 45.0),
              unselectedLabelColor: Color(0xFFCDCDCD),
              tabs: [
                Tab(
                  child: Text('',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 18.0,
                      )),
                ),
                Tab(
                  child: Text('',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 21.0,
                      )),
                ),
                Tab(
                  child: Text('',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 21.0,
                      )),
                )
              ]),

           */
          Container(
              height: MediaQuery.of(context).size.height - 50.0,
              width: double.infinity,
              child: TabBarView(controller: _tabController, children: [
                CookiePage(),
                CookiePage(),
                CookiePage(),
              ]))
        ],
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
