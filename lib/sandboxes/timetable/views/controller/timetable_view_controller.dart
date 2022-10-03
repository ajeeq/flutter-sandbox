import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

mixin TimetableViewController<T extends StatefulWidget> on State<T> {
  final _horizontalScrollController = ScrollController();
  final _verticalScrollController = ScrollController();
  final _horizontalPixelsStream = StreamController<double>();
  final _verticalPixelsStream = StreamController<double>();

  ScrollController get horizontalScrollController =>
      _horizontalScrollController;

  ScrollController get verticalScrollController => _verticalScrollController;

  StreamController get horizontalPixelsStream => _horizontalPixelsStream;

  StreamController get verticalPixelsStream => _verticalPixelsStream;

  void initController() {
    horizontalScrollController.addListener(horizontalScrollListener);
    verticalScrollController.addListener(verticalScrollListener);

    /// callback is used to ensure that Timetable scrolls down to display the current hour range
    /// Else Timetable will show start on whatever the first hour is, making the user scroll down all the time
    /// Feedback showed this is not a great user experience hence the need for this call back
    SchedulerBinding.instance.addPostFrameCallback((_) {
      var now = DateTime.now();
      double value = (now.hour * 65).toDouble();
      verticalScrollController.jumpTo(value);
    });
  }

  void disposeController() {
    _horizontalPixelsStream.close();
    _verticalPixelsStream.close();
  }

  void setHorizontal(double num) {
    if (_horizontalScrollController.position.maxScrollExtent >= num) {
      _horizontalScrollController.jumpTo(num);
    }
  }

  void setVertical(double num) {
    if (_verticalScrollController.position.maxScrollExtent >= num) {
      _verticalScrollController.jumpTo(num);
    }
  }

  void horizontalScrollListener() {
    _horizontalPixelsStream.sink
        .add(_horizontalScrollController.position.pixels);
  }

  void verticalScrollListener() {
    _verticalPixelsStream.sink.add(_verticalScrollController.position.pixels);
  }

  void onScroll(val) {
    double dxNam = val.dx;
    if (dxNam < 0) dxNam *= -1;
    setHorizontal(dxNam);

    double dyNam = val.dy;
    if (dyNam < 0) dyNam *= -1;
    setVertical(dyNam);
  }
}
