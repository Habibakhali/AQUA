import 'package:flutter/material.dart';
import 'package:project/select.dart';

class HomePage extends StatefulWidget {
  static const String routeName = 'home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> values = [
    'computer sciences ',
    'pure math',
    'statistic',
    'statistic and math',
    'statistic and computer sciences',
    'math and computer science',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(183, 224, 254, 1),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Icon(Icons.menu),
          title: Text("Home"),
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(children: [
              Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage('assets/images/Logo.jpg'),
                          fit: BoxFit.fill)),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  )),
              SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  itemCount: values.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 10,
                      child: Center(
                        child: Column(
                          children: [
                            Text(values[index]),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, SelectionPart.routename);
                              },
                              child: Text('select'),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                ),
              ),
            ]),
          ),
        ));
  }
}
