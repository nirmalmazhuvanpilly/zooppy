import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zooppy/providers/home_page_provider.dart';
import 'package:zooppy/screens/widgets/homepage/blog/all_blogs.dart';
import 'package:zooppy/screens/widgets/homepage/blog/blog_view.dart';

class Blog extends StatelessWidget {
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
          child: Consumer<HomePageProvider>(
            builder: (_, value, __) => GridView.builder(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: value.blogsModel.blogs.data.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlogView(
                          blogHeading: value.blogsModel.blogs.data
                              .elementAt(index)
                              .title,
                          blogContents:
                              value.blogsModel.blogs.data.elementAt(index).body,
                          blogImage: value.blogsModel.blogs.data
                              .elementAt(index)
                              .image,
                        ),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Stack(
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              flex: 5,
                              child: Container(
                                width: double.infinity,
                                color: Colors.blue,
                                child: Image.network(
                                  value.blogsModel.blogs.data
                                      .elementAt(index)
                                      .image,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(10),
                                color: Colors.grey[300],
                                child: Text(
                                  value.blogsModel.blogs.data
                                      .elementAt(index)
                                      .title
                                      .toString(),
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 70,
                          left: 5,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 2,
                              horizontal: 4,
                            ),
                            color: Colors.white,
                            child: Text(
                              value.blogsModel.blogs.data
                                          .elementAt(index)
                                          .filmIndustry ==
                                      null
                                  ? value.blogsModel.noIndustryText
                                      .toUpperCase()
                                  : value.blogsModel.blogs.data
                                      .elementAt(index)
                                      .filmIndustry
                                      .name
                                      .toUpperCase(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AllBlogs(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                onPrimary: Colors.white,
              ),
              child: Text("View All"),
            ),
          ),
        ),
      ],
    );
  }
}
