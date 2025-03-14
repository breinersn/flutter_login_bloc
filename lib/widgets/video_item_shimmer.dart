import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class VideoItemShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 12 / 3,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)]),
        child: Row(
          children: <Widget>[
            Expanded(
                flex: 2,
                child: Shimmer.fromColors(
                    baseColor: Color(0xfff0f0f0),
                    highlightColor: Color(0xffcccccc),
                    child: Container(
                      color: Color(0xffeeeeee),
                    ))),
            Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Shimmer.fromColors(
                          baseColor: Color(0xfff0f0f0),
                          highlightColor: Color(0xffeeeeee),
                          child: Container(
                            width: double.infinity,
                            color: Color(0xffeeeeee),
                            height: 12,
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Shimmer.fromColors(
                          baseColor: Color(0xfff0f0f0),
                          highlightColor: Color(0xffeeeeee),
                          child: Container(
                            width: double.infinity,
                            color: Color(0xffeeeeee),
                            height: 20,
                          )),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
