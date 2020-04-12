import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum SingingCharacter1 { NonSpicy, MildSpicy, MediumSpicy, ExtraSpicy }
enum SingingCharacter2 { NonSpicy, MildSpicy, MediumSpicy, ExtraSpicy }
enum SingingCharacter3 { NonSpicy, MildSpicy, MediumSpicy, ExtraSpicy }
enum SingingCharacter4 { NonSpicy, MildSpicy, MediumSpicy, ExtraSpicy }

class OrderMenu extends StatefulWidget {
   OrderMenu({Key key}) : super(key: key);
  @override
  _OrderMenuState createState() => _OrderMenuState();
}

class _OrderMenuState extends State<OrderMenu> {
  @override
   int _radioValue1 = -1;
   int _radioValue2 = -1;
   bool _checkValue1 = false;
   bool _checkValue2 = false;
   bool _checkValue3 = false;
   bool _checkValue4 = false;
   bool _checkValue5 = false;
   bool _checkValue6 = false;
   bool _checkValue7 = false;
   bool _checkValue8 = false;
   bool _checkValue9 = false;
   bool _checkValue10 = false;

  var isTapped = false;

   final TextStyle initialStyle = TextStyle(
  fontSize: 14.0,
  color: Colors.grey,  
  );
  final TextStyle finalStyle = TextStyle(
  fontSize: 14.0,
  color:  Color.fromRGBO(255, 139, 0, 1),
 
  );

  ScrollController _scrollController;

   void _handleRadioValueChange1(int value){
     setState(() {
      _radioValue1 = value;

     });
   }

