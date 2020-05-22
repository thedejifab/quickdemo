import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'colors.dart';

class CustomSliverHeader implements SliverPersistentHeaderDelegate {
  CustomSliverHeader({
    this.minExtent,
    @required this.maxExtent,
  });
  final double minExtent;
  final double maxExtent;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 24),
              IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: CustomColors.mainColor,
                  size: 28,
                ),
                onPressed: () {},
              ),
              SizedBox(height: 24),
              Text(
                'PTA Meeting',
                style: TextStyle(
                  fontSize: 24,
                  color: CustomColors.mainColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 24),
              Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: CustomColors.badgeColor,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      RichText(
                          text: TextSpan(children: <InlineSpan>[
                        TextSpan(
                          text: 'Vintage Heights',
                          style: TextStyle(
                            fontSize: 14,
                            color: CustomColors.mainColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: ' | 5 January, 2020',
                          style: TextStyle(
                            fontSize: 14,
                            color: CustomColors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ])),
                      SizedBox(height: 10),
                      Text(
                        'To you (Tolulope Saba)',
                        style: TextStyle(
                          fontSize: 14,
                          color: CustomColors.mainColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 24),
              Divider(
                height: 0,
                color: CustomColors.grey,
              ),
              SizedBox(height: 36),
              Text(
                '1. We now charge Bitcoin for deposits. We deduct a small fee from each Bitcoin amount you send to our app.',
                style: TextStyle(
                  fontSize: 14,
                  color: CustomColors.mainColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 24),
              Text(
                '2. We posted this notice in our community group a few days ago. But since many people missed it, we decided to write it in this email as well.',
                style: TextStyle(
                  fontSize: 14,
                  color: CustomColors.mainColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 24),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    Icons.calendar_today,
                    size: 16,
                    color: CustomColors.purple,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Add to calendar',
                    style: TextStyle(
                      fontSize: 14,
                      color: CustomColors.purple,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  double titleOpacity(double shrinkOffset) {
    return 1.0 - max(0.0, shrinkOffset) / maxExtent;
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;

  @override
  OverScrollHeaderStretchConfiguration get stretchConfiguration => null;
}
