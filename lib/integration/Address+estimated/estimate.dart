import 'package:flutter/material.dart';

//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyAppBar1 extends StatelessWidget {
 
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
          IconButton(
            icon: new Image.asset('assets/icons-back-left.png'),            
            color: Colors.black,   
            onPressed: () {
             Navigator.of(context).pop();
            },              
            // padding: EdgeInsets.only(top:10.0),
          ),
          // Expanded expands its child to fill the available space.
          Expanded(
             child: Text(
               'Estimated',
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

class AddressDetail1 extends StatelessWidget { 
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
              height: height*0.35,
              padding: EdgeInsets.only(top: 25.0,),
              decoration: BoxDecoration(
              border: Border(top: BorderSide(width: 1.0, color: Colors.black12), ),
              ), 
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(
                    image: AssetImage(
                      "assets/pic_doll.png",
                    ),
                  )
                ],
              ),                                   
             // padding: EdgeInsets.only(top:10.0),
          ),
          //Expanded expands its child to fill the available space.
          Container(
              height: height*0.27,              
              child:  Column(
                children: <Widget>[
                  Container(
                    height:height*0.15,                    
                    
                    child: Column(
                      crossAxisAlignment:CrossAxisAlignment.center,
                      children: <Widget>[  
                      Text(
                                      "958 West Wrightwood Avenue 2f",
                                      style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold, ),
                                      textAlign: TextAlign.center,                                                                
                                                                      
                          ),                    
                      Column(         
                        crossAxisAlignment:CrossAxisAlignment.center,           
                            children:<Widget>[
                              Text(  
                                      " "  ,         
                                     style: TextStyle(fontSize: 10.0,),
                                ),
                               Text(              
                                      "Chicago Illinois 60616, United States",
                                      style: TextStyle(fontSize: 16.0,),
                                            textAlign: TextAlign.center,
                                ),
                                Text(                                 
                                        "                                     ",
                                        style: TextStyle(
                                          decoration: TextDecoration.underline, color: Colors.black,height:1,fontWeight: FontWeight.bold,
                                        ),
                                        
                                ),
                            ],
                         
                        ),
                      

                    ],
                   ),
                  ),
                  Container(
                    height:height*0.07,
                    padding: EdgeInsets.only(top: 5.0,),
                    child: Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: <Widget>[
                      Text(
                        "Estimated Delivery:                       15-25 minutes",
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Text(
                        "Delivery Fee:                                                  4.00",
                        style: TextStyle(fontSize: 16.0),                    
                     
                      ),
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

class Button1 extends StatelessWidget { 
  // Fields in a Widget subclass are always marked "final".

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
     double width = MediaQuery.of(context).size.width;
    return Container(
      height: height*0.285,
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
             Navigator.of(context).pop();
            },
        ),
          ),
        ],
    ),  
    );    
       
  }
}

class Estimate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece of paper on which the UI appears.
    return Material(

      // Column is a vertical, linear layout.
      child: Column(
        children: <Widget>[
          MyAppBar1(     
          
          ),
          AddressDetail1(

          ),
          Button1(

          ),
        ],
      ),
    );
  }
}

