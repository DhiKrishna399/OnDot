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

  void initState() {
    super.initState();

    pageController = PageController(initialPage: 1, viewportFraction: 0.8)
      ..addListener(_onScroll);
  }

  void _onScroll() {
    if (pageController.page.toInt() != prevPage) {
      prevPage = pageController.page.toInt();
      //Provider.of<MapsProvider>(context, listen: false).test();
      //Provider.of<MapsProvider>(context, listen: false).moveCamera(pageController);

    }
  }

  _eventCardList(int index) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (pageController.position.haveDimensions) {
          value = pageController.page - index;
          value = (1 - (value.abs() * 0.34) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: Container(
            margin: EdgeInsets.only(top: 100, left: 10, right: 10),            
            height: Curves.easeInOut.transform(value) * 125.0,
            width: Curves.easeInOut.transform(value) * 350.0,
            child: widget,
          ),
        );
      },
      child: InkWell(
        onTap: () {
          //Provider.of<MapsProvider>(context, listen: false).moveCamera();
          //Provider.of<MapsProvider>(context, listen: false).moveCamera(pageController);
          //print(pageController.page.toInt());
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
            child: Center(
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
      child: Container(
        //color: Colors.yellow[100],
        height: SizeConfig.screenHeight * .45,
        width: SizeConfig.screenWidth,
        child: PageView.builder(
          controller: pageController,
          itemCount: eventDummy.length,
          itemBuilder: (BuildContext context, int index) {
            return _eventCardList(index);
          },
        ),
      ),
    );
  }

  void moveCamera(){
    
  }
}
