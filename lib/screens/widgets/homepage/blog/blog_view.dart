import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class BlogView extends StatelessWidget {
  final String blogImage;
  final String blogHeading;
  final String blogContents;

  BlogView({
    this.blogImage,
    this.blogContents,
    this.blogHeading,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.share),
          ),
        ],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            color: Colors.red,
            child: Image.network(
              blogImage,
              fit: BoxFit.scaleDown,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              blogHeading,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Html(
              data: blogContents,
            ),
          ),
        ],
      ),
    );
  }
}
