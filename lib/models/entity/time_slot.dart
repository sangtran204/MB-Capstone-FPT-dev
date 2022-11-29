class TimeSlot {
  TimeSlot({
    required this.id,
    required this.startTime,
    required this.endTime,
    required this.flag,
  });

  String id;
  String startTime;
  String endTime;
  int flag;

  factory TimeSlot.fromJson(Map<String, dynamic> json) => TimeSlot(
        id: json["id"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        flag: json["flag"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "startTime": startTime,
        "endTime": endTime,
        "flag": flag,
      };
}
