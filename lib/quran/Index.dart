import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:muslim/quran/library/Globals.dart' as globals;
import 'package:screen/screen.dart';

import 'entity/Surah.dart';
import 'builder/SurahListBuilder.dart';
import 'builder/SurahViewBuilder.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  /// Used for Bottom Navigation

  /// Get Screen Brightness
  void getScreenBrightness() async {
    globals.brightnessLevel = await Screen.brightness;
  }

  /// Navigation event handler

  void redirectToLastVisitedSurahView() {
    print("redirectTo:${globals.lastViewedPage}");
    if (globals.lastViewedPage != null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) =>
                  SurahViewBuilder(pages: globals.lastViewedPage)),
          (Route<dynamic> route) => false);
    }
  }

  @override
  void initState() {
    /// set saved Brightness level
    Screen.setBrightness(globals.brightnessLevel);
    Screen.keepOn(true);

    super.initState();
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
        body: Container(
          child: Directionality(
            textDirection: TextDirection.rtl,

            /// Use future builder and DefaultAssetBundle to load the local JSON file
            child: new FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString('assets/json/surah.json'),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Surah> surahList = parseJson(snapshot.data.toString());
                    return surahList.isNotEmpty
                        ? new SurahListBuilder(surah: surahList)
                        : new Center(child: new CircularProgressIndicator());
                  } else {
                    return new Center(child: new CircularProgressIndicator());
                  }
                }),
          ),
        ),
      floatingActionButton: Container(
        padding: EdgeInsets.only(left:40),
        alignment: Alignment.bottomLeft,
        child: FloatingActionButton(
          onPressed: (){
            setState(() {
              /// in case Bookmarked page is null (Bookmarked page initialized in splash screen)
              if (globals.bookmarkedPage == null) {
                globals.bookmarkedPage = globals.DEFAULT_BOOKMARKED_PAGE;
              }
            });
            Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) =>
                        SurahViewBuilder(pages: globals.bookmarkedPage - 1)));

            /// Continue reading
          },
          tooltip: 'الانتقال الي العلامة',
          child: Icon(Icons.book),
          backgroundColor: Colors.tealAccent.shade700,
          elevation: 10,
        ),
      ),


    );
  }

  List<Surah> parseJson(String response) {
    if (response == null) {
      return [];
    }
    final parsed =
        json.decode(response.toString()).cast<Map<String, dynamic>>();
    return parsed.map<Surah>((json) => new Surah.fromJson(json)).toList();
  }
}
