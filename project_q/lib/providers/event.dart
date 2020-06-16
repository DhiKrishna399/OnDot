//import 'dart:convert';

import 'package:flutter/foundation.dart';
//import 'package:http/http.dart' as http;

class Event with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  
  Event({
    @required this.id,
    @required this.title,
    @required this.description,
  });

}