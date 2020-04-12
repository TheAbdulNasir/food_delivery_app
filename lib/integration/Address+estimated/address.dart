import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './estimate.dart';

//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyAppBar extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height*0.095, // in logical pixels      
      padding: const EdgeInsets.only(top: 24.0),
      decoration: BoxDecoration(color: Colors.white),
      
      // Row is a horizontal, linear layout.
      child: Row(        
        // <Widget> is the type of items in the list.
        children: <Widget>[
          ImageIcon(
            AssetImage('assets/icons-back-left.png'),                          
                          size: 40.0,
                          color: Colors.black,                 
            // padding: EdgeInsets.only(top:10.0),
          ),
          // Expanded expands its child to fill the available space.
          Expanded(
             child: Text(
               'Address Detail',
                style:TextStyle(fontSize: 20.0),
                textAlign: TextAlign.center,
             ),
              
          ),
          IconButton(
            icon: Icon(null),
            onPressed: null,
          )
        ],
      ),
    );
  }
}


class AddressDetail extends StatelessWidget { 
  // Fields in a Widget subclass are always marked "final".

  //final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
       // in logical pixels       
      decoration: BoxDecoration(color: Colors.white),
      padding: EdgeInsets.only(left: 10.0, right: 10.0,),
      // Row is a horizontal, linear layout.
      child: Column( 
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,       
        // <Widget> is the type of items in the list.
        children: <Widget>[
          Container(
              height: height*0.085,
              decoration: BoxDecoration(
              border: Border(top: BorderSide(width: 1.0, color: Colors.black12), ),
              ),                                     
             // padding: EdgeInsets.only(top:10.0),
          ),
          //Expanded expands its child to fill the available space.
          Container(
              height: height*0.17,              
              child:  Column(
                children: <Widget>[
                  Container(
                    height:height*0.085,                    
                    
                    child: Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: <Widget>[                      
                      Text(
                        "Add Street Address",
                        style: TextStyle(fontSize: 12.0, color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: height*0.06,
                        decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(width: 1.0, color: Colors.black12), ),
                        ),
                        child:TextField(  
                          autofocus: true,
                          //controller: _textController,
                           style: TextStyle(color: Color.fromRGBO(255, 139, 0, 1), ),                                     
                        decoration: InputDecoration(
                           hintText: 'Enter a search term',
                           border: InputBorder.none,
                           suffix: IconButton(                             
                              icon: Icon(Icons.cancel),
                              onPressed:(){} , //_textController.text = "";
                          ),
                                                    
                        ),
                      ), 
                      )
                       
                    ],
                   ),
                  ),
                  Container(
                    height:height*0.085,
                    
                    child: Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: <Widget>[
                      Text(
                        "Apt/Suite/Floor",
                        style: TextStyle(fontSize: 12.0, color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Container( 
                        height: height*0.06,
                        decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(width: 1.0, color: Colors.black12), ),
                        ),
                        child:TextField(  
                          // style: TextStyle(color: Color.fromRGBO(255, 139, 0, 1),), 
                          //controller: _textController,
                          autofocus: true,
                          style: TextStyle(color: Color.fromRGBO(255, 139, 0, 1), ),                                            
                        decoration: InputDecoration(
                           hintText: 'Enter a search term',
                           border: InputBorder.none,
                           
                           suffix: IconButton(                             
                              icon: Icon(Icons.cancel),
                              onPressed: (){}, //_textController.text="";
                          ),
                                                    
                        ),
                      ), 
                      )
                      
                    ],
                    ),
                  )
                ],
                
              ),   
               // padding: EdgeInsets.only(top:10.0),
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
      height: height*0.65,
    child:Stack(  
    
        children:[
          Positioned(
            bottom: 0,
            width: width,
            height: 50, 
            child: FlatButton(
              child: Text('CONTINUE',style: TextStyle(fontSize: 18.0,),),
               color: Color.fromRGBO(255, 139, 0, 1),               
               textColor: Colors.white,
              onPressed: () {
              BlocProvider.of<MyBloc>(context).add(MyEvent.eventB);
            },
        ),
          ),
        ],
    ),  
    );    
       
  }
}


class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece of paper on which the UI appears.
    return Material(
      color: Colors.white,
      // Column is a vertical, linear layout.
      child: Column(
        children: <Widget>[
          MyAppBar(     
          
          ),
          AddressDetail(

          ),
          Button(

          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    BlocProvider(
      builder: (context) => MyBloc(),
      child: MyApp(),
    ),
  );
}

enum MyEvent { eventA, eventB }

@immutable
abstract class MyState {}

class StateA extends MyState {}

class StateB extends MyState {}

class MyBloc extends Bloc<MyEvent, MyState> {
  @override
  MyState get initialState => StateA();

  @override
  Stream<MyState> mapEventToState(MyEvent event) async* {
    switch (event) {
      case MyEvent.eventA:
        yield StateA();
        break;
      case MyEvent.eventB:
        yield StateB();
        break;
    }
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
      routes: {
        '/': (context) => PageA(),
        '/pageB': (context) => PageB(),
      },
      initialRoute: '/',
    );
  }
}

class PageA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<MyBloc, MyState>(
      listener: (context, state) {
        if (state is StateB) {
          Navigator.of(context).pushNamed('/pageB');
        }
      },
      child: MyScaffold(
        
      ),
    );
  }
}

class PageB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Estimate(
      
    );
  }
}
// void main() {
//   runApp(MaterialApp(
//     title: 'My app', // used by the OS task switcher
//     home: MyScaffold(),
//   ));
// }


