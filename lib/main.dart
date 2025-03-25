import 'dart:async';
import 'dart:developer';
import 'package:app/app.dart';
import 'package:flutter/material.dart';

void main() {
  runZonedGuarded(() {
    runApp(const App());
  }, (Object error, StackTrace stackTrace) {
    log(stackTrace.toString());
    log(error.toString());
  });
}
