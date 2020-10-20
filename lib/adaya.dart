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
    return Flex(
      direction: Axis.vertical,
      children: <Widget>[
        Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child:Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: prodcolor
                ),
                child: Stack(
                  children: <Widget>[
                    Opacity(
                      opacity: 0.3,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(image: AssetImage("assets/adaya.jpg"),fit: BoxFit.cover,),
                        ),
                      ),
                    ),

                    Container(
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.only(top:50),
                      child: Text(prodtitle,
                        style: TextStyle(color: Colors.blueGrey[100],fontWeight: FontWeight.w900,fontSize: 20),
                        textAlign: TextAlign.center,),
                    ),

                    Container(
                        padding: EdgeInsets.only(bottom:10),
                        alignment: Alignment.bottomCenter,
                        child: FlatButton(child: CircleAvatar(
                          child: Icon(Icons.arrow_downward),backgroundColor: Colors.grey[700],),
                          onPressed: (){
                            showDialog(context: context, builder: (context){
                              return AlertDialog(
                                backgroundColor: Color(0xff392850),
                                elevation: 10,
                                titlePadding: EdgeInsets.all(20),
                                title: Center(
                                  child: ListTile(
                                    subtitle: Text(prodsubtitle,
                                      style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.left,),
                                  ),
                                ),

                              );
                            });
                          },
                        )),
                  ],
                ),
              ),

            )),
      ],
    );
  }
}
class AdayaPage extends StatelessWidget {
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
      body:  Adaya(),

    );
  }
}

