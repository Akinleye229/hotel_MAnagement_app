import 'dart:async';

import '../../model/hotel_model.dart';

abstract class HotelRepository {
  Future<List<HotelModel>> fetchHotels();
}
