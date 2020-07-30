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
  int prevPage;
  bool toggleBigSmallCard = true;

  void initState() {
    super.initState();

    pageController = PageController(initialPage: 1, viewportFraction: 0.8)
      ..addListener(_onScroll);
  }

  void _onScroll() {
    if (pageController.page.toInt() != prevPage) {
      prevPage = pageController.page.toInt();
    }
    if (toggleBigSmallCard == false) {
      setState(() {
        toggleBigSmallCard = !toggleBigSmallCard;
      });
    }
  }

  _eventCardList(int index) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (pageController.position.haveDimensions) {
          value = pageController.page - index;
          value = (1 - (value.abs() * 0.1) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: (index != pageController.page)
                ? Container(
                    margin: EdgeInsets.only(bottom: 30, left: 10, right: 10),
                    height: Curves.easeInOut.transform(value) * 125.0,
                    width: Curves.easeInOut.transform(value) * 370.0,
                    child: widget,
                  )
                : Container(
                    padding: EdgeInsets.only(top: 10),
                    margin: EdgeInsets.only(bottom: 30, left: 10, right: 10),
                    height: Curves.easeInOut.transform(value) * 300.0,
                    width: Curves.easeInOut.transform(value) * 370.0,
                    child: widget,
                  ),
          ),
        );
      },
      child: InkWell(
        onTap: () {
          Provider.of<MapsProvider>(context, listen: false).goToLocation(index);
          setState(() {
            toggleBigSmallCard = !toggleBigSmallCard;
          });
        },
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  offset: Offset(0.0, 4.0),
                  blurRadius: 10.0,
                ),
              ],
            ),
            child: (toggleBigSmallCard == false && index == pageController.page)
                ? Column(
                    children: [
                      Expanded(
                        child: Text(
                          eventDummy[index].title,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Text(
                        eventDummy[index].description,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),           
                    ],
                  )
                : Center(
                    child: Text(
                      eventDummy[index].title,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedContainer(
        //padding: EdgeInsets.only(bottom: 20),
        duration: Duration(milliseconds: 300),
        height: toggleBigSmallCard
            ? SizeConfig.screenHeight * .26
            : SizeConfig.screenHeight * .45,
        width: SizeConfig.screenWidth,
        child: Stack(children: [
          PageView.builder(
            controller: pageController,
            itemCount: eventDummy.length,
            itemBuilder: (BuildContext context, int index) {
              return _eventCardList(index);
            },
          ),

          // Align(
          //   alignment: Alignment.center,
          //   child: AnimatedContainer(
          //     duration: Duration(milliseconds: 400),
          //     height: !toggleBigSmallCard ? SizeConfig.screenWidth * 0.15 : 0,
          //     width: SizeConfig.screenWidth * 0.15,
          //     child: Align(
          //       alignment: Alignment.center,
          //       child: Container(
          //         decoration: BoxDecoration(
          //             color: Colors.amber[700], shape: BoxShape.circle),
          //       ),
          //     ),
          //   ),
          // )
        ]),
      ),
    );
  }
}
