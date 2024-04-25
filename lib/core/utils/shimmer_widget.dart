import 'package:doc_doc_application/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerList extends StatelessWidget {
  const ShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    int offset = 0;
    int time = 1000;

    return SafeArea(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          offset += 5;
          time = 800 + offset;
          print(time);

          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Shimmer.fromColors(
                highlightColor: Colors.white,
                baseColor: AppColors.normalGray20,
                period: Duration(milliseconds: time),
                child: const ShimmerLayout(),
              ));
        },
      ),
    );
  }
}

class ShimmerLayout extends StatelessWidget {
  const ShimmerLayout({super.key});

  @override
  Widget build(BuildContext context) {
    double containerWidth = MediaQuery.of(context).size.width - 150;
    double containerHeight = 15;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7.5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 100,
            width: 100,

            decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.grey,),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: containerHeight,
                width: containerWidth,
                color: AppColors.normalGray20
              ),
              const SizedBox(height: 5),
              Container(
                height: containerHeight,
                width: containerWidth,
                  color: AppColors.normalGray20
              ),
              const SizedBox(height: 5),
              Container(
                height: containerHeight,
                width: containerWidth * 0.75,
                  color: AppColors.normalGray20
              )
            ],
          )
        ],
      ),
    );
  }
}