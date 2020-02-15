import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';



void main() => runApp(Masbha());

class Masbha extends StatefulWidget {
  @override
  _MasbhaState createState() => _MasbhaState();
}

class _MasbhaState extends State<Masbha>  {
  int num=0;
  String name= "";



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:Color(0XFF1D1E50),
      appBar: AppBar(
        title: Text("Muslim",style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
        backgroundColor: Color(0XFF1D1E70),
        centerTitle: true,
      ),
      body:  ListView(
          children: <Widget>[
      Container(
      margin: EdgeInsets.only(left: 30),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width/1.2,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/masbha.png"),alignment: Alignment.centerRight,fit: BoxFit.fitWidth,)
      ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top:273.0,right: 20,left: 20),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color:  Colors.indigo[800],
                    borderRadius: BorderRadius.circular(75)
                ),
                height: MediaQuery.of(context).size.height/6,
                child:  Text(num.toString(),style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.w900),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 176,top: 5),
              child: FlatButton(onPressed: (){setState(() {
                num=0;
                Vibration.vibrate();

              });}, child: Icon(Icons.refresh,color: Colors.white,)),
            ),
            FlatButton(onPressed: (){setState(() {
              num++;
              Vibration.vibrate(duration: 70);
            });}, child: Container( height: MediaQuery.of(context).size.height/12,
              width: MediaQuery.of(context).size.width/4,

              child: Text("Click \n here",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w900),),alignment: Alignment.topCenter,margin: EdgeInsets.only(top: 10)
              ,),),
            Padding(
              padding: const EdgeInsets.only(top:95.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),

                  color: Colors.indigo[800],
                ),
                height: 100,
                width: 200,

                child: FlatButton(onPressed: () {
                  showDialog(context: context,
                      builder: (_) =>AlertDialog(
                        title: Text("تسابيح",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w900),textAlign: TextAlign.center,),
                        backgroundColor:  Colors.indigo[800],
                        elevation: 0.0,
                        actions: <Widget>[
                          FlatButton(onPressed: (){setState(() {
                            name = "سبحان الله";
                          });}, child:Text("سبحان الله",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w900),textAlign: TextAlign.end,),
                            padding: EdgeInsets.only(right:90 ),),
                          FlatButton(onPressed: (){setState(() {
                            name = "الحمدلله ";
                          });}, child:Text("الحمدلله ",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w900),textAlign: TextAlign.end,),
                            padding: EdgeInsets.only(right:90 ),),
                          FlatButton(onPressed: (){setState(() {
                            name = "الله اكبر";
                          });}, child:Text("الله اكبر",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w900),textAlign: TextAlign.end,),
                            padding: EdgeInsets.only(right:90 ),),
                          FlatButton(onPressed: (){setState(() {
                            name = "لا اله الا الله";
                          });}, child:Text("لا اله الا الله",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w900),textAlign: TextAlign.end,),
                            padding: EdgeInsets.only(right:90 ),),
                          FlatButton(onPressed: (){setState(() {
                            name = " لا اله الا الله \n  محمد رسول الله";
                          });}, child:Text("لا اله الا الله \n محمد رسول الله",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w900),textAlign: TextAlign.end,),
                            padding: EdgeInsets.only(right:90 ),),
                        ],

                      )
                  );
                }, child: Text(name == ""? "تسابيح":name,style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w900),textAlign: TextAlign.right,),),
              ),
            ),
          ],
        ),
    ),


          ],
        ),


    );
  }
}
