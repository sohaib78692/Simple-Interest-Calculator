import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
            title: "Simple Interest calculator",
            home:  SIform(),
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                colorScheme: ColorScheme.fromSwatch().copyWith(
                    primary: Colors.red,
                    brightness: Brightness.dark,
                    secondary: const Color.fromARGB(255, 255, 0, 0))));
      }));
}

class SIform extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SIformState();
  }
}

class _SIformState extends State<SIform> {
  TextEditingController pc = TextEditingController();
  TextEditingController roic = TextEditingController();
  TextEditingController termc = TextEditingController();
  String dropdownvalue = 'Item 1';

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  var displayText = "";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(
          "Simple Interest Calculator",
        ),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
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
                Container(
                  width: 20.0,
                ),
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: dropdownvalue,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: ElevatedButton(
                            child: const Text('Calculate'),
                            onPressed: () {
                              setState(() {
                                displayText = calcresult();
                              });
                            })),
                    Container(
                      width: 20.0,
                    ),
                    Expanded(
                        child: ElevatedButton(
                            child: const Text('Reset'),
                            onPressed: () {
                              setState(() {
                                pc.text = "";
                                roic.text = "";
                                termc.text = "";
                                displayText = "";
                              });
                            }))
                  ],
                )),
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 20.h),
              child: Text("Your Amount would be $displayText"),
            )
          ],
        ),
      ),
    ));
  }

  String calcresult() {
    double p = double.parse(pc.text);
    double r = double.parse(roic.text);
    double t = double.parse(termc.text);

    return ((p * r * t / 100) + p).toString();
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
    margin: const EdgeInsets.all(80.0),
  );
}
