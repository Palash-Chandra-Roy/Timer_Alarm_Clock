import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timer Alarm Clock',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage()
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController hourController = TextEditingController();
  TextEditingController minuteController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer Alarm Clock'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height:40 ,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11.0),
                      color: Colors.blue,
                      shape: BoxShape.rectangle,
                    ),
                    child: Center(
                      child: TextField(
                        controller: hourController,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Container(
                    height:40 ,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11.0),
                      color: Colors.blue,
                      shape: BoxShape.rectangle,
                    ),
                    child: Center(
                      child: TextField(
                        controller: minuteController,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.all(25),
                child: TextButton(
                  child: Text('Create alarm',
                  style: TextStyle(fontSize: 24.0),
                  ),
                  onPressed: (){
                    int hour;
                    int minutes;
                    hour=int.parse(hourController.text);
                    minutes=int.parse(minuteController.text);
                    FlutterAlarmClock.createAlarm(hour, minutes);
                  },
                ),
              ),
              ElevatedButton(onPressed: (){
                FlutterAlarmClock.showAlarms();
              },
                  child:Text(
                    'Show Alarms',
                    style: TextStyle(fontSize: 24.0),
                  ) ,
              ),
              Container(
                margin: EdgeInsets.all(25),
                child: TextButton(
                  child: Text(
                    'Create timer',
                    style: TextStyle(fontSize: 24),
                  ),
                  onPressed: (){
                    int minutes;
                    minutes =int.parse(minuteController.text);
                    FlutterAlarmClock.createTimer(minutes);
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AboutDialog(
                            children: [
                              Center(
                                child: Text('Timer is set',
                                style: TextStyle(
                                  fontSize: 24,fontWeight: FontWeight.bold,
                                ),),
                              ),
                            ],
                          );
                        }
                        );
                  },
                ),
              ),
              ElevatedButton(
                  onPressed: (){
                    FlutterAlarmClock.showTimers();
                  },
                  child: Text(
                    'Show Timers',
                    style: TextStyle(fontSize: 20),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}


