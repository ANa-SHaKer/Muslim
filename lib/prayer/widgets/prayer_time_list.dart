import 'package:flutter/material.dart';
import 'package:muslim/prayer/util/constants.dart';
import 'package:muslim/prayer/util/prayer_time.dart';




class PrayerTimeList extends StatefulWidget {
  @override
  _PrayerTimeListState createState() => _PrayerTimeListState();
}

class _PrayerTimeListState extends State<PrayerTimeList> {

  List<String> _prayerTimes = [];
  List<String> _prayerNames = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getPrayerTimes();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff392850),
        appBar: AppBar(
          title: Text("Muslim",style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
          backgroundColor: Color(0xff453658),
          centerTitle: true,
          elevation: 10,
        ),
      body: _prayerTimes.isEmpty ? circularIndicator() : prayerListWidget()
    );
  }


  Widget circularIndicator(){
    return Center(
      child: CircularProgressIndicator(),
    );
  }


  Widget prayerListWidget(){
    return ListView.builder(
      itemCount: _prayerTimes.length,
      itemBuilder: (context, position) {
        return Padding(
          padding: const EdgeInsets.only(top:10.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 40,),
              Text(
                "${_prayerNames[position]}    :   ${_prayerTimes[position]}",
                style: new TextStyle(fontSize: 20.0,color: Colors.white),
                textAlign: TextAlign.right,
              ),
              Divider(height: 3,indent: 50,color: Colors.white,endIndent: 50,)
            ],
          )
        );
      },
    );
  }


  //build prayer time
  getPrayerTimes() {
    PrayerTime prayers = new PrayerTime();

    prayers.setTimeFormat(prayers.getTime12());
    prayers.setCalcMethod(prayers.getKarachi());
    prayers.setAsrJuristic(prayers.getHanafi());
    prayers.setAdjustHighLats(prayers.getAdjustHighLats());

    List<int> offsets = [0, 0, 0, 0, 0, 0, 0]; // {Fajr,Sunrise,Dhuhr,Asr,Sunset,Maghrib,Isha}
    prayers.tune(offsets);

    var currentTime = DateTime.now();

    setState(() {
      _prayerTimes = prayers.getPrayerTimes(currentTime, Constants.lat, Constants.long, Constants.timeZone);
      _prayerNames = prayers.getTimeNames();
    });
  }

}