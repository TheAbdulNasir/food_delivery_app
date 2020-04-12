import 'package:flutter/material.dart';
import '../model/model.dart';
import '../bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './estimate.dart';

TextEditingController _textEditingController1;
TextEditingController _textEditingController2;
TextEditingController _textEditingController3;
TextEditingController _textEditingController4;

class NewAddressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => AppBloc(),
      child: NewAddressState(),
    );
  }
}

class NewAddressState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppBloc appBloc = BlocProvider.of<AppBloc>(context);

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: BlocListener<AppBloc, AppState>(
        listener: (context, state) {
          if (state is Estimate) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EstimatePage()),
            );
          }
        },
        child: Column(
          children: <Widget>[
            NewAddressAppBar(),
            NewAddressDetail(),
            AddNewAddressButton(appBloc: appBloc),
          ],
        ),
      ),
    );
  }
}

class NewAddressAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.1, // in logical pixels
      padding: const EdgeInsets.only(top: 24.0),
      decoration: BoxDecoration(color: Colors.white),

      // Row is a horizontal, linear layout.y
      child: Row(
        // <Widget> is the type of items in the list.
        children: <Widget>[
          SizedBox(
            width: 16,
          ),
          InkWell(
            onTap: () {
              currentLocationSelected = false;
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
              'Address Detail',
              style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'SF Pro Text',
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: 40.0,
            child: IconButton(
              icon: Icon(null),
              onPressed: null,
            ),
          )
        ],
      ),
    );
  }
}

class NewAddressDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _textEditingController1 = TextEditingController(text: address1);
    _textEditingController2 = TextEditingController(text: address2);    
    double height = MediaQuery.of(context).size.height;
    return Container(
      // in logical pixels

      padding: EdgeInsets.only(
        left: 10.0,
        right: 10.0,
      ),
      height: height * 0.825,
      // Row is a horizontal, linear layout.
      child: ListView(
        padding: const EdgeInsets.all(0),
        // <Widget> is the type of items in the list.
        children: <Widget>[
          Container(
            height: height * 0.085,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 1.0, color: Colors.black12),
              ),
            ),
            // padding: EdgeInsets.only(top:10.0),
          ),
          Container(
            height: 160,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 70,
                  padding: const EdgeInsets.all(8),
                  child: Theme(
                    data: new ThemeData(
                      primaryColor: Color.fromRGBO(255, 139, 0, 1),
                    ),
                    child: currentLocationSelected
                        ? TextFormField(
                            controller: _textEditingController1,
                            style: TextStyle(
                                color: Color.fromRGBO(255, 139, 0, 1),
                                fontFamily: 'Helvetica Neue',
                                fontSize: 18,
                                height: 1),
                            decoration: InputDecoration(
                              //border: InputBorder.none,
                              contentPadding: EdgeInsets.all(1.0),
                              labelText: "Add Street Address",
                              labelStyle: TextStyle(
                                color: Colors.grey,
                              ),

                              suffix: IconButton(
                                icon: Icon(Icons.cancel),
                                onPressed: null,
                              ),
                            ),
                          )
                        : TextFormField(
                           controller: _textEditingController3,
                            style: TextStyle(
                                color: Color.fromRGBO(255, 139, 0, 1),
                                fontFamily: 'Helvetica Neue',
                                fontSize: 18,
                                height: 1),
                            decoration: InputDecoration(
                              //border: InputBorder.none,
                              contentPadding: EdgeInsets.all(1.0),
                              labelText: "Add Street Address",
                              labelStyle: TextStyle(
                                color: Colors.grey,
                              ),

                              suffix: IconButton(
                                icon: Icon(Icons.cancel),
                                onPressed: null,
                              ),
                            ),
                          ),
                  ),
                ),
                Container(
                  height: 70,
                  padding: const EdgeInsets.all(8),
                  child: Theme(
                    data: new ThemeData(
                      primaryColor: Color.fromRGBO(255, 139, 0, 1),
                    ),
                    child: currentLocationSelected ? TextFormField(
                      controller: _textEditingController2,
                      style: TextStyle(
                          color: Color.fromRGBO(255, 139, 0, 1),
                          fontFamily: 'Helvetica Neue',
                          fontSize: 18,
                          height: 1),
                      decoration: InputDecoration(
                        //border: InputBorder.none,
                        contentPadding: EdgeInsets.all(1.0),
                        labelText: "Apt/Suite/Floor",
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        ),

                        suffix: IconButton(
                          icon: Icon(Icons.cancel),
                          onPressed: null,
                        ),
                      ),
                    ) 
                    :TextFormField( 
                      controller: _textEditingController4,                     
                      style: TextStyle(
                          color: Color.fromRGBO(255, 139, 0, 1),
                          fontFamily: 'Helvetica Neue',
                          fontSize: 18,
                          height: 1),
                      decoration: InputDecoration(
                        //border: InputBorder.none,
                        contentPadding: EdgeInsets.all(1.0),
                        labelText: "Apt/Suite/Floor",
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        ),

                        suffix: IconButton(
                          icon: Icon(Icons.cancel),
                          onPressed: null,
                        ),
                      ),
                    ),
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

class AddNewAddressButton extends StatelessWidget {
  // Fields in a Widget subclass are always marked "final".
  AppBloc appBloc;
  AddNewAddressButton({this.appBloc});
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
            height: 50,
            child: FlatButton(
              child: Text(
                'CONTINUE',
                style: TextStyle(
                  fontSize: 17.0,
                  fontFamily: 'Helvetica Neue',
                ),
              ),
              color: Color.fromRGBO(255, 139, 0, 1),
              textColor: Colors.white,
              onPressed: () {
                print('You tapped on FlatButton');
                appBloc.add(
                  EstimateEvent(),
                 
                );
                 if(currentLocationSelected == true){
                    
                  }
              },
            ),
          ),
        ],
      ),
    );
  }
}
