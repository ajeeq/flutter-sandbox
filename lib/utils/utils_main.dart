// Models
import 'package:flutter_sandbox/models/detail.dart';

class UtilsMain {
  static int getHourInt(String hour) {
      var parsedHour = int.parse((hour).split(":")[0]);
      return parsedHour;
    }

  static int getMinuteInt(String minute) {
    var parsedMinute = int.parse((minute).substring(3,5));
    return parsedMinute;
  }

  static int hourToMinute(String hour, String minute) {
    var totalMinute = (int.parse(hour))*60 + int.parse(minute);
    return totalMinute;
  }

  static Set isClash(List<DetailElement> json) {
    // print("[utils_main.dart] json: $json");

    bool clashed = false;
    var clashOne;
    var clashTwo;

    for (var i=0; i<json.length; i++) {
      for (var j=i+1; j<json.length; j++) {
        // if first time is the same day with the second day
        if(json[i].day == json[j].day) {
          String startHourFormer = (json[i].start).split(":")[0];
          String startMinuteFormer = (json[i].start).split(":")[1].split(" ")[0];

          String endHourFormer = (json[i].end).split(":")[0];
          String endMinuteFormer = (json[i].end).split(":")[1].split(" ")[0];

          String startHourLatter = (json[j].start).split(":")[0];
          String startMinuteLatter = (json[j].start).split(":")[1].split(" ")[0];

          String endHourLatter = (json[j].end).split(":")[0];
          String endMinuteLatter = (json[j].end).split(":")[1].split(" ")[0];

          var summedMinutesStartFormer = UtilsMain.hourToMinute(startHourFormer, startMinuteFormer);
          var summedMinutesEndFormer = UtilsMain.hourToMinute(endHourFormer, endMinuteFormer);
          var summedMinutesStartLatter = UtilsMain.hourToMinute(startHourLatter, startMinuteLatter);
          var summedMinutesEndLatter = UtilsMain.hourToMinute(endHourLatter, endMinuteLatter);

          if(summedMinutesEndFormer > summedMinutesStartLatter && summedMinutesStartFormer < summedMinutesEndLatter) {
            print(json[i].course + "(" + json[i].start.toString() + "-" + json[i].end.toString() + ")" + " is clashed with " + json[j].course + "(" + json[j].start.toString() + "-" + json[j].end.toString() + ")");
            clashOne = json[i];
            clashTwo = json[j];
            clashed = true;
          }
          // else
          //   clashed = false;
        }
        // else
        //   clashed = false;
      }
    }

    // print("[utils_main.dart] clashed: $clashed");
    // print("[utils_main.dart] clashOne: $clashOne");
    // print("[utils_main.dart] clashTwo: $clashTwo");

    if(clashed == true)
      return {clashed, clashOne, clashTwo};
    else
      return {clashed};
    
  }

  static Set setStartDay(detailsList) {
    // Refer lib/darts/set_timetable_column.dart
    List dayColumn = [];
    List dayToCompare = [];

    for (var i=0; i<detailsList.length; i++) {
      print("detailsList[i].campus: ${detailsList[i].campus}");

      var trimmed = detailsList[i].campus.substring(0,1);

      if(trimmed == "D" || trimmed == "K" || trimmed == "J" || trimmed == "T") {
        print("Sunday");
        dayColumn = ['SUN', 'MON', 'TUE', 'WED', 'THU'];
        dayToCompare = ['SUNDAY', 'MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY'];
      } else {
        print ("Monday");
        dayColumn = ['MON', 'TUE', 'WED', 'THU', 'FRI'];
        dayToCompare = ['MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY', 'FRIDAY'];
      }
    }

    return {dayColumn, dayToCompare};
  }
}