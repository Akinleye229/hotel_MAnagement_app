import '.././data/network/failure_error_handler.dart';
import '.././data/repository/hotel_repository.dart';
import '.././data/repository/remote_hotel_repository.dart';
import '.././model/hotel_model.dart';
import 'package:flutter/material.dart';

class HotelBloc extends ChangeNotifier {
  HotelRepository repository = RemoteHotelRepository();

  /// Private list of [HotelModel]
  List<HotelModel> _hotels;

  /// Public getter for hotels
  List<HotelModel> get hotels => _hotels;

  /// [Failure] instance
  Failure _failure;
  Failure get failure => _failure;

  void retrieveHotels() async {
    try {
      _hotels = await repository.fetchHotels();
    } on Failure catch (e) {
      _failure = e;
    }
    notifyListeners();
  }
}
