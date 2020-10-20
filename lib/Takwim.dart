import 'package:flutter/material.dart';
import 'package:hijri/umm_alqura_calendar.dart';
import 'package:hijri_picker/hijri_picker.dart';
class time extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return timeState();
  }
}

class timeState extends State<time> with SingleTickerProviderStateMixin{
  ummAlquraCalendar selectedDate = new ummAlquraCalendar.now();

  Animation animation;
  AnimationController animationController;

  timeState();

  _currenttime(){
    return "${DateTime.now().hour} : ${DateTime.now().minute}";
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this,duration: Duration(seconds: 1));
    animationController.addListener((){

      if(animationController.isCompleted){
        animationController.reverse();
      } else if(animationController.isDismissed){
        animationController.forward();
      }
      setState(() {

      });
    });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {

    animation = CurvedAnimation(parent: animationController, curve: Curves.easeInOut);
    animation = Tween(begin: -0.5,end: 0.5).animate(animation);

    // TODO: implement build
    return Scaffold(

      body: MediaQuery(
        data: MediaQueryData(),
        child: Container(
          color: Color(0xff392850),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Material(
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  elevation: 10.0,
                  color: Color(0xff453658),
                  child: Container(
                    width: 320,
                    height: 320,
                    child: Center(
                      child: Text(_currenttime(),style: TextStyle(
                          fontSize: 60.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),),
                    ),
                  ),
                ),
                Transform(
                  alignment: FractionalOffset(0.5,0.1),
                  transform: Matrix4.rotationZ(animation.value),
                  child: Container(
                    child: Image.asset('assets/pandulum.png',width: 100,height: 250,),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Text(
                      'التقويم الهجري',
                      style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Divider(color: Colors.grey,),
                    new Text(
                      '${selectedDate.toString()}',
                      style: TextStyle(color: Colors.white,fontSize: 27,),
                    ),
                    SizedBox(height: 5,),
                    new Text(
                      '${selectedDate.fullDate()}',
                      style: TextStyle(color: Colors.white,fontSize: 27,),
                    ),
                    SizedBox(height: 5,),
                    new Text(
                      '${selectedDate.toString()}',
                      style: TextStyle(color: Colors.white,fontSize: 27,),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<Null> _selectDate(BuildContext context) async {
    final ummAlquraCalendar picked = await showHijriDatePicker(
      context: context,
      initialDate: selectedDate,
      lastDate: new ummAlquraCalendar()
        ..hYear = 1442
        ..hMonth = 9
        ..hDay = 25,
      firstDate: new ummAlquraCalendar()
        ..hYear = 1438
        ..hMonth = 12
        ..hDay = 25,
      initialDatePickerMode: DatePickerMode.day,
    );
    print(picked);
    if (picked != null) setState(() {
      selectedDate = picked;
    });
  }
}