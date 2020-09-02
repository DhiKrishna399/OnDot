import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:geolocator/geolocator.dart';
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
  String peopleText = 'more people welcome';
  String durationText = 'more minutes left';

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

  Widget bigCardContext(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.screenHeight * 0.02,
        horizontal: SizeConfig.screenWidth * 0.03,
      ),
      child: Column(
        children: [
          Text(
            eventDummy[index].title,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.01,
          ),
          AutoSizeText(
            eventDummy[index].description,
            style: TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.01,
          ),
          Expanded(
            child: Container(
              height: 40,
              width: 220,
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Icon(
                                Icons.person_add,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                eventDummy[index].numPeople.toString(),
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Container(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                peopleText,
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Icon(
                                Icons.alarm,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                eventDummy[index].duration.toString(),
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Container(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                durationText,
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
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
                ? Curves.easeInOut.transform(value) * 280.0
                : Curves.easeInOut.transform(value) * 150.0,
            width: Curves.easeInOut.transform(value) * 360.0,
            child: widget,
          ),
        );
      },
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                Provider.of<MapsProvider>(context, listen: false)
                    .goToLocation(index);
                setState(() {
                  isSmallBigCard = !isSmallBigCard;
                });
              },
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                height: 230.0,
                width: 360.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 15,
                        offset: Offset(0, 8),
                        spreadRadius: 1,
                        color: Colors.black54,
                      )
                    ]),
                child: (index == pageController.page.round() && !isSmallBigCard)
                    ? bigCardContext(index)
                    : Center(
                        child: Text(
                          eventDummy[index].title,
                          style: TextStyle(fontSize: 25),
                          textAlign: TextAlign.center,
                        ),
                      ),
              ),
            ),
          ),
          orangeArrowButton(index),
        ],
      ),
    );
  }

  Widget orangeArrowButton(int index) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 120),
        height:
            (index == pageController.page.round() && !isSmallBigCard) ? 80 : 0,
        width:
            (index == pageController.page.round() && !isSmallBigCard) ? 80 : 0,
        decoration: BoxDecoration(
          color: Colors.orange,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            Icons.arrow_upward_sharp,
            color: Colors.white.withOpacity(
                (index == pageController.page.round() && !isSmallBigCard)
                    ? 1
                    : 0),
            size: 35,
          ),
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
        width: SizeConfig.screenWidth,
        height: isSmallBigCard ? 180 : 320,
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
          ],
        ),
      ),
    );
  }
}
