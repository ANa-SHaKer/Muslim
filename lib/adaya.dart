import 'package:flutter/material.dart';

import 'lists.dart';


class Adaya extends StatefulWidget {
  Adaya({Key key}) : super(key: key);

  _AdayaState createState() => _AdayaState();
}

class _AdayaState extends State<Adaya> {

  @override
  Widget build(BuildContext context) {
    return GridView.builder(

      itemCount: AdayaList.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1, // number of button in row
        childAspectRatio: 2,
      ),

      itemBuilder: (BuildContext context, int index){
        return SingleAdayaList(
          prodtitle: AdayaList[index]['title'],
          prodsubtitle: AdayaList[index]['subtitle'],
          prodcolor: AdayaList[index]['color'],
          
        );
      },
    );
  }
}

class SingleAdayaList extends StatelessWidget {
  final prodtitle;
  final prodcolor;
  final prodsubtitle;




  SingleAdayaList({
    this.prodtitle,
    this.prodcolor,
    this.prodsubtitle,
 


  });



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(top :2.0,left: 10,bottom: 5,right: 5),
      child:  InkWell(
        onTap: () {},
        child: Material(
          color: prodcolor,
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            padding: EdgeInsets.only(left: 10,right: 5),

            child: ListTile(
              
                  title: Text(
                      prodtitle,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontFamily: "Quando",
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,

                    ),
                  subtitle:   Text(
                    prodsubtitle,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontFamily: "Quando",
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    softWrap: true,


                  ),
                ),





          ),
        ),
      ),
    );
  }
}
class AdayaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF1D1E70),
      appBar: AppBar(
        title: Text("Muslim",style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
        backgroundColor: Color(0XFF1D1E70),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/god.png"),alignment: Alignment.center)
        ),
        child: Adaya(),
      ),
    );
  }
}

