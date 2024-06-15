import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:native_device/place/place.dart';

class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super([]);

  void addPlace(String title) {
    final newPlaces = Place(title: title);
    state = [...state, newPlaces];
  }
}

final userPlacesProvider =
    StateNotifierProvider<UserPlacesNotifier, List<Place>>(
  (ref) => UserPlacesNotifier(),
);
