import 'package:flutter_splash/flutter_splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:muslim/kholafa.dart';
import 'package:muslim/widgets.dart';

import 'adaya.dart';
import 'ahades.dart';
import 'azkar.dart';
import 'malomat.dart';
import 'quran.dart';
import 'sebha.dart';
import 'story.dart';
import 'tafser.dart';
import 'tasabyh.dart';


void main() => runApp(MaterialApp(
  title : "Muslim",
  debugShowCheckedModeBanner: false,
  home:splassh(),

));


class splassh extends StatefulWidget {
  @override
  _splasshState createState() => _splasshState();
}

class _splasshState extends State<splassh> {
  @override
  Widget build(BuildContext context) {
    return  Splash(
      seconds: 3,
      navigateAfterSeconds:Home() ,
      image: Image.asset("assets/logo.jpg"),
      photoSize: 200,
      loaderColor: Colors.black,
      loadingText: Text("Developed by \n Mahmoud Shaker",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
    );
  }
}




class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>   {
  String pdf;




  Widget customcard(String langname, String image,Function press){
    return  Padding(
        padding: const EdgeInsets.all(7),
        child:  InkWell(
            onTap: press,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0XFF1D1E70).withOpacity(0.5),
                borderRadius: BorderRadius.circular(20.0),
              ),
              padding: EdgeInsets.all(10),
              height: 190,
              width: 190,
              child: Column(
                children: <Widget>[
                  Material(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Container(
                      height: 110.0,
                      width: 110.0,
                      child: ClipOval(
                        child: Image(image: AssetImage(image,),),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top :10.0),
                    child: Center(
                      child: Text(
                        langname,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontFamily: "Quando",
                          fontWeight: FontWeight.w900,
                        ),

                      ),

                    ),
                  ),

                ],
              ),
            ),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown, DeviceOrientation.portraitUp
    ]);
    return Scaffold(
      backgroundColor:Color(0XFF1D1E40),
      appBar: AppBar(
        title: Text("Muslim",style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
        backgroundColor: Color(0XFF1D1E70),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/god.png"),alignment: Alignment.bottomCenter),

              color: Color(0XFF1D1E70),
          ),
          child: ListView(
            children: <Widget>[
              SizedBox(height: 50,),
              Container(
                height: 50,
                width: 50,
                padding: EdgeInsets.only(right: 20,left: 20),

                child: FlatButton(

                  onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>
                      splash(KholafaPage(),"اللهم لا تشمت أعدائي بدائي،\n واجعل القرآن العظيم شفائي ودوائي، فأنا العليل وأنت المداوي، \nوأنت ثقتي ورجائي، فإجعل حسن ظني بك شفائي.")));},
                  child: Text("قصص الخلفاء",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,),),
                  color: Colors.indigo.shade800,
                ),
              ),
              SizedBox(height:30,),
              Container(
                height: 50,
                width: 50,
                padding: EdgeInsets.only(right: 20,left: 20),

                child: FlatButton(

                  onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>
                      splash(MalomatPage(),"اللهم إني أسألك النعيم يوم العيلة، والأمن يوم الخوف، \n وأعوذ بك من شر ما أعطيتنا، وشر ما منعتنا.")));},
                  child: Text("معلومات عامه",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,),),
                  color: Colors.indigo.shade800,
                ),
              ),
              SizedBox(height: 30,),
              Container(
                height: 50,
                width: 50,
                padding: EdgeInsets.only(right: 20,left: 20),

                child: FlatButton(

                  onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>
                      splash(Masbha(),"اللهمَّ إنَّي أعوذُ بك من شرِّ سمْعي، ومن شرِّ بصري، ومن شرِّ لساني، ومن شرِّ قلْبي، ومن شرِّ منيَّتي")));},
                  child: Text("مسبحة الكترونيه",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,),),
                  color: Colors.indigo.shade800,
                ),
              ),
              SizedBox(height: 30,),
              Container(
                height: 50,
                width: 50,
                padding: EdgeInsets.only(right: 20,left: 20),

                child: FlatButton(

                  onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>
                      splash(Tafser(),"أنت ولينا فإغفر لنا وإرحمنا وأنت خير الغافرين.")));},
                  child: Text("تفسير الاحلام",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,),),
                  color: Colors.indigo.shade800,
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color:Color(0XFF1D1E40),

                image: DecorationImage(image: AssetImage("assets/mosque.png"),alignment: Alignment.bottomCenter)
            ),

            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,

            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    customcard("القران",  "assets/quran.png",(){Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>
                        splash(Quran(),"رب أدخلني مدخل صدق وأخرجني مُخرج صدقٍ \n وإجعل لي من لدنك سلطاناً نصير.")));},),
                    customcard("احاديث الرسول", "assets/ahades.jpg", (){Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>
                        splash(AhadesPage(),"رب اشرح لي صدري ويسر لي أمري  \nواحلل عقدة من لساني يفقهوا قولي.")));},),

                  ],
                ),
                Row(
                  children: <Widget>[
                    customcard("قصص الانبياء","assets/qss.png",(){Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>
                        splash(StoryPage(),"اللهم إني أسألك النعيم يوم العيلة، والأمن يوم الخوف، \n وأعوذ بك من شر ما أعطيتنا، وشر ما منعتنا.")));},),
                    customcard("ادعية الانبياء","assets/adaya.jpg",(){Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>
                        splash(AdayaPage(),"اللهم إني أسألك عيشة نقية، وميتة سويّة، \n ومرداً غير مخزٍ، ولا فاضح.")));},),
                  ],
                ),
                Row(
                  children: <Widget>[
                    customcard("اذكار", "assets/azkar.png",(){Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>
                        splash(AzkarPage(),"ربِ اغفر لي ولوالدي ولمن دخل بيتي مؤمناً\n وللمؤمنين والمؤمنات ولا تزد الظالمين إلا تباراً.")));},),

                    customcard("تسابيح","assets/tasabyh.jpg",(){Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>
                        splash(TasabyhPage(),"اللّهم إني أسألك إيماناً لا يرتد، ونعيماً لا ينفذ\n ومرافقة محمد صل الله عليه وسلم في أعلى جنة الخلد.")));},),

                  ],
                ),






              ],
            ),
          ),
        ],
      )
        
      
    );
  }
}
