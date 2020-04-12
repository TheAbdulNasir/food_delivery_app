import 'package:flutter/material.dart';


class DeliveryAddressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece of paper on which the UI appears.
    return Material(
      // Column is a vertical, linear layout.
      child: Column(
        children: <Widget>[
          MyAppBar(     
          
          ),
          DeliveryAddress(

          ),
          RecentAddress(

          ),
        ],
      ),
    );
  }
}


class MyAppBar extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height*0.1, // in logical pixels      
      padding: const EdgeInsets.only(top: 24.0),
      decoration: BoxDecoration(color: Colors.white),
      
      // Row is a horizontal, linear layout.
      child: Row(        
        // <Widget> is the type of items in the list.
        children: <Widget>[
          ImageIcon(
            AssetImage('assets/images/icons-back-left.png'),                          
                          size: 40.0,
                          color: Colors.black,                 
            // padding: EdgeInsets.only(top:10.0),
          ),
          // Expanded expands its child to fill the available space.
          Expanded(
             child: Text(
               'Switch Delivery',
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

class DeliveryAddress extends StatelessWidget { 
  // Fields in a Widget subclass are always marked "final".

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height*0.3, // in logical pixels       
      decoration: BoxDecoration(color: Colors.black12),
      
      // Row is a horizontal, linear layout.
      child: Column( 
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,       
        // <Widget> is the type of items in the list.
        children: <Widget>[
          Container(
              height: height*0.065,
              padding: EdgeInsets.only(left:10.0, top:12.0, right:10.0, bottom: 7.0,),                            
              child:  Text(
                "Delivery Address",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 20.0,),
              ),   
               // padding: EdgeInsets.only(top:10.0),
          ),
          // Expanded expands its child to fill the available space.
          Container(
              height: height*0.24-3.7, 
              decoration: BoxDecoration(color: Colors.white),
              child:  ListView(
                
                children: <Widget>[
                   
                  ListTile(
                    
                    title: Text(
                                "1130 South Michigan Ave",
                                style: TextStyle(fontSize: 18.0),
                                textAlign: TextAlign.left,                          
                                                                
                          ),
                          
                    subtitle: Text(
                                "Chicago IL 60611",
                                style: TextStyle(fontSize: 16.0, color: Colors.black45),
                                textAlign: TextAlign.left,
                          ),
                    leading: ImageIcon(                          
                          AssetImage('assets/images/icons-marker.png'),                          
                          size: 40.0,
                          color: Colors.black,                          
                        ),
                    trailing: ImageIcon(
                            AssetImage('assets/images/icons-back.png'),                          
                            size: 40.0,    
                            color: Colors.black,                         
                          ),
                  ),
                  ListTile(
                    
                    title: Text(
                                "Add New Address",
                                style: TextStyle(fontSize: 18.0),
                                textAlign: TextAlign.left,
                          ),
                    
                    leading: ImageIcon(                          
                          AssetImage('assets/images/ic_add.png'),                          
                          size: 40.0,
                          color: Colors.black,                          
                        ),
                    trailing: ImageIcon(
                            AssetImage('assets/images/icons-back.png'),                          
                            size: 40.0,    
                            color: Colors.black,                         
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

class RecentAddress extends StatelessWidget { 
  // Fields in a Widget subclass are always marked "final".

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height*0.6, // in logical pixels       
      decoration: BoxDecoration(color: Colors.black12),      
      // Row is a horizontal, linear layout.
      child: Column( 
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,       
        // <Widget> is the type of items in the list.
        children: <Widget>[
          Container(
              height: height*0.065,              
              padding: EdgeInsets.only(left:10.0,top:12.0, right:10.0, bottom: 7.0,),                            
              child:  Text(
                "Recent Address",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 20.0,),
              ),   
               // padding: EdgeInsets.only(top:10.0),
          ),
          // Expanded expands its child to fill the available space.
          Container(
              height: height*0.535, 
              decoration: BoxDecoration(color: Colors.white),
              child:  ListView(
                
                children: <Widget>[
                  _tile('500 E 33rd St', 'chicago, IL 60616', 'assets/images/icons-time-machine.png','assets/images/icons-back.png'),
                  _tile('400 E 33rd St', 'chicago, IL 60616', 'assets/images/icons-time-machine.png','assets/images/icons-back.png'),
                ],
              ),   
               // padding: EdgeInsets.only(top:10.0),
          ),
         
        ],
      ),
    );
  }
}

ListTile _tile(String title, String subtitle, String image1, String image2) => ListTile(
      title: Text(title,
         style: TextStyle(fontSize: 18.0),
         ),
      subtitle: Text(subtitle,
           style: TextStyle(fontSize: 16.0),
      ),
      leading: ImageIcon( AssetImage(image1),                          
                          size: 40.0, 
                          color: Colors.black,                         
        ),
       trailing: ImageIcon(
                            AssetImage(image2),                          
                            size: 40.0, 
                            color: Colors.black,                            
        ),
);