  void _handleRadioValueChange2(int value){
     setState(() {
      _radioValue2 = value;

     });
   }
  void _handleCheckValueChange1(bool value){
    setState(() {
     _checkValue1 = value;
    });
  }
  void _handleCheckValueChange2(bool value){
    setState(() {
     _checkValue2 = value;
    });
  }
  void _handleCheckValueChange3(bool value){
    setState(() {
     _checkValue3 = value;
    });
  }
  void _handleCheckValueChange4(bool value){
    setState(() {
     _checkValue4 = value;
    });
  }
  void _handleCheckValueChange5(bool value){
    setState(() {
     _checkValue5 = value;
    });
  }
  void _handleCheckValueChange6(bool value){
    setState(() {
     _checkValue6 = value;
    });
  }
  void _handleCheckValueChange7(bool value){
    setState(() {
     _checkValue7 = value;
    });
  }
  void _handleCheckValueChange8(bool value){
    setState(() {
     _checkValue8 = value;
    });
  }
  void _handleCheckValueChange9(bool value){
    setState(() {
     _checkValue9 = value;
    });
  }
   void _handleCheckValueChange10(bool value){
    setState(() {
     _checkValue10 = value;
    });
  }
  void _scrollToSpicy(){
    _scrollController.animateTo(0, duration: new Duration(milliseconds: 500), curve: Curves.ease);
  }
  void _scrollToMeat(){
    _scrollController.animateTo( 306, duration: new Duration(milliseconds: 500), curve: Curves.ease);
  }
  void _scrollToSide(){
    _scrollController.animateTo( 613, duration: new Duration(milliseconds: 500), curve: Curves.ease);
  }
  void _scrollToAdd(){
    _scrollController.animateTo(1000, duration: new Duration(milliseconds: 500), curve: Curves.ease);
  }

void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            NavWidget(),
            Expanded(
              child: Container(
                height: height * 0.75,
                width: width,
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Container(
                        height: height * 0.05,
                        child: new ListView(
                          scrollDirection: Axis.horizontal,
                          
                          children: <Widget>[
                            Container(
                              width: width * 0.3,
                              color: Colors.red,
                              padding: const EdgeInsets.all(8),
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                     _scrollToSpicy();
                                  });
                                 
  
                                } ,
                                child: Text(
                                  'Spice Level',
                                  style: TextStyle(fontSize: 16),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Container(
                              width: width * 0.40,
                              color: Colors.orange,
                              padding: const EdgeInsets.all(8),
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                     _scrollToMeat();
                                  });
                                },
                                child: Text(
                                  'Meat Preparation',
                                  style: TextStyle(fontSize: 16),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Container(
                              width: width * 0.15,
                              color: Colors.pink,
                              padding: const EdgeInsets.all(8),
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                     _scrollToSide();
                                  });
                                },
                                child: Text(
                                                           'Side',
                                  style: TextStyle(fontSize: 16),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Container(
                              width: width * 0.25,
                              color: Colors.yellow,
                              padding: const EdgeInsets.all(8),
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                     _scrollToAdd();
                                     
                                  });
                                },
                                child: Text(
                                                           'Add-on',
                                  style: TextStyle(fontSize: 16),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        )),
                        Expanded(
                          child: ListView(
                            controller: _scrollController,
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.only(left: 14.0, top: 14.0, bottom: 14.0),
                                color: Colors.grey[300],
                                child: Text("Spice Level",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),
                                 ),
                              ),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Row(
                                          children: <Widget>[
                                            Radio(
                                              value: 0,
                                              groupValue: _radioValue1,
                                              onChanged: _handleRadioValueChange1,
                                            ),
                                            Text('Non Spice'),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Spacer(flex: 1,),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('+\$0.00'),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Row(
                                          children: <Widget>[
                                            Radio(
                                              value: 1,
                                              groupValue: _radioValue1,
                                              onChanged: _handleRadioValueChange1,
                                            ),
                                            Text('Mild Spicy'),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Spacer(flex: 1,),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('+\$0.00'),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Row(
                                          children: <Widget>[
                                            Radio(
                                              value: 2,
                                              groupValue: _radioValue1,
                                              onChanged: _handleRadioValueChange1,
                                              activeColor: Color.fromRGBO(255, 139, 0, 1),
                                            ),
                                            Text('Medium Spicy'),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Spacer(flex: 1,),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('+\$0.00'),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Row(
                                          children: <Widget>[
                                            Radio(
                                              value: 3,
                                              groupValue: _radioValue1,
                                              onChanged: _handleRadioValueChange1,
                                              activeColor: Color.fromRGBO(255, 139, 0, 1),
                                            ),
                                            Text('Extra Spicy'),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Spacer(flex: 1,),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('+\$0.00'),
                                    ),
                                  ],
                                ),
                              ), 
                              Container(
                                padding: const EdgeInsets.only(left: 14.0, top: 14.0, bottom: 14.0),
                                color: Colors.grey[300],
                                child: Text("Meat Preparation",
                                  style: TextStyle(
                                    fontSize: 20.0
                                  ),
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Row(
                                          children: <Widget>[
                                            Radio(
                                              value: 0,
                                              groupValue: _radioValue2,
                                              onChanged: _handleRadioValueChange2,
                                              activeColor: Color.fromRGBO(255, 139, 0, 1),
                                            ),
                                            Text('Rare'),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Spacer(flex: 1,),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('+\$0.00'),
                                    ),
                                  ],
                                ),
                              ), 
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Row(
                                          children: <Widget>[
                                            Radio(
                                              value: 1,
                                              groupValue: _radioValue2,
                                              onChanged: _handleRadioValueChange2,
                                              activeColor: Color.fromRGBO(255, 139, 0, 1),
                                            ),
                                            Text('Medium'),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Spacer(flex: 1,),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('+\$0.00'),
                                    ),
                                  ],
                                ),
                              ), 
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Row(
                                          children: <Widget>[
                                            Radio(
                                              value: 2,
                                              groupValue: _radioValue2,
                                              onChanged: _handleRadioValueChange2,
                                              activeColor: Color.fromRGBO(255, 139, 0, 1),
                                            ),
                                            Text('Medium Well'),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Spacer(flex: 1,),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('+\$0.00'),
                                    ),
                                  ],
                                ),
                              ), 
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Row(
                                          children: <Widget>[
                                            Radio(
                                              value: 3,
                                              groupValue: _radioValue2,
                                              onChanged: _handleRadioValueChange2,
                                              activeColor: Color.fromRGBO(255, 139, 0, 1),
                                            ),
                                            Text('Extra Well'),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Spacer(flex: 1,),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('+\$0.00'),
                                    ),
                                  ],
                                ),
                              ), 
                              Container(
                                padding: const EdgeInsets.only(left: 14.0, top: 14.0, bottom: 14.0),
                                color: Colors.grey[300],
                                child: Text("Side(Up to 2)",
                                  style: TextStyle(

                                    fontSize: 20.0
                                  ),
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Row(
                                          children: <Widget>[
                                            Checkbox(
                                              value: _checkValue1,
                                              onChanged: _handleCheckValueChange1,
                                              activeColor: Color.fromRGBO(255, 139, 0, 1),
                                            ),
                                            Text('Fried Fries'),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Spacer(flex: 1,),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('+\$0.00'),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Row(
                                          children: <Widget>[
                                            Checkbox(
                                              value: _checkValue2,
                                              onChanged: _handleCheckValueChange2,
                                              activeColor: Color.fromRGBO(255, 139, 0, 1),
                                            ),
                                            Text('Mushroom'),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Spacer(flex: 1,),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('+\$0.00'),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Row(
                                          children: <Widget>[
                                            Checkbox(
                                              value: _checkValue3,
                                              onChanged: _handleCheckValueChange3,
                                              activeColor: Color.fromRGBO(255, 139, 0, 1),
                                            ),
                                            Text('Caesar Salad'),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Spacer(flex: 1,),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('+\$0.00'),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Row(
                                          children: <Widget>[
                                            Checkbox(
                                              value: _checkValue4,
                                              onChanged: _handleCheckValueChange4,
                                              activeColor: Color.fromRGBO(255, 139, 0, 1),
                                            ),
                                            Text('Potato'),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Spacer(flex: 1,),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('+\$0.00'),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Row(
                                          children: <Widget>[
                                            Checkbox(
                                              value: _checkValue5,
                                              onChanged: _handleCheckValueChange5,
                                              activeColor: Color.fromRGBO(255, 139, 0, 1),
                                            ),
                                            Text('Com'),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Spacer(flex: 1,),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('+\$0.00'),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 14.0, top: 14.0, bottom: 14.0),
                                color: Colors.grey[300],
                                child: Text("Add-ons",
                                  style: TextStyle(

                                    fontSize: 20.0
                                  ),
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Row(
                                          children: <Widget>[
                                            Checkbox(
                                              value: _checkValue6,
                                              onChanged: _handleCheckValueChange6,
                                              activeColor: Color.fromRGBO(255, 139, 0, 1),
                                            ),
                                            Text('Pudding'),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Spacer(flex: 1,),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('+\$0.00'),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Row(
                                          children: <Widget>[
                                            Checkbox(
                                              value: _checkValue7,
                                              onChanged: _handleCheckValueChange7,
                                              activeColor: Color.fromRGBO(255, 139, 0, 1),
                                            ),
                                            Text('Cheese'),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Spacer(flex: 1,),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('+\$0.00'),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Row(
                                          children: <Widget>[
                                            Checkbox(
                                              value: _checkValue8,
                                              onChanged: _handleCheckValueChange8,
                                              activeColor: Color.fromRGBO(255, 139, 0, 1),
                                            ),
                                            Text('Black Sugar Boba'),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Spacer(flex: 1,),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('+\$0.00'),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Row(
                                          children: <Widget>[
                                            Checkbox(
                                              value: _checkValue9,
                                              onChanged: _handleCheckValueChange9,
                                              activeColor: Color.fromRGBO(255, 139, 0, 1),
                                            ),
                                            Text('Rainbow Jelly'),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Spacer(flex: 1,),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('+\$0.00'),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Row(
                                          children: <Widget>[
                                            Checkbox(
                                              value: _checkValue10,
                                              onChanged: _handleCheckValueChange10,
                                              activeColor: Color.fromRGBO(255, 139, 0, 1),
                                            ),
                                            Text('Herbal Jelly'),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Spacer(flex: 1,),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('+\$0.00'),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 14.0, top: 14.0, bottom: 14.0),
                                color: Colors.grey[300],
                                child: Text("Special Instruction",
                                  style: TextStyle(
                                    fontSize: 20.0
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                      isTapped = !isTapped;
                                    });
                                  print("object");
                                },
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: AnimatedDefaultTextStyle(
                                            style: isTapped ? finalStyle : initialStyle,
                                            duration: const Duration(milliseconds: 50),
                                            child: Text(
                                            "Less salt, more sugar"
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                  ],
                ),
              ),
            ),
            Button(),
          ],
        ),
      ),
    );
  }
}


//         CheckboxListTile(
//           value: false,
//           onChanged: (bool val) => true,
//           title: Row(
//             children: <Widget>[

//               Text("CheckBox Text"),
//               Text("data"),

//             ],
//           ),

//           controlAffinity: ListTileControlAffinity.leading,
//         ),
//       ]
//     ) ,
//     );

//   }
// }

class NavWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.094,
      color: Colors.white,
      child: Row(
//      mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[
                Image.asset('assets/icon_back.png'),
              ],
            ),
          ),
          Spacer(flex: 3),
          Row(
            children: <Widget>[
              Text(
                "Customize",
                style: TextStyle(fontSize: 22.0),
              ),
            ],
          ),
          Spacer(flex: 3),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: <Widget>[
                Text(
                  "Reset",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(255, 139, 0, 1),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Button extends StatelessWidget {
  // Fields in a Widget subclass are always marked "final".

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.075,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            width: width,
            height: height * 0.075,
            child: FlatButton(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  'CONFIRM',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              color: Color.fromRGBO(255, 139, 0, 1),
              textColor: Colors.white,
              onPressed: () {
                print('You tapped on FlatButton');
              },
            ),
          ),
        ],
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      home: OrderMenu(),
    ));
