import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  var veri = "";

  getIslemYap() {
    http.get(Uri.parse("https://www.google.com.tr/")).then((cevap) {
      print(cevap.statusCode);
      print(cevap.body);
      setState(() {
        veri = cevap.body;
      });
    });
    print("get butonuna bastınız");
  }

  postIslemYap() {
    http.post(Uri.parse("https://jsonplaceholder.typicode.com/posts/"),
      body: {
      "title": "",
      "body": "sunucudan gelen cevap",
      "userId": "1",
      "ıd":"389478",
      
    }).then((cevap) {
      setState(() {
       
      print(cevap.body);
        veri = cevap.body.toString();
      });
    });
    print("post butonuna bastınız");
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("honda"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                  color: Colors.green,
                  onPressed: getIslemYap,
                  child: Text("get işlemi"),
                ),
              ),
              Expanded(
                child: RaisedButton(
                  color: Colors.red,
                  onPressed: postIslemYap,
                  child: Text("post işlemi"),
                ),
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: ListView(
                children: <Widget>[
                  Text("Gelen Veri : \n $veri"),
                ],
              ),
            ),
          ),
        ],
      ),
      
    );
  }
}
