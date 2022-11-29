import 'package:mobile_capstone_fpt/models/response/time_slot.res.dart';

abstract class TimeSlotRepo {
  Future<TimeSlotRes> getTimeSlot(String url, String token);
}
