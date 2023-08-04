import 'package:flutter/material.dart';
import 'package:grid/daily_datamodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static List images = [
    'images/calendar.png',
    'images/shopping-bag.png',
    'images/location.png',
    'images/groups.png',
    'images/checklist.png',
    'images/settings.png'
  ];
  static List text1 = [
    'Calendar',
    'Groceries',
    'Location',
    'Activity',
    'To do',
    'Settings'
  ];
  static List text2 = [
    'March,Wednesday',
    'Orange,Apple',
    'Lucy Mao going to Office',
    'Rose favirited your Post',
    'Homework, Design',
    ''
  ];
  static List text3 = ['3 items', '4 items', '', '', '4 items', '2 items'];

  final List<DailyDataModel> daily = List.generate(
      images.length,
      (index) => DailyDataModel('${images[index]}', '${text1[index]}',
          '${text2[index]}', '${text3[index]}'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple,
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80.0,left: 20),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('My Family',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 25),),
Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Image.asset('images/notification.png',
                    width: 30,
                    height: 30),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0,top: 5),
              child: Text('Home',style: TextStyle(color: Colors.white),),
            ),
            GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                ),
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(daily[index].images))),
                          ),
                          Text(daily[index].text1,style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                          Text(daily[index].text2,style: TextStyle(color: Colors.grey),),
                          Text(daily[index].text3,style: TextStyle(color: Colors.white),),
                        ],
                      ),
                    ),
                  );
                })
          ],
        ));
  }
}
