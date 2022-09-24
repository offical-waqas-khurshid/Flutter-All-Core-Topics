import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

extension DateToString on DateTime {
  String toDateString() {
    return '${day.toString()}:${month.toString()}:${year.toString()}';
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

/*
 *  SizedBox(
                    height: 100,
                    width: 100,
                    child: Material(
                      color: Colors.blue,
                      elevation: 20,
                      shadowColor: Colors.blueAccent,
                      child: Column(
                        children: [
                          const Text('Do you want to delete this file'),
                          ButtonBar(children: [
                            ElevatedButton(
                                onPressed: () {
                                  print('Deleted');
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Yes')),
                            ElevatedButton(
                                onPressed: () {
                                  print('No');
                                  Navigator.of(context).pop();
                                },
                                child: const Text('No')),
                          ]),
                        ],
                      ),
                    ),
                  ),
 */
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _selection = 0;
  DateTime? selectedDate;
  TimeOfDay? timeOfDay;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    String date = selectedDate == null
        ? 'Please Slecet the Date'
        : selectedDate!.toDateString();

    String time = timeOfDay == null ? 'Select Time' : timeOfDay.toString();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 2,

        /// leading: const Icon(Icons.alarm),
        // bottom: AppBar(title: const Text('Bottom Bar')),
        // flexibleSpace: FlexibleSpaceBar(
        //     collapseMode: CollapseMode.parallax,
        //     background: Image.asset('assets/images/lady.jpeg')),
        //leadingWidth: 400,
        // primary: true,
        shape: const BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(40))),
        // shape:
        //     ContinuousRectangleBorder(borderRadius: BorderRadius.circular(50)),
        //  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        //shape: const CircleBorder(),
        // shape: const StadiumBorder(
        //     side: BorderSide(color: Colors.amber, width: 5)),
        // bottomOpacity: 0.4,
        // centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                print('Navigation Clicked');
              },
              icon: const Icon(Icons.navigation)),
          IconButton(
            onPressed: () {
              print('School Clicked');
            },
            icon: const Icon(Icons.school),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(time),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Deletion'),
                      content: const Text(
                          'Do you really want to delete this file'),
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              print('Deleted');
                              Navigator.of(context).pop();
                            },
                            child: const Text('Yes')),
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                MaterialStateProperty.all<Color?>(
                                    Colors.red)),
                            onPressed: () {
                              print('No');
                              Navigator.of(context).pop();
                            },
                            child: const Text('No'))
                      ],
                    ));
              },
              icon: const Icon(Icons.person),
            ),
            ElevatedButton(
                onPressed: () async {
                  // selectedDate = await showDatePicker(
                  //     context: context,
                  //     initialDate: DateTime.now(),
                  //     firstDate: DateTime(2010),
                  //     lastDate: DateTime(2026));
                  timeOfDay = await showTimePicker(
                      context: context, initialTime: TimeOfDay.now());

                  setState(() {});
                },
                child: const Text('Pick Date')),
            Builder(
              builder: (context) => ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                        isDismissible: false,
                        backgroundColor: Colors.blueGrey,
                        constraints: const BoxConstraints(
                            minHeight: 100, maxHeight: 200),
                        context: context,
                        builder: (context) => Column(children: [
                          const ListTile(
                            leading: CircleAvatar(
                              child: Icon(Icons.car_rental),
                            ),
                            title: Text('Car'),
                          ),
                          const ListTile(
                            leading: CircleAvatar(
                              child: Icon(
                                Icons.fire_truck,
                              ),
                            ),
                            title: Text('Fire Truck'),
                          ),
                          ListTile(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            leading: const CircleAvatar(
                                child: Icon(
                                  Icons.bus_alert,
                                )),
                            title: const Text('Bus'),
                          ),
                        ]));
                  },
                  child: const Text('Show Bottom Sheet')),
            )
          ],
        ),
      ),
      drawer: Drawer(
        // shape: const BeveledRectangleBorder(),
          backgroundColor: Colors.blue,
          child: Column(
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(color: Colors.lightBlue),
                curve: Curves.bounceInOut,
                duration: const Duration(seconds: 3),
                child: ListTile(
                  leading: const CircleAvatar(
                    child: Text('H'),
                  ),
                  title: Text(
                    'Header',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  trailing: const Icon(Icons.download),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home Page'),
                subtitle: const Text('Sub Title'),
                onTap: () {
                  print('Go To Home page click');
                },
              ),
              ListTile(
                leading: const Icon(Icons.school),
                title: const Text('School Page'),
                subtitle: const Text('Sub Title'),
                onTap: () {
                  print('Go To School page click');
                },
              ),
              ListTile(
                leading: const Icon(Icons.work),
                title: const Text('Work Page'),
                subtitle: const Text('Sub Title'),
                onTap: () {
                  print('Go To Work page click');
                },
              )
            ],
          )),
      // bottomSheet: BottomSheet(
      //   backgroundColor: Colors.brown,
      //   constraints: const BoxConstraints(minHeight: 50, maxHeight: 150),
      //   onClosing: () {},
      //   builder: (context) => Column(children: const [
      //     ListTile(
      //       leading: CircleAvatar(
      //         child: Icon(Icons.car_rental),
      //       ),
      //       title: Text('Car'),
      //     ),
      //     ListTile(
      //       leading: CircleAvatar(
      //         child: Icon(
      //           Icons.fire_truck,
      //         ),
      //       ),
      //       title: Text('Fire Truck'),
      //     ),
      //     ListTile(
      //       leading: CircleAvatar(
      //           child: Icon(
      //         Icons.bus_alert,
      //       )),
      //       title: Text('Bus'),
      //     ),
      //   ]),
      // ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.amber,
          mouseCursor: SystemMouseCursors.grab,
          showSelectedLabels: true,
          type: BottomNavigationBarType.shifting,
          enableFeedback: true,
          iconSize: 25,
          landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
          elevation: 20,
          currentIndex: _selection,
          onTap: ((value) {
            setState(() {
              _selection = value;
            });
            if (value == 1) {
              //Builder(builder: (context) => SizedBox.shrink() showBottomSheet(context: context, builder: builder),);
            }
          }),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home',
                activeIcon: Icon(Icons.home_max),
                backgroundColor: Colors.blue,
                tooltip: 'Go to Home Page'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.work,
                ),
                label: 'Work',
                activeIcon: Icon(Icons.work_off),
                backgroundColor: Colors.blue,
                tooltip: 'Go to Work Page'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.school,
                ),
                label: 'School',
                activeIcon: Icon(Icons.school_outlined),
                backgroundColor: Colors.blue,
                tooltip: 'Go to School Page'),
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class BottomSheetHandler extends StatelessWidget {
  const BottomSheetHandler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
                isDismissible: false,
                backgroundColor: Colors.blueGrey,
                constraints:
                const BoxConstraints(minHeight: 100, maxHeight: 200),
                context: context,
                builder: (context) => Column(children: [
                  const ListTile(
                    leading: CircleAvatar(
                      child: Icon(Icons.car_rental),
                    ),
                    title: Text('Car'),
                  ),
                  const ListTile(
                    leading: CircleAvatar(
                      child: Icon(
                        Icons.fire_truck,
                      ),
                    ),
                    title: Text('Fire Truck'),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    leading: const CircleAvatar(
                        child: Icon(
                          Icons.bus_alert,
                        )),
                    title: const Text('Bus'),
                  ),
                ]));
          },
          child: const Text('Click')),
    );
  }
}

