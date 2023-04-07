extension TimePeriodExt on TimePeriod {
  String get time {
    switch (this) {
      case TimePeriod.evening:
        return "İyi Akşamlar";
      case TimePeriod.noon:
        return "İyi Öğlenler";
      case TimePeriod.morning:
        return "Günaydın";
      default:
        return "İyi Geceler";
    }
  }
}

enum TimePeriod {
  morning,
  noon,
  evening,
  night,
}
