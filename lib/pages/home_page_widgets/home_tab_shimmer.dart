import 'package:flutter/material.dart';
import 'package:flutter_login_bloc/widgets/video_item_shimmer.dart';
import 'package:shimmer/shimmer.dart';

class HomeTabShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double itemWidth = MediaQuery.of(context).size.width * 0.75;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 120,
          child: ListView.builder(
            itemBuilder: (_, index) {
              return Shimmer(
                  period: const Duration(seconds: 2),
                  gradient: const LinearGradient(
                      colors: [Colors.white, Color(0xffdddddd)]),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 70,
                          height: 70,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffcccccc),
                          ),
                        ),
                        const SizedBox(height: 3),
                        Container(height: 13, width: 50, color: Colors.white)
                      ],
                    ),
                  ));
            },
            itemCount: 7,
            scrollDirection: Axis.horizontal,
          ),
        ),
        Shimmer.fromColors(
            baseColor: Color(0xfff0f0f0),
            highlightColor: Color(0xffcccccc),
            child: Container(
              margin: EdgeInsets.only(left: 15, bottom: 10),
              width: 200,
              height: 15,
              color: Colors.white,
            )),
        AspectRatio(
          aspectRatio: 7 / 4,
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(3, (int index) {
                  return Container(
                    width: itemWidth,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    margin: const EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 10)
                    ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Shimmer.fromColors(
                              child: Container(
                                color: Colors.white,
                              ),
                              baseColor: Color(0xfff0f0f0),
                              highlightColor: Color(0xffcccccc)),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Shimmer.fromColors(
                                  child: Container(
                                    height: 15,
                                    width: 100,
                                    color: Colors.black26,
                                  ),
                                  baseColor: Color(0xffcccccc),
                                  highlightColor: Color(0xffaaaaaa)),
                              Shimmer.fromColors(
                                  child: Container(
                                    height: 15,
                                    margin: EdgeInsets.only(top: 5),
                                    width: double.infinity,
                                    color: Colors.black26,
                                  ),
                                  baseColor: Color(0xffcccccc),
                                  highlightColor: Color(0xffaaaaaa)),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }),
              )),
        ),
        Shimmer.fromColors(
            child: Container(
              margin: EdgeInsets.only(left: 10),
              width: 200,
              height: 15,
              color: Colors.white,
            ),
            baseColor: Color(0xfff0f0f0),
            highlightColor: Color(0xffcccccc)),
        SizedBox(
          height: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(6, (index) {
            return VideoItemShimmer();
          }),
        )
      ],
    );
  }
}
