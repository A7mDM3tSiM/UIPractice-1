import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget buttonKey(IconData icon, String title, double h, double w, bool on) {
    return Column(
      children: [
        Container(
          height: h,
          width: w,
          decoration: BoxDecoration(
              color: on ? Colors.deepOrange : Colors.green,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12, spreadRadius: 1.0, blurRadius: 20),
              ]),
          child: Center(
            child: Icon(
              icon,
              size: 45,
              color: on ? Colors.white : Colors.grey[300],
            ),
          ),
        ),
        SizedBox(
          height: h * .1,
        ),
        Text(title,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ))
      ],
    );
  }

  Widget option({
    String title = '',
    bool message = false,
    double h = 0.0,
    double w = 0.0,
  }) {
    return Container(
      height: h,
      width: w,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: w * .035, vertical: h * .01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 15,
                    color: title == "Sign Out" ? Colors.red : Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(width: w * 0.04),
              message
                  ? CircleAvatar(
                      radius: h * .15,
                      backgroundColor: Colors.deepOrange,
                      child: Text(
                        "${title.length}",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    )
                  : Container(),
            ],
          ),
          Icon(Icons.arrow_forward_ios_rounded,
              color: Colors.grey[300], size: 20)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 18),
                height: height * 0.25,
                width: width,
                color: Colors.black87,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Settings",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 24)),
                      SizedBox(height: height * .045),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                  radius: height * 0.05,
                                  backgroundColor: Colors.black,
                                  backgroundImage:
                                      AssetImage("assets/profile.jpeg")),
                              SizedBox(width: width * .05),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Hello!",
                                    style: TextStyle(
                                      color: Colors.grey[300],
                                    ),
                                  ),
                                  SizedBox(height: height * 0.01),
                                  Text(
                                    "Ahmed Mutasim",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(360),
                                  border: Border.all(
                                      width: .5, color: Colors.grey)),
                              child: Icon(Icons.edit,
                                  size: 17, color: Colors.grey[200]))
                        ],
                      ),
                    ]),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: width * .025),
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(height: height * .04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buttonKey(Icons.power_settings_new, "Off Energy",
                        height * .12, width * .22, true),
                    buttonKey(Icons.lock, "Left Home", height * .12,
                        width * .22, false),
                    buttonKey(Icons.vpn_key_rounded, "Came Home", height * .12,
                        width * .22, false)
                  ],
                ),
                SizedBox(height: height * .04),
              ],
            ),
          ),
          SizedBox(
            height: height * .01,
          ),
          option(title: "My Home", h: height * .08, w: width),
          SizedBox(
            height: height * 0.002,
          ),
          option(title: "Messages", message: true, h: height * .08, w: width),
          SizedBox(
            height: height * 0.002,
          ),
          option(title: "Family Access", h: height * .08, w: width),
          SizedBox(
            height: height * 0.01,
          ),
          option(title: "Change Password", h: height * .08, w: width),
          SizedBox(
            height: height * 0.002,
          ),
          option(title: "Support", h: height * .08, w: width),
          SizedBox(
            height: height * 0.01,
          ),
          option(title: "Sign Out", h: height * .08, w: width),
        ],
      ),
    );
  }
}
