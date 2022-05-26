import "package:flutter/material.dart";

void main() {
  runApp(MaterialApp(
    title: "Simple Interest calculator",
    home: SIform(),
  ));
}

class SIform extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SIformState();
  }
}

class _SIformState extends State<SIform> {
  var _currencies = ["Rupees", 'USD', 'AUD'];
  var _currentItemSelected="Rupees";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Simple Interest Calculator",
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            getImageAsset(),
            Padding(
                padding: EdgeInsets.all(5.0),
                child: TextField(
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
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Term",
                        hintText: "In Years",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),

                Expanded(child: DropdownButton<String>(
							    items: _currencies.map((String value) {
							    	return DropdownMenuItem<String>(
									    value: value,
									    child: Text(value),
								    );
							    }).toList(),

							    value: 'Rupees',

							    onChanged: (String newValueSelected) {
							    	// Your code to execute, when a menu item is selected from dropdown
							    },

						    ))


              ],
            )
          ],
        ),
      ),
    );
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
