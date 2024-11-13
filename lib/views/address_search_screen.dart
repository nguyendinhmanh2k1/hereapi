import 'package:flutter/material.dart';
import '../models/address.dart';
import '../viewmodels/address_search_viewmodel.dart';
import '../widgets/result_list.dart';

class AddressSearchScreen extends StatefulWidget {
  @override
  _AddressSearchScreenState createState() => _AddressSearchScreenState();
}

class _AddressSearchScreenState extends State<AddressSearchScreen> {
  final AddressSearchViewModel _viewModel = AddressSearchViewModel();

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tìm kiếm địa chỉ'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SearchBar(onChanged: _viewModel.searchAddress),
            StreamBuilder<List<Address>>(
              stream: _viewModel.resultsStream,
              builder: (context, snapshot) {
                // if (snapshot.connectionState == ConnectionState.waiting) {
                //   return CircularProgressIndicator();
                // }
                if (snapshot.hasData) {
                  return ResultList(addresses: snapshot.data!);
                } else {
                  // return Text('No results found');
                  return Text('');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
