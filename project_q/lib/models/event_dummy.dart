import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import './event.dart';

List<Event> eventDummy = [
  Event(
      title: 'Painting a mural of dogs',
      description: 'Come by and paint! Supplies and spunky music provided!!',
      duration: 27,
      numPeople: 7,
      position: Position(latitude:38.016536, longitude: -122.137974 )),
  Event(
    title: 'Knitting with the elderly',
    description:
        'Learn how to knit! Any skillset welcomed! We got classical music and tea!!!!',
    duration: 60,
    numPeople: 5,
    position: Position(latitude:38.015759, longitude: -122.136413 )),
  Event(
    title: 'Gardening for the Homeless Project',
    description:
        "It's a lovely sunday afternoon. Decompress and garden with us! We have all the supplies you need",
    duration: 45,
    numPeople: 3,
      position: Position(latitude:38.017420, longitude: -122.135500 )),

  Event(
    title: 'Mountain Bike Group Meet up',
    description: "@ a cofee shop. Plan to bike Santa Cruz mountains.",
    duration: 10,
    numPeople: 9,
     position: Position(latitude:38.018447, longitude: -122.137282 )),
];
