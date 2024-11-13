//*********************************
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geolocator/geolocator.dart';
import '../models/address.dart';

class ResultList extends StatelessWidget {
  final List<Address> addresses;

  const ResultList({required this.addresses});

  // Hàm lấy vị trí hiện tại của người dùng
  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Kiểm tra dịch vụ vị trí
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw 'Location services are disabled.';
    }

    // Kiểm tra quyền truy cập vị trí
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse && permission != LocationPermission.always) {
        throw 'Location permissions are denied';
      }
    }

    // Lấy vị trí hiện tại
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  // Hàm mở Google Maps với chế độ chỉ đường
  Future<void> _openMap(String addressTitle) async {
    // Lấy vị trí hiện tại của người dùng
    Position position = await _getCurrentLocation();

    // Tạo URL để chỉ đường từ vị trí hiện tại đến đích
    final url = Uri.parse('https://www.google.com/maps/dir/?api=1&origin=${position.latitude},${position.longitude}&destination=$addressTitle');

    // Kiểm tra và mở Google Maps
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: addresses.length,
        itemBuilder: (context, index) {
          final address = addresses[index];
          return ListTile(
            title: Text(address.title), // Hiển thị tên địa chỉ
            onTap: () {
              _openMap(address.title); // Mở Google Maps với chế độ chỉ đường
            },
          );
        },
      ),
    );
  }
}
//*********************************