import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:project_q/models/event_dummy.dart';
import 'package:project_q/models/size_config.dart';
import 'package:project_q/providers/maps_provider.dart';
import 'package:project_q/widgets/card_widgets/event_card.dart';
import 'package:provider/provider.dart';

class EventCarousel extends StatefulWidget {
  const EventCarousel({
    Key key,
  }) : super(key: key);

  @override
  _EventCarouselState createState() => _EventCarouselState();
}

class _EventCarouselState extends State<EventCarousel> {
  PageController pageController;

  // true : small => title
  // false : big => description
  bool isSmallBigCard = true;

  void initState() {
    super.initState();
  }

  void _onScroll() {
    // do something on scroll
    if (isSmallBigCard == false) {
      setState(() {
        isSmallBigCard = !isSmallBigCard;
      });
    }
  }

  Widget _eventCardList(int index) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 2;
        if (pageController.position.haveDimensions) {
          value = pageController.page - index;
          value = (1 - (value.abs() * 0.3) + 0.09).clamp(0.0, 1.0);
        }
        return Align(
          alignment: Alignment.bottomCenter,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 160),
            margin: EdgeInsets.only(bottom: 20),
            height: (index == pageController.page.round() && !isSmallBigCard)
                ? Curves.easeInOut.transform(value) * 220.0
                : Curves.easeInOut.transform(value) * 150.0,
            width: Curves.easeInOut.transform(value) * 360.0,
            child: widget,
          ),
        );
      },
      child: GestureDetector(
        onTap: () {
          Provider.of<MapsProvider>(context, listen: false).goToLocation(index);
          setState(() {
            isSmallBigCard = !isSmallBigCard;
          });
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Center(
            child: Text(
              eventDummy[index].title,
              style: TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  Widget orangeArrowButton(int index) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 70),
        height: isSmallBigCard ? 0 : 80,
        width: isSmallBigCard ? 0 : 80,
        decoration: BoxDecoration(
          color: Colors.orange,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    pageController =
        PageController(initialPage: 0, viewportFraction: 0.8, keepPage: true)
          ..addListener(_onScroll);
    SizeConfig().init(context);
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        color: Colors.red[100],
        width: SizeConfig.screenWidth,
        height: isSmallBigCard ? 180 : 250,
        child: Stack(
          overflow: Overflow.visible,
          children: [
            PageView.builder(
              controller: pageController,
              itemCount: eventDummy.length,
              itemBuilder: (BuildContext context, int index) {
                return _eventCardList(index);
              },
            ),
            orangeArrowButton(0),
          ],
        ),
      ),
    );
  }
}
