import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './customize.dart';
import '../pages/switchOrder.dart';
import '../model/model.dart';

class AddCartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => AppBloc(),
      child: AddCartState(),
    );
  }
}

class AddCartState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppBloc appBloc = BlocProvider.of<AppBloc>(context);

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: BlocListener<AppBloc, AppState>(
        listener: (context, state) {
          if (state is ShowCustomize) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CustomizePage()),
            );
          }
           if (state is OrderMethod) {
             
              
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SwitchOrderPage()),
                  );
                }
        },
        child: Column(
          children: <Widget>[
            CartAppBar(),
            CartDetail(appBloc: appBloc),
            OrderButton(appBloc: appBloc),
          ],
        ),
      ),
    );
  }
}

class CartAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.1, // in logical pixels
      padding: const EdgeInsets.only(top: 24.0),
      decoration: BoxDecoration(color: Colors.white),

      // Row is a horizontal, linear layout.
      child: Row(
        // <Widget> is the type of items in the list.
        children: <Widget>[
          SizedBox(
            width: 16,
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: ImageIcon(
              AssetImage('assets/images/icons-delete-filled.png'),
              size: 24.0,
              color: Colors.black,
              // padding: EdgeInsets.only(top:10.0),
            ),
          ),
          Spacer(
            flex: 1,
          ),
          // Expanded expands its child to fill the available space.
          Expanded(
            child: Text(
              'Your Cart',
              style: TextStyle(
                  fontSize: 17.0,
                  fontFamily: 'SF Pro Text',
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Spacer(
            flex: 1,
          ),
          SizedBox(
            width: 40,
          )
        ],
      ),
    );
  }
}

class CartDetail extends StatefulWidget {
  // Fields in a Widget subclass are always marked "final".
  AppBloc appBloc;
  CartDetail({this.appBloc});
  @override
  _CartDetailState createState() => _CartDetailState(appBloc: appBloc);
}

class _CartDetailState extends State<CartDetail> {
  AppBloc appBloc;
  _CartDetailState({this.appBloc});

  int sharedValue = 0;
  double tipValue = 2.25;
  List<String> selectedOrder;
  List<CustomizedItem> customizedItems;
  bool trailingTextSelected = false;

  List<ItemClass> itemObjects = [
    ItemClass(selected: true, val1: '15%', val2: '\$2.25'),
    ItemClass(selected: false, val1: '17%', val2: '\$2.55'),
    ItemClass(selected: false, val1: '19%', val2: '\$2.85'),
    ItemClass(selected: false, val1: 'Other', val2: ''),
  ]; 

