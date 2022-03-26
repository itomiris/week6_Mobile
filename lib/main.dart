// ignore_for_file: deprecated_member_use

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class Bus {
  String title;
  String from;
  String to;
  DateTime fromDate;
  DateTime toDate;
  String seatsNo;
  String carNum;
  String img;

  Bus({
    required this.title,
    required this.from,
    required this.to,
    required this.fromDate,
    required this.toDate,
    required this.seatsNo,
    required this.carNum,
    required this.img,
  });
}

class _MyAppState extends State<MyApp> {
  List<Bus> busList = [
    Bus(
        title: 'YUTONG',
        img: 'bus1.jpg',
        from: 'Асыката',
        to: 'Алматы',
        fromDate: DateTime.parse("2020-02-06 18:39:00"),
        toDate: DateTime.parse("2020-02-07 06:10:00"),
        seatsNo: '32 мест',
        carNum: 'KZ 888 \n KN02'),
    Bus(
      title: 'End2End Test',
      img: 'bus2.jpg',
      from: 'Город X',
      to: 'Сарыагаш',
      fromDate: DateTime.parse("2020-02-06 19:30:00"),
      toDate: DateTime.parse("2020-02-07 18:36:00"),
      seatsNo: '53 мест',
      carNum: 'KZ 123 ABC',
    ),
    Bus(
      title: 'YUTONG',
      img: 'bus3.jpg',
      from: 'Сарыагаш',
      to: 'Алматы',
      fromDate: DateTime.parse("2020-02-06 18:39:00"),
      toDate: DateTime.parse("2020-02-07 06:10:00"),
      seatsNo: '32 мест',
      carNum: 'KZ 888 \n KN02',
    ),
  ];

  Widget _textTemp(text, [fontSize = 18.0, weight = FontWeight.normal]) {
    return Text(text,
        style: GoogleFonts.roboto(
          textStyle: Theme.of(context).textTheme.headline4,
          fontSize: fontSize,
          fontWeight: weight,
          fontStyle: FontStyle.normal,
          color: Colors.black,
        ));
  }

  Widget cardTemplate(bus) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Column(children: <Widget>[
          Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(children: <Widget>[
                      ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.asset(
                            'assets/${bus.img}',
                            fit: BoxFit.fitHeight,
                            width: 135,
                            height: 152,
                          )),
                      const SizedBox(height: 7),
                      _textTemp(bus.title, 20.0),
                      const SizedBox(height: 4),
                      _textTemp(bus.carNum, 15.0),
                      const SizedBox(height: 4),
                      _textTemp(bus.seatsNo, 15.0)
                    ]),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          _textTemp(bus.from + ' -', 19.0),
                          _textTemp(bus.to, 19.0),
                          const SizedBox(height: 15),
                          _textTemp('Отправление', 18.0, FontWeight.bold),
                          const SizedBox(height: 4),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _textTemp(
                                    'Дата  -  ' +
                                        DateFormat('dd.MM.yyyy E')
                                            .format(bus.fromDate),
                                    16.0),
                                const SizedBox(height: 5),
                                _textTemp(
                                    'Время  -  ' +
                                        DateFormat('HH:mm')
                                            .format(bus.fromDate),
                                    16.0)
                              ]),
                          const SizedBox(height: 14),
                          _textTemp('Прибытие', 18.0, FontWeight.bold),
                          const SizedBox(height: 5),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                _textTemp(
                                    'Дата  -  ' +
                                        DateFormat('dd.MM.yyyy E')
                                            .format(bus.toDate),
                                    16.0),
                                const SizedBox(height: 5),
                                _textTemp(
                                    'Время  -  ' +
                                        DateFormat('HH:mm').format(bus.toDate),
                                    16.0)
                              ])
                        ])
                  ])),
          FlatButton(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              onPressed: () {
                Widget cancelButton = FlatButton(
                    child: const Text("НЕТ",
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    });
                Widget continueButton = FlatButton(
                    child: const Text("ДА",
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0)),
                    onPressed: () => setState(() {
                          busList.remove(bus);
                          Navigator.of(context).pop();
                        }));

                AlertDialog alert = AlertDialog(
                    content: const Text("Вы хотите удалить этот рейс?",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 21.0)),
                    actions: [cancelButton, continueButton]);
                showDialog(context: context, builder: (context) => alert);
              },
              color: Colors.white,
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1.5, color: Colors.green),
                      borderRadius: BorderRadius.circular(10)),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: _textTemp('Удалить рейс')))
        ]));
  }

  Widget _listTile(text, icon) {
    return Padding(
      padding: const EdgeInsets.only(top: 9.0),
      child: ListTile(
          leading: IconTheme(data: const IconThemeData(size: 40), child: icon),
          title: Text(text,
              style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 24,
                  fontWeight: FontWeight.w600)),
          onTap: () => {}),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
            toolbarHeight: 60.0,
            title: const Align(
                alignment: Alignment.bottomLeft,
                child: Text('Расписание',
                    style: TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 25.0))),
            centerTitle: true,
            backgroundColor: Colors.green),
        body: ListView(
          children: busList.map((bus) => cardTemplate(bus)).toList(),
        ),
        floatingActionButton: FlatButton(
            onPressed: () {},
            child: Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20)),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                child: const Text('Добавить рейс',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 19.0,
                        fontWeight: FontWeight.w400)))),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        drawer: Drawer(
            child: ListView(padding: EdgeInsets.zero, children: <Widget>[
          DrawerHeader(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Padding(
                        padding: EdgeInsets.fromLTRB(50, 10, 0, 0),
                        child: Text('Test Company',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 28,
                                fontWeight: FontWeight.w500))),
                    Padding(
                        padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                        child: Text('Aty Zhoni',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 36,
                                fontWeight: FontWeight.w800)))
                  ]),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.black87, width: 2)))),
          _listTile('Продажа билетов', const Icon(Icons.credit_card)),
          _listTile('Список администраторов', const Icon(Icons.people)),
          _listTile('Автобусы', const Icon(Icons.departure_board)),
          _listTile('Статистика', const Icon(Icons.equalizer)),
          _listTile('Пассажиры', const Icon(Icons.airline_seat_recline_extra)),
          _listTile('Расписание', const Icon(Icons.date_range)),
          _listTile('История', const Icon(Icons.library_books)),
          _listTile('Настройки', const Icon(Icons.settings)),
        ])));
  }
}
