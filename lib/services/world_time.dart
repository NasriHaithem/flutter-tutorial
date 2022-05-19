import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location; // location name for UI
  String flag; // url to an asset flag icon
  String url; // location url for api endpoint
  late String time; // the time in that location
  late bool isDayTime;

  WorldTime({ required this.location, required this.flag, required this.url });

  Future<void> getTime() async {
    // make the request
    try{
      // make the request
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      // get properties from json
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      // create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // set the time property
      time = DateFormat.jm().format(now);
      isDayTime = now.hour > 6 && now.hour <20;
    }
    catch (e) {
      print(e);
      time = 'could not get time';
    }
  }

}