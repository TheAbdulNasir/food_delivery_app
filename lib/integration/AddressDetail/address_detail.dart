import 'package:flutter/material.dart';

//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyAppBar extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height*0.095, // in logical pixels      
      padding: const EdgeInsets.only(top: 24.0),
      decoration: BoxDecoration(color: Colors.white),
      
      // Row is a horizontal, linear layout.y
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

  // _onClear() {
  //   setState(() {
  //     _textFieldController.text = "";
  //   });
  // }

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
                        style: TextStyle(fontSize: 12.0,),
                      ),
                      Container(
                        height: height*0.06,
                        decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(width: 1.0, color: Colors.black12), ),
                        ),
                        child:TextField(  
                          autofocus: true,                                             
                        decoration: InputDecoration(
                           hintText: 'Enter a search term',
                           border: InputBorder.none,
                           suffix: IconButton(                             
                              icon: Icon(Icons.cancel),
                              onPressed: null,
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
                        style: TextStyle(fontSize: 12.0),
                      ),
                      Container( 
                        height: height*0.06,
                        decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(width: 1.0, color: Colors.black12), ),
                        ),
                        child:TextField(  
                          // style: TextStyle(color: Color.fromRGBO(255, 139, 0, 1),), 
                          autofocus: true,                                            
                        decoration: InputDecoration(
                           hintText: 'Enter a search term',
                           border: InputBorder.none,
                           
                           suffix: IconButton(                             
                              icon: Icon(Icons.cancel),
                              onPressed: null,
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
              onPressed: (){
              print('You tapped on FlatButton');
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
  runApp(MaterialApp(
    title: 'My app', // used by the OS task switcher
    home: MyScaffold(),
  ));
}