  TextEditingController _textFieldController = TextEditingController();
  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
              title: Text("Enter Tip Amount"),
              content: Card(
                color: Colors.transparent,
                elevation: 0.0,
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 20.0),
                      child: Text(
                        "All tips go to business",
                        style: TextStyle(
                          color: Color.fromRGBO(200, 200, 200, 1),
                        ),
                      ),
                    ),
                    TextField(
                      controller: _textFieldController,
                      keyboardType: TextInputType.phone,
                      style: TextStyle(
                        fontSize: 35,
                      ),
                      decoration: new InputDecoration.collapsed(
                          hintText: "\$0",
                          hintStyle: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(160, 160, 160, 1),
                          )),
                      textAlignVertical: TextAlignVertical.center,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      //autofocus: true,
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                CupertinoDialogAction(
                  isDefaultAction: true,
                  child: Container(
                    width: 200,
                    height: 60,
                    padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 20.0),
                    child: Container(
                      width: 180,
                      height: 40,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(160, 160, 160, 1),
                        borderRadius: BorderRadius.all(Radius.circular(
                                20.0) //                 <--- border radius here
                            ),
                      ),
                      child: Text(
                        "SUBMIT",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      tipValue = double.parse(_textFieldController.text);
                      itemObjects[3].val2 = '\$' + _textFieldController.text;
                    });
                    Navigator.of(context).pop(true);
                  },
                )
              ],
            ));
  }

  final TextStyle initialStyle = TextStyle(
    fontSize: 14.0,
    color: Colors.grey,
  );
  final TextStyle finalStyle = TextStyle(
    fontSize: 14.0,
    color: Color.fromRGBO(255, 139, 0, 1),
  );

  @override
  Widget build(BuildContext context) {
    this.selectedOrder = [];
    for (var i = 0; i < 3; i++) {
      Order item = orderMethods[i];
      if (item.selected) {
        this.selectedOrder.add(orderMethods[i].order);
        
      }
    }
    if (selectedOrder[0] != 'Delivery') {
      trailingTextSelected = true;
      itemObjects[3].val1 = '21%';
      itemObjects[3].val2 = '\$3.15';
    }

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.83 - 3.7,
      width: width, // in logical pixels
      color: Colors.white,
      padding: const EdgeInsets.all(0),
      // Row is a horizontal, linear layout.
      child: ListView.builder(
        padding: const EdgeInsets.all(0),
        itemCount: 1,
        itemBuilder: (BuildContext context, int blockIdx) {
          return new Column(
            children: [
              Container(
                height: 200,
                width: width,
                padding: const EdgeInsets.all(0),
                child: Image.asset("assets/images/google_map.png"),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                   Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 2),
                      child: Container(
                        height: 30,
                        child: Row(
                          children: <Widget>[
                              InkWell(
                              onTap: () {
                                 appBloc.add(OrderMethodevent());
                                  cartSelected = true;
                                  
                              },
                              child:Text(
                                selectedOrder[0],
                                style: TextStyle(
                                  fontFamily: 'Helvetica Neue',
                                  fontSize: 18.0,
                                  color: Color.fromRGBO(38, 110, 246, 1),
                                ),
                              ),
                              ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Material(
                                  child: InkWell(
                                onTap: () {},
                                child: Image.asset(
                                    'assets/images/scroll_triangle_down_dark.png',
                                    width: 10.0,
                                    height: 10.0),
                              )),
                              
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(
                                trailingTextSelected ? "at" : "to",
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.grey),
                              ),
                            ),
                            Text(
                              "Lao Szechuan",
                              style: TextStyle(
                                  fontSize: 18.0, fontFamily: 'Helvetica Neue'),
                            ),
                          ],
                        ),
                      ),
                    ), 
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 2.0),
                      child: Text(
                        street +','+ city +', '+ state +' '+ zipcode,
                        style: TextStyle(
                            fontSize: 14.0, fontFamily: 'Helvetica Neue'),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 12.0),
                      child: Text(
                        "0.3 miles away",
                        style: TextStyle(
                            fontSize: 14.0, fontFamily: 'Helvetica Neue'),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 50,
                width: width,
                color: Color.fromRGBO(241, 242, 244, 1),
                padding: EdgeInsets.only(left: 8.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Your Order",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 16.0, fontFamily: 'Helvetica Neue'),
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.popUntil(context,
                            ModalRoute.withName(Navigator.defaultRouteName));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Add Dishes",
                          style: TextStyle(
                            fontSize: 14.0,
                            fontFamily: 'Helvetica Neue',
                            color: Color.fromRGBO(255, 139, 0, 1),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                // padding: EdgeInsets.only(top:10.0),
              ),
              BlocBuilder<AppBloc, AppState>(
              builder: (context, state) {
                return  Container(
                height: 200,
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(0),
                  separatorBuilder: (context, index) => Divider(
                    color: Colors.grey,
                  ),
                  itemCount: foodOrders.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Cart(context, index, appBloc, width);
                  },
                ),
              );}),
              Container(
                height: 50,
                width: width,
                color: Color.fromRGBO(241, 242, 244, 1),
                padding: EdgeInsets.only(left: 8.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Spacial Instructions",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 16.0, fontFamily: 'Helvetica Neue'),
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                  ],
                ),
                // padding: EdgeInsets.only(top:10.0),
              ),
              // InkWell(
              //   onTap: () {
              //     setState(() {
              //       specialInstructionSelected = !specialInstructionSelected;
              //     });
              //   },
              //   child: 
                Container(
                  height: 122,
                  width: width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          "Add a note (more sauce, less salt, etc.)",
                          style: specialInstructionSelected
                              ? finalStyle
                              : initialStyle,
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                    ],
                  ),
                ),
              // ),
              Container(
                height: 50,
                width: width,
                color: Color.fromRGBO(241, 242, 244, 1),
                padding: EdgeInsets.only(left: 8.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Tips",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 16.0, fontFamily: 'Helvetica Neue'),
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text("All tips will go to business",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Helvetica Neue',
                              color: Colors.grey)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.info_outline,
                        color: Colors.blue,
                        size: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 100,
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 80,
                        width: width - 20,
                        decoration: new BoxDecoration(
                          color: Colors.black,
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                          ),
                        ),
                        //padding: const EdgeInsets.only(left:2),
                        child: GridView.count(
                          crossAxisCount: 4,
                          mainAxisSpacing: 0,
                          crossAxisSpacing: 0,
                          childAspectRatio: 1.25,
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          children: List.generate(4, (index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  for (int i = 0; i < itemObjects.length; i++) {
                                    if (i == index) {
                                      itemObjects[i].selected = true;
                                      switch (i) {
                                        case 0:
                                          tipValue = 2.25;
                                          break;
                                        case 1:
                                          tipValue = 2.55;
                                          break;
                                        case 2:
                                          tipValue = 2.85;
                                          break;
                                        case 3:
                                          if (itemObjects[i].val1 == 'Other') {
                                            _onBackPressed();
                                          } else {
                                            tipValue = 3.15;
                                          }

                                          break;
                                        default:
                                      }
                                    } else {
                                      itemObjects[i].selected = false;
                                    }
                                  }
                                });
                              },
                              child: CustomItem(
                                index: index,
                                selected: itemObjects[index].selected,
                                val1: itemObjects[index].val1,
                                val2: itemObjects[index].val2,
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 50,
                width: width,
                color: Colors.grey[300],
                padding: EdgeInsets.only(left: 8.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Details",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                  ],
                ),
              ),
              Container(
                height: 190,
                width: width,
                padding: EdgeInsets.only(left: 8.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 8.0),
                          child: Text(
                            "Subtotal",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 8.0),
                          child: Text(
                            "\$14.99",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Tax",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "\$1.57",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    BlocBuilder<AppBloc, AppState>(builder: (context, state) {
                      return Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Tip",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "\$" + tipValue.toString(),
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      );
                    }),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "InfiCash",
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromRGBO(129, 183, 47, 1)),
                          ),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "-\$18.81",
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromRGBO(129, 183, 47, 1)),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Total",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "\$0.00",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget Cart(context, index, appBloc, width) {
    this.customizedItems = [];
    print("efe "+index.toString());
    
    for (var i = 0; i < 4; i++) {
      SpiceLevel item = Singleton().orderCarts[0].customs.spiceLevels[i];
      if (item.selected) {
        String title = item.title;
        String value = item.value;
        this.customizedItems.add(CustomizedItem(title: title, value: value));
        
      }
    }
    for (var j = 0; j < 4; j++) {
      MeatPreparation item =
          Singleton().orderCarts[0].customs.meatPreparations[j];
      if (item.selected) {
        String title = item.title;
        String value = item.value;
        this.customizedItems.add(CustomizedItem(title: title, value: value));
      }
    }
    for (var k = 0; k < 5; k++) {
      SideUp item =
          Singleton().orderCarts[0].customs.sideUps[k];
      if (item.selected) {
        String title = item.title;
        String value = item.value;
        this.customizedItems.add(CustomizedItem(title: title, value: value));
      }
    }
    for (var n = 0; n < 5; n++) {
      AddOn item =
          Singleton().orderCarts[0].customs.addOns[n];
      if (item.selected) {
        String title = item.title;
        String value = item.value;
        this.customizedItems.add(CustomizedItem(title: title, value: value));
      }
    }
    return  InkWell(
          onTap: () {
            // Singleton().orderCarts[index].select =!Singleton().orderCarts[index].select;
            // appBloc.add(OrderItemSelectedEvent());
          },
          child: Container(
            height: Singleton().orderCarts[0].select ? 160 : 40,
            child: ListView(
              padding: const EdgeInsets.all(0),
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  height: Singleton().orderCarts[0].select ? 160 : 40,
                  width: width,
                  child: 
                  ListView(
                    // physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(0),
                    children: <Widget>[
                      Container(
                        height: 48,
                        width: width,
                        child: Row(
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                //Navigator.pop(context);
                              },
                              child: Container(
                                height: 24,
                                width: 24,
                                margin: const EdgeInsets.all(8),
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          5.0) //                 <--- border radius here
                                      ),
                                ),
                                child: Text(
                                  foodNumber[index].toString() ,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color.fromRGBO(255, 139, 0, 1),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(0),
                              child: Text(
                                foodOrders[index].name,
                                
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontFamily: 'Helvetica Neue'),
                              ),
                            ),
                            Spacer(
                              flex: 1,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                "\$" + (foodOrders[index].price*foodNumber[index]).toString(),                               
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          appBloc.add(ShowCustomizeEvent());
                        },
                        child: Container(
                          height: 110,
                          width: width,
                          child: ListView.builder(
                              // physics: const NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.all(0),
                              itemCount: customizedItems.length,
                              //itemCount: 4,
                              itemBuilder: (BuildContext context, int index) =>
                                  CustomizedItemList(context, index, width, customizedItems[index])),

                        ),
                      ),
                    ],
                  ),
                
                ),
                InkWell(
                  onTap: () {
                    print("Delete ordercart");                   
                  },
                  child: Container(
                    
                    height: Singleton().orderCarts[0].select ? 160 : 40,
                    width: Singleton().orderCarts[0].select ? width / 3 : 0,
                    color: Color.fromRGBO(198, 4, 4, 1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "REMOVE ITEM",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
    //return Text("data");   
  }
}

Widget CustomizedItemList(context, index, width, customizedItem) {
  return Container(
    padding: const EdgeInsets.all(0),
    width: width,
    height: 24,
    child: Row(
      children: <Widget>[
        SizedBox(
          width: 30,
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 0, 8.0, 0),
          child: Text(
            customizedItem.title,
            style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey,
                fontFamily: 'Helvetica Neue'),
          ),
        ),
        Spacer(
          flex: 1,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 0, 8.0, 0),
          child: Text(
           customizedItem.value != "0.00"? "+ \$" + customizedItem.value : ''  ,
            style: TextStyle(fontSize: 14.0),
          ),
        ),
      ],
    ),
  );
}

