import 'package:flutter/material.dart';
import '../bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './address_detail.dart';
import '../model/model.dart';

class DeliveryAddressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => AppBloc(),
      child: _DeliveryAddressPage(),
    );
  }
}

class _DeliveryAddressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppBloc appBloc = BlocProvider.of<AppBloc>(context);
    // Material is a conceptual piece of paper on which the UI appears.
    return Scaffold(
       resizeToAvoidBottomPadding : false,
       body: BlocListener<AppBloc, AppState>(
        listener: (context, state) {
          if(state is NewAddress){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewAddressPage()),
            );
          }
          
        },
        child: Column(
          children: <Widget>[
            DeliveryAddressAppBar(),
            DeliveryAddressState(appBloc:appBloc),
          ],
        ),
      ),
    
    );
  }
}

class DeliveryAddressAppBar extends StatelessWidget {
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
              AssetImage('assets/images/icon_back.png'),
              size: 24.0,
              color: Colors.black,
              // padding: EdgeInsets.only(top:10.0),
            ),
          ),
          // Expanded expands its child to fill the available space.
          Expanded(
            child: Text(
              'Switch Delivery',
              style: TextStyle(fontSize: 17.0, fontFamily: 'SF Pro Text', fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 40,
          ),
        ],
      ),
    );
  }
}

class DeliveryAddressState extends StatelessWidget {
  // Fields in a Widget subclass are always marked "final".
  AppBloc appBloc;
  DeliveryAddressState({this.appBloc});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.9, // in logical pixels
      color: Colors.white,

      // Row is a horizontal, linear layout.
      child: ListView(
        padding: const EdgeInsets.all(0),
        // <Widget> is the type of items in the list.
        children: <Widget>[
          Container(
            height: height * 0.065,
            color: Color.fromRGBO(241, 242, 244, 1),
            padding: EdgeInsets.only(
              left: 10.0,
              top: 12.0,
              right: 10.0,
              bottom: 0,
            ),
            child: Text(
              "Delivery Address",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 70, top:10),
            child: Text("Current Location", style: TextStyle(fontFamily: 'Helvetica Neue'),),
          ),
          InkWell(
            onTap: () {
              currentLocationSelected = true;
              appBloc.add(NewAddressEvent());
              
            },
            child: ListTile(
              title: Text(
                "1130 South Michigan Ave",
                style: TextStyle(fontSize: 18.0,fontFamily: 'Helvetica Neue'),
                textAlign: TextAlign.left,
              ),
              subtitle: Text(
                "Chicago IL 60611",
                style: TextStyle(fontSize: 16.0, color: Colors.black45, fontFamily: 'Helvetica Neue'),
                textAlign: TextAlign.left,
              ),
              leading: ImageIcon(
                AssetImage('assets/images/icons-marker.png'),
                size: 24.0,
                color: Colors.black,
              ),
              trailing: ImageIcon(
                AssetImage('assets/images/icons-back.png'),
                size: 24.0,
                color: Colors.black,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              //print("defe");
              appBloc.add(NewAddressEvent(),);
            },
            child: ListTile(
              title: Text(
                "Add New Address",
                style: TextStyle(fontSize: 18.0),
                textAlign: TextAlign.left,
              ),
              leading: ImageIcon(
                AssetImage('assets/images/ic_add.png'),
                size: 24.0,
                color: Colors.black,
              ),
              trailing: ImageIcon(
                AssetImage('assets/images/icons-back.png'),
                size: 24.0,
                color: Colors.black,
              ),
            ),
          ),

          Container(
            height: height * 0.065,
            color: Color.fromRGBO(241, 242, 244, 1),
            padding: EdgeInsets.only(
              left: 10.0,
              top: 12.0,
              right: 10.0,
              bottom: 0.0,
            ),
            child: Text(
              "Recent Address",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            // padding: EdgeInsets.only(top:10.0),
          ),
          // Expanded expands its child to fill the available space.
          Container(
            height: 80,            
            child: ListView(
              padding: const EdgeInsets.all(0),
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  width:width,
                  height: 80,
                  padding: const EdgeInsets.all(0),
                  child: _tile(
                    '500 E 33rd St',
                    'chicago, IL 60616',
                    'assets/images/icons-time-machine.png',
                    'assets/images/icons-back.png'),
                ),
                Container(
                  width: width/3,
                  height: height,
                  color: Color.fromRGBO(198, 4, 4, 1),
                  child:Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "REMOVE",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                ),
              ],
            ),
            // padding: EdgeInsets.only(top:10.0),
          ),

          Container(
            height: 80,            
            child: ListView(
              padding: const EdgeInsets.all(0),
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  width:width,
                  height: 80,
                  padding: const EdgeInsets.all(0),
                  child: _tile(
                    '400 E 33rd St',
                    'chicago, IL 60616',
                    'assets/images/icons-time-machine.png',
                    'assets/images/icons-back.png'),
                ),
                Container(
                  width: width/3,
                  height: height,
                  color: Color.fromRGBO(198, 4, 4, 1),
                  child:Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "REMOVE",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                ),
              ],
            ),
            // padding: EdgeInsets.only(top:10.0),
          ),
       
        ],
      ),
    );
  }
}

  

ListTile _tile(String title, String subtitle, String image1, String image2) =>
    ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 18.0),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 16.0),
      ),
      leading: ImageIcon(
        AssetImage(image1),
        size: 24.0,
        color: Colors.black,
      ),
      trailing: ImageIcon(
        AssetImage(image2),
        size: 24.0,
        color: Colors.black,
      ),
    );
