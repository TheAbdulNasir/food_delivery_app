import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'My app', // used by the OS task switcher
    home: MyScaffold(),
  ));
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
          FoodType(

          ),
          // RecentAddress(

          // ),
        ],
      ),
    );
  }
}



class MyAppBar extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height*0.11, // in logical pixels      
      padding: const EdgeInsets.only(top: 34.0, left: 0, right: 0, bottom: 0),
      decoration: new BoxDecoration(color: Colors.white),
      
      // Row is a horizontal, linear layout.
      child: Stack(        
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(left:width-90, top:10),
              
              child: Text("cancel", style: TextStyle(fontSize: 18, color: Colors.blue),),
          ),
          Container(  
                     
            height: 35,
            width: width-100,
            padding: EdgeInsets.only( top: 5),
            child: TextField(
                                
                      style: TextStyle(color: Colors.black, height: 1,),
                      
                      decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: new BorderRadius.all(new Radius.circular(20.0)),  ),
                          fillColor: Colors.grey[300],
                          filled: true,
                          
                          prefixIcon: Padding(
                              padding: EdgeInsetsDirectional.only(end: 1.0,),
                              child: Icon(Icons.search, color: Colors.black,size: 20, 
                              ),
                              
                              ),
                          
                      ),
                    ),
            
          ),         
          ],
      ) 
          //Expanded expands its child to fill the available space.
         
        
    );
  }
}

class FoodType extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     double height = MediaQuery.of(context).size.height;
    return Container(
      height: height*0.3,
      child: Column(
       crossAxisAlignment: CrossAxisAlignment.stretch, 
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 40, left: 10, bottom: 30),
            
            child:Text(
            "What's Hot Here?",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,            
            children: <Widget>[              
              FlatButton(onPressed: (){}, child: Text("Szechuan", style: TextStyle(color: Colors.white),),color: Colors.grey[600],),
              FlatButton(onPressed: (){}, child: Text("Hot Pot", style: TextStyle(color: Colors.white),),color: Colors.grey[600],),
              FlatButton(onPressed: (){}, child: Text("Boba Tea", style: TextStyle(color: Colors.white),),color: Colors.grey[600],),
              FlatButton(onPressed: (){}, child: Text("BBQ", style: TextStyle(color: Colors.white),),color: Colors.grey[600],),
            ],
          
          ),
          Row(
            mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(onPressed: (){}, child: Text("Dumplings", style: TextStyle(color: Colors.white),),color: Colors.grey[600],),
              FlatButton(onPressed: (){}, child: Text("Korean", style: TextStyle(color: Colors.white),),color: Colors.grey[600],),
              FlatButton(onPressed: (){}, child: Text("Seafood", style: TextStyle(color: Colors.white),),color: Colors.grey[600],),
              FlatButton(onPressed: (){}, child: Text("Japanese", style: TextStyle(color: Colors.white),),color: Colors.grey[600],),
            ],
          ),
        ],
      ),
    );
  }

}

