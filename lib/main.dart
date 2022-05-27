import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';

void main() {
  runApp(
    MaterialApp(
        title: "Simple Interest calculator",
        home: SIform(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(
                primary: Colors.red,
                brightness: Brightness.dark,
                secondary: Color.fromARGB(255, 255, 0, 0)))),
  );
}

class SIform extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SIformState();
  }
}

class _SIformState extends State<SIform> {
  TextEditingController pc= TextEditingController();
  TextEditingController roic= TextEditingController();
  TextEditingController termc= TextEditingController();
  var displayText="";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(
          "Simple Interest Calculator",
        ),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            getImageAsset(),
            Padding(
                padding: EdgeInsets.all(5.0),
                child: TextField(
                  controller: pc,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Principal",
                      hintText: "Enter Amount",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ))),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: TextField(
                controller: roic,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Rate Of Interest",
                    hintText: "Enter Interest",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  )),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: termc,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Term",
                        hintText: "In Years",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),
                
              ],
            ),
            Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: ElevatedButton(
                            child: Text('Calculate'), 
                            onPressed: () {
                              setState(() {
                                this.displayText =calcresult();
                              });
                            })),
                    Expanded(
                        child: ElevatedButton(
                            child: Text('Reset'), 
                            onPressed: () {
                              setState(() {
                                pc.text="";
                                roic.text="";
                                termc.text="";
                                displayText="";
                              });
                            }))
                  ],
                )),
            Padding(
              padding: EdgeInsets.only(left: 70.0, top: 50.0),
              child: Text(
                "Your Amount would be $displayText"),
            )
          ],
        ),
      ),
    ));
  }
  String calcresult(){
  double p=double.parse(pc.text);
  double r=double.parse(roic.text);
  double t=double.parse(termc.text);

  return ((p*r*t/100)+p).toString();
}
}

Widget getImageAsset() {
  AssetImage assetImage = const AssetImage('images/money.png');
  Image image = Image(
    image: assetImage,
    width: 100.0,
    height: 100.0,
  );
  return Container(
    child: image,
    margin: EdgeInsets.all(80.0),
  );
}


