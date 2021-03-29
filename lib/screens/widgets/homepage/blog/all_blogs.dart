import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zooppy/providers/home_page_provider.dart';
import 'package:zooppy/screens/widgets/homepage/blog/blog_view.dart';

class AllBlogs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        title: Text("Blogs"),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<HomePageProvider>(
          builder: (_, value, __) => GridView.builder(
            scrollDirection: Axis.vertical,
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
                        blogHeading:
                            value.blogsModel.blogs.data.elementAt(index).title,
                        blogContents:
                            value.blogsModel.blogs.data.elementAt(index).body,
                        blogImage:
                            value.blogsModel.blogs.data.elementAt(index).image,
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
                          Container(
                            color: Colors.white,
                            width: double.infinity,
                            padding:
                                EdgeInsets.only(left: 10, top: 5, bottom: 5),
                            child: Text(
                              "27/18/2021",
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              padding: EdgeInsets.all(10),
                              color: Colors.white,
                              width: double.infinity,
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
                        top: 80,
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
                                ? value.blogsModel.noIndustryText.toUpperCase()
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
    );
  }
}
