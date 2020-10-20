import 'package:flutter/material.dart';

import 'lists.dart';


class Story extends StatefulWidget {
  Story({Key key}) : super(key: key);

  _StoryState createState() => _StoryState();
}

class _StoryState extends State<Story> {

  @override
  Widget build(BuildContext context) {
    return GridView.builder(

      itemCount: StoryList.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // number of button in row
      ),

      itemBuilder: (BuildContext context, int index){
        return SingleStoryList(
          prodtitle: StoryList[index]['title'],
          prodnabi: StoryList[index]['nabi'],
          prodcolor: StoryList[index]['color'],
          prodpart1: StoryList[index]['part1'],
          prodpart2: StoryList[index]['part2'],
          prodpart3: StoryList[index]['part3'],
          prodpart4: StoryList[index]['part4'],

        );
      },
    );
  }
}

class SingleStoryList extends StatelessWidget {
  final prodtitle;
  final prodcolor;
  final prodnabi;
  final prodpart1;
  final prodpart2;
  final prodpart3;
  final prodpart4;



  SingleStoryList({
    this.prodtitle,
    this.prodcolor,
    this.prodnabi,
    this.prodpart1,
    this.prodpart2,
    this.prodpart3,
    this.prodpart4,


  });


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(top :2.0,left: 10,bottom: 5,right: 5),
      child:  InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Details(
            pageTitle: prodtitle,
            pageColor: prodcolor,
            pagenabi: prodnabi,
            pagepart1: prodpart1,
            pagepart2: prodpart2,
            pagepart3: prodpart3,
            pagepart4: prodpart4,

          )));
        },
        child: Container(
          padding: EdgeInsets.all(10),
          height: 190,
          width: 190,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Color(0xff453658),

          ),
          child: Card(
            color: Color(0xff453658),
            elevation: 10,
            child: ListTile(
              title:  Center(
                child: Text(
                  prodnabi,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontFamily: "Quando",
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.center,

                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class StoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0xff392850),
      appBar: AppBar(
        title: Text("Muslim",style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
        backgroundColor: Color(0xff453658),
        centerTitle: true,
        elevation: 10,
      ),
      body: Story(),
    );
  }
}

class Details extends StatefulWidget {

  final pageTitle;
  final pageColor;
  final pagenabi;
  final pagepart1;
  final pagepart2;
  final pagepart3;
  final pagepart4;


  Details({this.pageTitle, this.pageColor, this.pagenabi,this.pagepart1,this.pagepart2,this.pagepart3,this.pagepart4});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff392850),

      appBar: AppBar(
        title: Text(widget.pagenabi,style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
        backgroundColor: Color(0xff453658),
        centerTitle: true,
        elevation: 10,
      ),
      body: ListView(
        children: <Widget>[
          Qss(widget.pagepart1,widget.pagepart1 == "" ?Colors.transparent: Color(0xff453658),),
          Qss(widget.pagepart2,widget.pagepart2 == "" ?Colors.transparent:  Color(0xff453658),),
          Qss(widget.pagepart3,widget.pagepart3 == "" ?Colors.transparent: Color(0xff453658)),
          Qss(widget.pagepart4,widget.pagepart4 == "" ?Colors.transparent: Color(0xff453658)),
        ],

      ),
    );
  }
}


Widget Qss( String title,Color color,){
  return  Padding(
    padding: const EdgeInsets.only(top:8.0,left: 5),
    child: Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20)
      ),

      child:  ListTile(title: Text(title,style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold,),textAlign: TextAlign.right,)),


    ),
  );
}
