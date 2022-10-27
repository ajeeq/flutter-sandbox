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
    var totalMinute = int.parse(hour)*60 + int.parse(minute);
    return totalMinute;
  }
}