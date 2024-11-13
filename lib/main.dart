import 'package:flutter/material.dart';
import 'views/address_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'models/address.dart';

void main() {
  runApp(AddressSearchApp());
}

class AddressSearchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Address Search',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('vi', 'VN'), // Tiếng Việt
      ],
      home: AddressSearchScreen(),
    );
  }
}

