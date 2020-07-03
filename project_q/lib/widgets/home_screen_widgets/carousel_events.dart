import 'package:flutter/material.dart';


import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:project_q/models/event_dummy.dart';
import 'package:project_q/widgets/card_widgets/event_card.dart';


class EventCarousel extends StatelessWidget {
  const EventCarousel({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 320,
        child: Swiper(
          itemCount: eventDummy.length,
          scale: 0.80,
          viewportFraction: 0.66,
          itemBuilder: (context, index) {
            return CardEvent(eventDummy[index]);
          },
        ),
      ),
    );
  }
}

