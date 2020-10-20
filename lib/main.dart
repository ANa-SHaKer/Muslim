import 'package:flutter_splash/flutter_splash.dart';
import 'package:flutter/material.dart';
import 'package:muslim/kholafa.dart';
import 'package:muslim/widgets.dart';
import 'DeadDoaa.dart';
import 'Takwim.dart';
import 'adaya.dart';
import 'ahades.dart';
import 'azkar.dart';
import 'azkarElmasaa.dart';
import 'azkarElsabah.dart';
import 'compass/compass.dart';
import 'malomat.dart';
import 'prayer/widgets/prayer_time_list.dart';
import 'quran/Index.dart';
import 'sebha.dart';
import 'story.dart';
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
  HomeState createState() => new HomeState();
}

class HomeState extends State<Home> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff392850),
      appBar: AppBar(
        backgroundColor: Color(0xff392850),
        elevation: 10,
        title:  Text(
          "Muslim",
          style:  TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Container(
          color: Color(0xff392850),
          child: ListView(
            children: <Widget>[
              SizedBox(height:100,),
              Container(
                height: 50,
                width: 50,
                padding: EdgeInsets.only(right: 20,left: 20),

                child: FlatButton(

                  onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>
                      splash(KholafaPage(),"اللهم لا تشمت أعدائي بدائي،\n واجعل القرآن العظيم شفائي ودوائي، فأنا العليل وأنت المداوي، \nوأنت ثقتي ورجائي، فإجعل حسن ظني بك شفائي.")));},
                  child: Text("قصص الصحابة",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,),),
                  color: Color(0xff453658),

                ),
              ),
               SizedBox(height: 30,),
              Container(
                height: 50,
                width: 50,
                padding: EdgeInsets.only(right: 20,left: 20),

                child: FlatButton(

                  onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>
                      splash(DeadDoaaPage(),"اللهم ما اعفو عنا واتقينا شر خطايانا واهدنا الي الصلاة المستقيم يارب العالمين")));},
                  child:  Text("ادعية للمتوفيين",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,),),
                  color: Color(0xff453658),

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
                  color: Color(0xff453658),

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
                  child: Text("سبحة الكترونيه ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,),),
                  color: Color(0xff453658),

                ),
              ),

              SizedBox(height: 30,),
              Container(
                height: 50,
                width: 50,
                padding: EdgeInsets.only(right: 20,left: 20),

                child: FlatButton(

                  onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>
                      splash(time(),"أنت ولينا فإغفر لنا وإرحمنا وأنت خير الغافرين.")));},
                  child: Text("التوقيت والتقويم",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,),),
                  color: Color(0xff453658),
                ),
              ),
              SizedBox(height: 30,),
              Container(
                height: 50,
                width: 50,
                padding: EdgeInsets.only(right: 20,left: 20),

                child: FlatButton(

                  onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>
                      splash(PrayerTimeList(),"اللهم رحمتك ومغفرتك يارب العالمين")));},
                  child: Text("مواقيت الصلاه",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,),),
                  color: Color(0xff453658),
                ),
              ),
              SizedBox(height: 30,),
              Container(
                height: 50,
                width: 50,
                padding: EdgeInsets.only(right: 20,left: 20),

                child: FlatButton(

                  onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>
                      splash(Compass(),"اللهم انت العافي فاعفو عنا و انت الغفور فاغفر عن خطايانا")));},
                  child: Text("اتجاه القبله",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,),),
                  color: Color(0xff453658),
                ),
              ),
            ],
          ),
        ),


      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 20,),

          GridDashboard()
        ],
      ),
    );
  }

}
class GridDashboard extends StatelessWidget {
  Items item1 = new Items(
      title: "القران",
      press : Index(),
      splash : "رب أدخلني مدخل صدق وأخرجني مُخرج صدقٍ \n وإجعل لي من لدنك سلطاناً نصير.",
      img: "assets/quran.png");

  Items item2 = new Items(
    title: "احاديث الرسول",
    press : AhadesPage(),
    splash : "رب اشرح لي صدري ويسر لي أمري  \nواحلل عقدة من لساني يفقهوا قولي.",
    img: "assets/ahades.jpg",
  );
  Items item3 = new Items(
    title: "قصص الانبياء",
    press : StoryPage(),
    splash : "اللهم إني أسألك النعيم يوم العيلة، والأمن يوم الخوف، \n وأعوذ بك من شر ما أعطيتنا، وشر ما منعتنا.",
    img: "assets/qss.png",
  );
  Items item4 = new Items(
    title: "ادعية الانبياء",
    press : AdayaPage(),
    splash : "اللهم إني أسألك عيشة نقية، وميتة سويّة، \n ومرداً غير مخزٍ، ولا فاضح.",
    img: "assets/sebha.png",
  );
  Items item5 = new Items(
    title: "ادعيه متفرقه",
    press : AzkarPage(),
    splash : "اللّهم إني أسألك إيماناً لا يرتد، ونعيماً لا ينفذ\n ومرافقة محمد صل الله عليه وسلم في أعلى جنة الخلد.",
    img: "assets/doaa.png",
  );
  Items item6 = new Items(
    title: "تسابيح",
    press : TasabyhPage(),
    splash : "ربِ اغفر لي ولوالدي ولمن دخل بيتي مؤمناً\n وللمؤمنين والمؤمنات ولا تزد الظالمين إلا تباراً.",
    img: "assets/tasabyh.jpg",
  );
  Items item7 = new Items(
    title: "اذكار الصباح",
    img: "assets/zekr.jpg",
    press : AzkarElsabaahPage(),
    splash : "اللهم طهر قلبي من كل خلق لا يرضيك",

  );
  Items item8 = new Items(
    title: "اذكار المساء",
    press : ElmasaPage(),
    img: "assets/zekr.jpg",
    splash : "اللهم يا مقلب القلوب ثبت قلوبنا وقلوب اخواننا علي دينك وطاعتك",
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4, item5, item6,item7,item8];
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return InkWell(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>
                  splash(data.press,data.splash)));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xff453658), borderRadius: BorderRadius.circular(10),),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Material(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Container(
                        height: 90.0,
                        width: 90.0,
                        child: ClipOval(
                          child: Image(image: AssetImage(data.img,),),
                        ),
                      ),
                    ),


                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      data.title,
                      style:  TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),textAlign: TextAlign.center,),

                  ],
                ),
              ),
            );
          }).toList()),
    );
  }


}

class Items {
  String title;
  Widget press;
  String img;
  String splash;
  Items({this.title, this.img,this.press,this.splash});
}

