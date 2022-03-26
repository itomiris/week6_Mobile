import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task 6',
      theme: ThemeData.dark().copyWith(
        backgroundColor: Colors.transparent,
        primaryColor: const Color(0xFFF44336),
        scaffoldBackgroundColor: const Color(0xFFF44336),
      ),
      home: Home(),
    );
  }
}

class Days {
  final String day;
  final String degree;
  final IconData icon;

  Days({required this.day, required this.degree, required this.icon});
}

class Home extends StatelessWidget {
  final List<Days> days = [
    Days(day: 'Friday', degree: '6 °F', icon: Icons.wb_sunny),
    Days(day: 'Saturday', degree: '5 °F', icon: Icons.wb_sunny),
    Days(day: 'Sunday', degree: '22 °F', icon: Icons.ac_unit),
    Days(day: 'Monday', degree: '6 °F', icon: Icons.wb_sunny),
  ];

  Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Weather Forecast',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFFF44336),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: const [
                Icon(Icons.search),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter City Name',
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: const [
                Text(
                  'Murmansk Oblast, RU',
                  style: TextStyle(fontSize: 35),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Friday, Mar 20, 2020',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(35.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.wb_sunny,
                  size: 80,
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  children: const [
                    Text(
                      '14 °F',
                      style: TextStyle(fontSize: 60),
                    ),
                    Text(
                      'LIGHT SNOW',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: const [
                    Icon(
                      Icons.ac_unit,
                      size: 30,
                    ),
                    Text(
                      '5',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text('km/hr'),
                  ],
                ),
                Column(
                  children: const [
                    Icon(
                      Icons.ac_unit,
                      size: 30,
                    ),
                    Text(
                      '3',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text('%'),
                  ],
                ),
                Column(
                  children: const [
                    Icon(
                      Icons.ac_unit,
                      size: 30,
                    ),
                    Text(
                      '20',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text('%'),
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(30.0),
            child: Text(
              '7-DAY WEATHER FORECAST',
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(
            height: 140,
            child: ListView.builder(
                physics: const ClampingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemCount: days.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return WeekDaysTile(
                    day: days[index].day,
                    degree: days[index].degree,
                    icon: days[index].icon,
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class WeekDaysTile extends StatelessWidget {
  final String day, degree;
  final IconData icon;
  // ignore: use_key_in_widget_constructors
  const WeekDaysTile(
      {required this.day, required this.degree, required this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 4),
      child: Stack(
        children: [
          Container(
            color: Colors.white.withOpacity(0.4),
            alignment: Alignment.center,
            height: 200,
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  day,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      degree,
                      style: const TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(
                      icon,
                      size: 35,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
