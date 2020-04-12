import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/model.dart';

int _radioValue1 = -1;
int _radioValue2 = -1;

bool selected1 = true;
bool selected2 = false;
bool selected3 = false;
bool selected4 = false;

class CustomizePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Customize_Type();
  }
}

class Customize_Type extends StatefulWidget {
  Customize_Type({Key key}) : super(key: key);
  @override
  _Customize_TypeState createState() => _Customize_TypeState();
}

class _Customize_TypeState extends State<Customize_Type> {
  @override
 
  final TextStyle initialStyle = TextStyle(
    fontSize: 14.0,
    color: Colors.grey,
  );
  final TextStyle finalStyle = TextStyle(
    fontSize: 14.0,
    color: Color.fromRGBO(255, 139, 0, 1),
  );

  ScrollController _scrollController;
  ScrollController _horizonscrollController;
  
  void _scrollToSpicy() {   
    _scrollController.jumpTo(0);
    
  }

  void _scrollToMeat() {   
    _scrollController.jumpTo(307);
  }

  void _scrollToSide() {   
    _scrollController.jumpTo(614);    
  }

  void _scrollToAdd() {   
    _scrollController.jumpTo(970);
    
  }
   
  void initState() {
    _scrollController = ScrollController();   
    _scrollController.addListener(() {
     
      double positionY = _scrollController.offset;

      if (positionY > 0 && positionY < 306) {
        setState(() {
          selected1 = true;
          selected2 = false;
          selected3 = false;
          selected4 = false;
         
        });
      }
      if (positionY > 306 && positionY < 613) {
        setState(() {
          selected1 = false;
          selected2 = true;
          selected3 = false;
          selected4 = false;
          
        });
      }
      if (positionY > 613 && positionY < 970) {
        setState(() {
          selected1 = false;
          selected2 = false;
          selected3 = true;
          selected4 = false;
          
        });
      }
      if (positionY > 970) {
        setState(() {
          selected1 = false;
          selected2 = false;
          selected3 = false;
          selected4 = true;
        });
      }
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
     double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: height*0.1,
              color: Colors.white,
              padding:
                  const EdgeInsets.only(left: 20.0, top: 24.0, right: 12.0),
              child: Row(
                //      mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    width: 24,
                    padding: const EdgeInsets.all(0),
                    child: Row(
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            'assets/images/icon_back.png',
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Customize",
                        style: TextStyle(
                            fontSize: 18.0,
                            fontFamily: 'SF Pro Text',
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  InkWell(
                    onTap: () {
                      print(context);
                      setState(() {
                        _radioValue1 = -1;
                        _radioValue2 = -1;
                       for (var i = 0; i < 5; i++) {
                         Singleton().orderCarts[0].customs.sideUps[i].selected = false;
                       }
                       for (var i = 0; i < 5; i++) {
                         Singleton().orderCarts[0].customs.addOns[i].selected = false;
                       }
                      });
                    },
                    child: Container(
                      width: 52,
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Reset",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'SF Pro Text',
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(255, 139, 0, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: 582,
                width: width,
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Container(
                        height: 44,
                        child: new ListView(
                          controller: _horizonscrollController,                          
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                setState(() {
                                  selected1 = true;
                                  selected2 = false;
                                  selected3 = false;
                                  selected4 = false;
                                  _scrollToSpicy();
                                  
                                });
                              },
                              child: Container(
                                width: width * 0.3,
                                padding: const EdgeInsets.all(8),
                                decoration: selected1
                                    ? new BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                          width: 4.0,
                                          color: Color.fromRGBO(255, 139, 0, 1),
                                        )),
                                      )
                                    : new BoxDecoration(),
                                child: Text(
                                  'Spice Level',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: selected1
                                        ? Color.fromRGBO(255, 139, 0, 1)
                                        : Colors.black,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  selected1 = false;
                                  selected2 = true;
                                  selected3 = false;
                                  selected4 = false;
                                  _scrollToMeat();
                                });
                              },
                              child: Container(
                                width: width * 0.40,
                                padding: const EdgeInsets.all(8),
                                decoration: selected2
                                    ? new BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                          width: 4.0,
                                          color: Color.fromRGBO(255, 139, 0, 1),
                                        )),
                                      )
                                    : new BoxDecoration(),
                                child: Text(
                                  'Meat Preparation',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: selected2
                                        ? Color.fromRGBO(255, 139, 0, 1)
                                        : Colors.black,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  selected1 = false;
                                  selected2 = false;
                                  selected3 = true;
                                  selected4 = false;
                                  _scrollToSide();
                                  
                                });
                              },
                              child: Container(
                                width: width * 0.15,
                                padding: const EdgeInsets.all(8),
                                decoration: selected3
                                    ? new BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                          width: 4.0,
                                          color: Color.fromRGBO(255, 139, 0, 1),
                                        )),
                                      )
                                    : new BoxDecoration(),
                                child: Text(
                                  'Side',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: selected3
                                        ? Color.fromRGBO(255, 139, 0, 1)
                                        : Colors.black,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  selected1 = false;
                                  selected2 = false;
                                  selected3 = false;
                                  selected4 = true;
                                  _scrollToAdd();
                                  
                                });
                              },
                              child: Container(
                                width: width * 0.25,
                                padding: const EdgeInsets.all(8),
                                decoration: selected4
                                    ? new BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                          width: 4.0,
                                          color: Color.fromRGBO(255, 139, 0, 1),
                                        )),
                                      )
                                    : new BoxDecoration(),
                                child: Text(
                                  'Add-on',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: selected4
                                        ? Color.fromRGBO(255, 139, 0, 1)
                                        : Colors.black,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        )),
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.all(0),
                        controller: _scrollController,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.only(
                                left: 14.0, top: 14.0, bottom: 14.0),
                            color: Colors.grey[300],
                            child: Text(
                              "Spice Level",
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                          Container(
                            height: 260,
                            child: ListView.builder(
                               physics: const NeverScrollableScrollPhysics(),
                                padding: const EdgeInsets.all(0),
                                itemCount: Singleton().orderCarts[0].customs.spiceLevels.length,
                                itemBuilder:
                                    (BuildContext context, int index) =>
                                        RadioButton1(context, index)),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 14.0, top: 14.0, bottom: 14.0),
                            color: Colors.grey[300],
                            child: Text(
                              "Meat Preparation",
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ),
                          Container(
                            height: 260,
                            child: ListView.builder(
                               physics: const NeverScrollableScrollPhysics(),
                                padding: const EdgeInsets.all(0),
                                itemCount: Singleton().orderCarts[0].customs.meatPreparations.length,
                                itemBuilder:
                                    (BuildContext context, int index) =>
                                        RadioButton2(context, index)),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 14.0, top: 14.0, bottom: 14.0),
                            color: Colors.grey[300],
                            child: Text(
                              "Side(Up to 2)",
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ),
                          Container(
                            height: 300,
                            child: ListView.builder(
                               physics: const NeverScrollableScrollPhysics(),
                                padding: const EdgeInsets.all(0),
                                itemCount: Singleton().orderCarts[0].customs.sideUps.length,
                                itemBuilder:
                                    (BuildContext context, int index) =>
                                        CheckButton1(context, index)),
                          ),
                        
                          Container(
                            padding: const EdgeInsets.only(
                                left: 14.0, top: 14.0, bottom: 14.0),
                            color: Colors.grey[300],
                            child: Text(
                              "Add-ons",
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ),
                          Container(
                            height: 315,
                            child: ListView.builder(
                               physics: const NeverScrollableScrollPhysics(),
                                padding: const EdgeInsets.all(0),
                                itemCount: Singleton().orderCarts[0].customs.addOns.length,
                                itemBuilder:
                                    (BuildContext context, int index) =>
                                        CheckButton2(context, index)),
                          ),
                        
                          Container(
                            padding: const EdgeInsets.only(
                                left: 14.0, top: 14.0, bottom: 14.0),
                            color: Colors.grey[300],
                            child: Text(
                              "Special Instruction",
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ),
                          // InkWell(
                          //   onTap: () {
                          //     setState(() {
                          //       specialInstructionSelected = !specialInstructionSelected;
                          //     });
                          //     print("object");
                          //   },
                            Container(
                              height: 110,
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: AnimatedDefaultTextStyle(
                                  style: specialInstructionSelected ? finalStyle : initialStyle,
                                  duration: const Duration(milliseconds: 50),
                                  child: Text("Less salt, more sugar"),
                                ),
                              ),
                            ),
                          // ),
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

  Widget RadioButton1(context, index) {
    // for(var i = 0; i<Singleton().orderCarts[0].customs.spiceLevels.length; i ++){
    //   if(Singleton().orderCarts[0].customs.spiceLevels[i].title == foodOrder.)
    // }
    return Container(
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Row(
                children: <Widget>[
                  Radio(
                    value: index,
                    groupValue:_radioValue1,
                    onChanged: (val) {
                      setState(() {
                        _radioValue1 = val;
                        Singleton().orderCarts[0].customs.spiceLevels[index].selected = true;
                      });
                    },
                    activeColor: Color.fromRGBO(255, 139, 0, 1),
                  ),
                  Text(Singleton().orderCarts[0].customs.spiceLevels[index].title),
                ],
              ),
            ),
          ),
          Spacer(
            flex: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('+\$' + Singleton().orderCarts[0].customs.spiceLevels[index].value),
          ),
        ],
      ),
    );
  }

  Widget RadioButton2(context, index) {
    return Container(
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Row(
                children: <Widget>[
                  Radio(
                    value: index,
                    groupValue: _radioValue2,
                    onChanged: (val) {
                      setState(() {
                        _radioValue2 = val;
                        Singleton().orderCarts[0].customs.meatPreparations[index].selected = true;
                      });
                    },
                    activeColor: Color.fromRGBO(255, 139, 0, 1),
                  ),
                  Text(Singleton().orderCarts[0].customs.meatPreparations[index].title),
                ],
              ),
            ),
          ),
          Spacer(
            flex: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('+\$' + Singleton().orderCarts[0].customs.meatPreparations[index].value),
          ),
        ],
      ),
    );
  }

  Widget CheckButton1(context, index) {
    return Container(
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Row(
                children: <Widget>[
                  Checkbox(
                    value:Singleton().orderCarts[0].customs.sideUps[index].selected,
                    onChanged:(val) {
                      setState(() {
                        Singleton().orderCarts[0].customs.sideUps[index].selected = !Singleton().orderCarts[0].customs.sideUps[index].selected;
                      });
                    },
                    activeColor: Color.fromRGBO(255, 139, 0, 1),
                  ),
                  Text(Singleton().orderCarts[0].customs.sideUps[index].title),
                ],
              ),
            ),
          ),
          Spacer(
            flex: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('+\$' + Singleton().orderCarts[0].customs.sideUps[index].value),
          ),
        ],
      ),
    );
  }

  Widget CheckButton2(context, index) {
    return Container(
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Row(
                children: <Widget>[
                  Checkbox(
                    value:Singleton().orderCarts[0].customs.addOns[index].selected,
                    onChanged:(val) {
                      setState(() {
                        Singleton().orderCarts[0].customs.addOns[index].selected = !Singleton().orderCarts[0].customs.addOns[index].selected;
                      });
                    },
                    activeColor: Color.fromRGBO(255, 139, 0, 1),
                  ),
                  Text(Singleton().orderCarts[0].customs.addOns[index].title),
                ],
              ),
            ),
          ),
          Spacer(
            flex: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('+\$' + Singleton().orderCarts[0].customs.addOns[index].value),
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
                    fontSize: 16.0,
                    fontFamily: 'Helvetica Neue',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              color: Color.fromRGBO(255, 139, 0, 1),
              textColor: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