class CustomItem extends StatelessWidget {
  final int index;
  final bool selected;
  final String val1;
  final String val2;
  final double tipVal;
  CustomItem({this.index, this.selected, this.val1, this.val2, this.tipVal});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: index == 0
          ? new BoxDecoration(
              color: selected ? Colors.black : Colors.white,
              border: Border.all(width: 1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
            )
          : index == 3
              ? BoxDecoration(
                  color: selected ? Colors.black : Colors.white,
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                )
              : BoxDecoration(
                  color: selected ? Colors.black : Colors.white,
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    bottomLeft: Radius.circular(0),
                  ),
                ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: this.val1 == 'Other'
                ? this.val2.length < 1
                    ? EdgeInsets.fromLTRB(0.0, 27.0, 0.0, 0.0)
                    : EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0)
                : const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
            child: Text(
              this.val1,
              style: TextStyle(
                  color: selected ? Colors.white : Colors.black,
                  fontFamily: 'Helvetica Neue',
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            this.val2,
            style: TextStyle(
                color: selected ? Colors.white : Colors.black,
                fontSize: 14,
                fontFamily: 'Helvetica Neue',
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class ItemClass {
  bool selected = false;
  String val1;
  String val2;
  double tipVal;
  ItemClass({this.selected, this.val1, this.val2, this.tipVal});
}

class OrderButton extends StatelessWidget {
  // Fields in a Widget subclass are always marked "final".
  AppBloc appBloc;
  OrderButton({this.appBloc});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    int orderCartNumber = 0;
    double totalPrice = 0;
    for(var i = 0; i<foodNumber.length; i++ ){
      orderCartNumber += foodNumber[i];
      totalPrice += foodOrders[i].price*foodNumber[i];
    }
    return Container(
      height: height * 0.074,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            width: width,
            height: 50,
            child: FlatButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      height: 30,
                      width: 30,
                      // margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(
                                15.0) //                 <--- border radius here
                            ),
                      ),
                      child: Text(
                       orderCartNumber.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Helvetica Neue',
                            fontSize: 14),
                      ),
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      'PLACE ORDER-DINE IN',
                      style: TextStyle(
                        fontFamily: 'Helvetica Neue',
                        fontSize: 16.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  //Spacer(flex: 1,),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: BlocBuilder<AppBloc, AppState>(
                      condition: (previousState, state) {
                        if (state is FoodCartCount)
                          return true;
                        else
                          return false;
                      },
                      builder: (context, state) {
                        return Container(
                          width: width * 0.2,
                          child: Text(
                            "\$ " +totalPrice.toString(),
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                            textAlign: TextAlign.end,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              color: Color.fromRGBO(255, 139, 0, 1),
              textColor: Colors.white,
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
                orderCartNum = orderCartNumber;
                totalPri = totalPrice;
                // appBloc.add(
                //   DeliveryAddressEvent(),
                // );
              },
            ),
          ),
        ],
      ),
    );
  }
}
