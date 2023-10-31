import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class PlaceScreen extends StatefulWidget {
  const PlaceScreen({super.key});

  @override
  State<PlaceScreen> createState() => _PlaceScreen();
}

class _PlaceScreen extends State<PlaceScreen> {

  final Completer<GoogleMapController> _controller = Completer();
  final LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 10,
  );
  LatLng _myLoc = const LatLng(0, 0);
  String lat = '';
  String lon = '';
  var addrData;
  final List<Marker> _markers = [];

  //  위도, 경도 계속 구하기
  void getCurrentLocation() async {
    await Permission.location.request().then((status) {
      if (status == PermissionStatus.granted) {
        //  거리가 10미터 이상 변해야 리스너에 위치가 전달된다.
        Geolocator.getPositionStream(locationSettings: locationSettings)
          .listen((Position position) => newPosition(position));
      }
    });
  }

  void newPosition(Position position) async {
    if(position.accuracy > 25) return;

    lat = '${position.latitude}';
    lon = '${position.longitude}';
    _myLoc = LatLng(position.latitude, position.longitude);

    final GoogleMapController controller = await _controller.future;
    //  값은 변해 있지만, 애니메이션은 별도의 동작을 해줘야 한다.
    controller.moveCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target:  _myLoc, zoom: 17)));

    //  마커의 위치도 새로운 위치로 옮긴다.
    markerAdd();
    var kakaoGeoUrl = Uri.parse('https://dapi.kakao.com/v2/local/geo/coord2address.json?x=37.5520747&y=126.9183822&input_coord=WGS84');
    var kakaoGeo = await http.get(kakaoGeoUrl, headers: {"Authorization": "KakaoAK cb3800a39698cc0e125159adfd6cd1e6"});
    //jason data
    String addr = kakaoGeo.body;
    addrData = jsonDecode(addr);
    print(addrData);
  }

  late BitmapDescriptor customMarker;
  Future<void> setCustomMarker() async {
    customMarker = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(48, 48)),
      'assets/images/marker3.png');
  }

  @override
  void initState() {
    super.initState();

    setCustomMarker().then((value) {
      getCurrentLocation();
      
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 200,
            // width: 200,
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: const CameraPosition(
                target: LatLng(0, 0),
                zoom: 17.0,
              ),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              markers: Set.from(_markers),
            ),
          ),
          Text("$lat $lon"),
          Text("$addrData"),
        ],
      ),
    );
  }
  
  void markerAdd() {
    final marker = Marker(
      markerId: const MarkerId('marker'),
      position: _myLoc,
      icon: customMarker,
      );

      setState(() {
        _markers.clear();
        _markers.add(marker);
      });
    }

}

