import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Blog extends StatefulWidget {
  @override
  _BlogState createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  final controller = PageController(
    initialPage: 0,
    keepPage: true,
    viewportFraction: 1,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 300,
          margin: EdgeInsets.all(5),
          // color: Colors.white,
          child: GridView.count(
            physics: BouncingScrollPhysics(),
            primary: false,
            scrollDirection: Axis.horizontal,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            shrinkWrap: false,
            childAspectRatio: 0.78,
            controller: controller,
            children: List.generate(
              10,
              (_) => BlogContents(),
            ),
          ),
        ),
        SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: SmoothPageIndicator(
                  controller: controller,
                  count: 5,
                  axisDirection: Axis.horizontal,
                  effect: SlideEffect(
                      spacing: 10,
                      radius: 10,
                      dotWidth: 20.0,
                      dotHeight: 5.0,
                      dotColor: Colors.white,
                      paintStyle: PaintingStyle.stroke,
                      strokeWidth: 1,
                      activeDotColor: Colors.orange),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  textStyle: TextStyle(color: Colors.white),
                  padding: EdgeInsets.all(8.0),
                ),
                child: Text("View All"),
                onPressed: () {
                  print("View All Clicked");
                },
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}

class BlogContents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Blog Clicked");
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Container(
                  color: Colors.blue,
                  child: Image.network(
                    'https://i.pinimg.com/originals/51/7e/83/517e83eb97c94ffc7bec62db71c3c586.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.grey[300],
                  child: Text(
                    "This is a long big paragraph... You can read from the blog",
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
