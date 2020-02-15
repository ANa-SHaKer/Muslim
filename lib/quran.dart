
import 'dart:async';
import 'dart:io';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

import 'widgets.dart';

void main() => runApp(Quran());

class Quran extends StatefulWidget {
  @override
  _QuranState createState() => _QuranState();
}

class _QuranState extends State<Quran>  with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    )..addListener(() => setState(() {}));

    animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(animationController);

    animationController.forward();
    getFileFromAsset("assets/quran.pdf").then((f) {
      setState(() {
        assetPDFPath = f.path;
        print(assetPDFPath);
      });
    });
  }

  String assetPDFPath = "";


  Future<File> getFileFromAsset(String asset) async {
    try {
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/quran.pdf");

      File assetFile = await file.writeAsBytes(bytes);
      return assetFile;
    } catch (e) {
      throw Exception("Error opening asset file");
    }
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:Colors.black,
      appBar: AppBar(
        title: Text("Muslim",style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
        backgroundColor: Color(0XFF1D1E70),
        centerTitle: true,
      ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/allah.jpg"),alignment: Alignment.center,fit: BoxFit.cover)
          ),
          child: FadeTransition(
            opacity: animation,
            child: Column(
                     mainAxisAlignment: MainAxisAlignment.end,
                     children: <Widget>[
                       Container(
                             height: MediaQuery.of(context).size.height/8,
                             width: MediaQuery.of(context).size.width,
                             decoration: BoxDecoration(
                               color:Color(0XFF1D1E70).withOpacity(0.8),
                               borderRadius: BorderRadius.circular(20),
                             ),
                             child: FlatButton(
                               child: Text("فتح من التطبيق",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 25),textAlign: TextAlign.center),
                               onPressed: () {
                                 if (assetPDFPath != null) {
                                   Navigator.push(
                                       context,
                                       MaterialPageRoute(
                                           builder: (context) =>
                                               PdfViewPage(path: assetPDFPath)));
                                 }
                               },

                       ),
                        ),
                       Padding(
                         padding: const EdgeInsets.all(5),
                         child: Container(
                           height: MediaQuery.of(context).size.height/8,
                           width: MediaQuery.of(context).size.width,
                           decoration: BoxDecoration(
                             color:Color(0XFF1D1E70).withOpacity(0.8),
                             borderRadius: BorderRadius.circular(20),
                           ),
                           child: FlatButton(
                             child: Text("فتح  اونلاين",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 25),textAlign: TextAlign.center),
                             onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>
                                 webview()
                               ));}
                           ),

                         ),
                       ),

                     ],



            ),
          ),
        ),

    );
  }
}
class webview extends StatefulWidget {
  @override
  _webviewState createState() => _webviewState();
}

class _webviewState extends State<webview> {

  final Completer<WebViewController> _controller =
  Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Muslim",style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
        backgroundColor: Color(0XFF1D1E70),
        centerTitle: true,
      ),
      body: WebView(
          initialUrl: "https://equran.me/browse.html",
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          }
      ),
    );
  }
}
