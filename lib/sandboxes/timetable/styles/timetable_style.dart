import 'dart:ui';

import 'package:flutter/material.dart';


var pixelRatio = window.devicePixelRatio;

 //Size in physical pixels
var physicalScreenSize = window.physicalSize;
var physicalWidth = physicalScreenSize.width;
var physicalHeight = physicalScreenSize.height;

//Size in logical pixels
var logicalScreenSize = window.physicalSize / pixelRatio;
var logicalWidth = logicalScreenSize.width;
var logicalHeight = logicalScreenSize.height;

//Padding in physical pixels
var padding = window.padding;

//Safe area paddings in logical pixels
var paddingLeft = window.padding.left / window.devicePixelRatio;
var paddingRight = window.padding.right / window.devicePixelRatio;
var paddingTop = window.padding.top / window.devicePixelRatio;
var paddingBottom = window.padding.bottom / window.devicePixelRatio;

//Safe area in logical pixels
var safeWidth = logicalWidth - paddingLeft - paddingRight;
var safeHeight = logicalHeight - paddingTop - paddingBottom;

class TimetableStyle {
  final int startHour;

  final int endHour;

  final Color laneColor;

  final Color cornerColor;

  final Color timeItemTextColor;

  final Color timelineColor;

  final Color timelineItemColor;

  final Color mainBackgroundColor;

  final Color timelineBorderColor;

  final Color decorationLineBorderColor;

  final double laneWidth;

  final double laneHeight;

  final double timeItemHeight;

  final double timeItemWidth;

  final double decorationLineHeight;

  final double decorationLineDashWidth;

  final double decorationLineDashSpaceWidth;

  final bool visibleTimeBorder;

  final bool visibleDecorationBorder;

  final Alignment timeItemAlignment; // Aligns timeItem

  /// If the time should be displayed as 24 hours or 12 hour (Am & PM)
  final bool showTimeAsAMPM;

  const TimetableStyle(
      {this.startHour: 0, // Timetable start hour
      this.endHour: 24,   // Timetable end hour
      this.laneColor: Colors.white,
      this.cornerColor: Colors.white,
      this.timelineColor: Colors.white,
      this.timelineItemColor: Colors.white,
      this.mainBackgroundColor: Colors.white,
      this.decorationLineBorderColor: const Color(0x1A000000),
      this.timelineBorderColor: const Color(0x1A000000),
      this.timeItemTextColor: Colors.blue,
      this.laneWidth: 67.7, //width of lane is here, default is 300
      this.laneHeight: 35,
      this.timeItemHeight: 75,
      this.timeItemWidth: 70,
      this.decorationLineHeight: 20,
      this.decorationLineDashWidth: 9,
      this.decorationLineDashSpaceWidth: 4,
      this.visibleTimeBorder: true,
      this.visibleDecorationBorder: false,
      this.timeItemAlignment: Alignment.center,
      this.showTimeAsAMPM: false});
}
