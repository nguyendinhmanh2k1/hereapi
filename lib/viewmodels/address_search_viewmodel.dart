import 'dart:async';
import '../api/here_api.dart';
import '../models/address.dart';

class AddressSearchViewModel {
  final StreamController<List<Address>> _resultsController = StreamController<List<Address>>();
  Stream<List<Address>> get resultsStream => _resultsController.stream;
  Timer? _debounce;

  void searchAddress(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(seconds: 1), () async {
      final results = await HereApi.searchAddress(query);
      _resultsController.add(results);
    });
  }

  void dispose() {
    _resultsController.close();
    _debounce?.cancel();
  }
}
