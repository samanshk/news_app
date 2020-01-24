import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class Article extends StatefulWidget {
  var details, head;
  Article(this.details, this.head);
  @override
  _ArticleState createState() => _ArticleState(details, head);
}

class _ArticleState extends State<Article> {
  var details, head;
  _ArticleState(this.details, this.head);
  shareButton() {
    return GestureDetector(
      child: Icon(Icons.share),
      onTap: () {setState(() {
        Share.share('${details['title']}\n${details['url']}');
      });},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(head),
      //   actions: <Widget>[shareButton(), Padding(padding: EdgeInsets.all(6),)],
      //   backgroundColor: Colors.red,
      // ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  // SliverAppBar(
                  //   leading: Icon(Icons.arrow_left),
                  // ),
                  // Padding(padding: EdgeInsets.all(20)),
                  Container(
                    height: 200,
                    width: 400,
                    child: details['urlToImage'] == null ? Text('No Image Available', style: TextStyle(fontSize: 25)) : Image.network(details['urlToImage']),
                  ),
                  Padding(padding: EdgeInsets.all(20)),
                  Text('${details['title']}', style: TextStyle(fontSize: 30)),
                  Padding(padding: EdgeInsets.all(20)),
                  Text('Source: ${details['source']['name']}', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                  Text('📅 ${details['publishedAt'].substring(0, 10)}', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                  Divider(thickness: 1, color: Colors.red,),
                  Padding(padding: EdgeInsets.all(5)),
                  Text('${details['content']}', style: TextStyle(fontSize: 20),),
                  Padding(padding: EdgeInsets.all(5)),
                  GestureDetector(
                    child: Text('more', style: TextStyle(color: Colors.teal, fontSize: 17, fontWeight: FontWeight.bold)),
                    onTap: () => launch(details['url']),
                  ),
                  Padding(padding: EdgeInsets.all(15)),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 15),
              child: GestureDetector(
                child: Icon(Icons.arrow_back, size: 30, color: Colors.red,),
                // child: Text('🔙', style: TextStyle(color: Colors.red)),
                onTap: () => Navigator.pop(context),
              ),
            ),
          ]
           
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {setState(() {
          Share.share('${details['title']}\n${details['url']}');
        });},
        child: Icon(Icons.share, color: Colors.white),
        backgroundColor: Colors.red,        
      ),
    );
  }
}