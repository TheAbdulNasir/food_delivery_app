import 'package:flutter/material.dart';
import '../bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../view/order_menu.dart';
import '../model/model.dart';
import '../view/cart.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class EstimatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => AppBloc(),
      child: EstimatePageState(),
    );
  }
}
class EstimatePageState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppBloc appBloc = BlocProvider.of<AppBloc>(context);
    // Material is a conceptual piece of paper on which the UI appears.
    return Scaffold(
      body: BlocListener<AppBloc, AppState>(
        listener: (context, state) {
          if (state is OrderMenus) {
            if(cartSelected == true){
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddCartPage()),
              
            );
            cartSelected = false;
            }else{
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OrderMenu()),
            );
          }
          }
        },
         child: Column(
        children: <Widget>[
          EstimateAppBar(     
          
          ),
          EstimateDetail1(

          ),
          EstimateButton(
            appBloc:appBloc
          ),
        ],
      ),
        ),
      // Column is a vertical, linear layout.
     
    );
  }
}

class EstimateAppBar extends StatelessWidget {
 
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
               'Estimated',
                style:TextStyle(fontSize: 17.0, fontFamily: 'SF Pro Text', fontWeight: FontWeight.bold),
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

class EstimateDetail1 extends StatelessWidget { 
  
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
                      "assets/images/pic_doll.png", 
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
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold, fontFamily: 'Helvetica Neue' ),
                                      textAlign: TextAlign.center,                                                                
                                                                      
                          ),                    
                      Column(         
                        crossAxisAlignment:CrossAxisAlignment.center,           
                            children:<Widget>[
                              SizedBox(height: 10,),
                               Text(              
                                      "Chicago Illinois 60616, United States",
                                      style: TextStyle(fontSize: 16.0,fontFamily: 'Helvetica Neue'),
                                            textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 15,),
                                Row(
                                  children: <Widget>[
                                    SizedBox(width: 50,),
                                    Spacer(flex: 1,),                                    
                                    Container(
                                      width: 100,
                                      height: 3,
                                      color: Colors.black,
                                      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                                    ),
                                    Spacer(flex: 1,),
                                    SizedBox(width: 50,)
                                ],),
                                
                            ],
                         
                        ),
                      

                    ],
                   ),
                  ),
                  Container(
                    height:70,
                    padding: EdgeInsets.fromLTRB(30.0, 4.0, 30.0, 4.0),
                    child: Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            "Estimated Delivery:",
                            style: TextStyle(fontSize: 14.0, fontFamily: 'Helvetica Neue'),
                          ),
                          Spacer(flex: 1,),
                          Text("15-25 minutes", style:  TextStyle(fontSize: 14.0, fontFamily: 'Helvetica Neue'),),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                        child: Row(
                        children: <Widget>[
                          Text(
                            "Delivery Fee:",
                            style: TextStyle(fontSize: 14.0, fontFamily: 'Helvetica Neue'),             
                     
                          ),
                          Spacer(flex: 1,),
                          Text("\$4.00",style:  TextStyle(fontSize: 14.0, fontFamily: 'Helvetica Neue'), )
                        ],
                      ),
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

class EstimateButton extends StatelessWidget { 
  AppBloc appBloc;
  EstimateButton({this.appBloc});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
     double width = MediaQuery.of(context).size.width;
    return Container(
      height: height*0.285,
      color: Colors.white,
    child:Stack(  
    
        children:[
          Positioned(
            bottom: 0,
            width: width,
            height: 50, 
            child: FlatButton(
              child: Text('CONTINUE',style: TextStyle(fontSize: 16.0, fontFamily: 'Helvetica Neue'),),
               color: Color.fromRGBO(255, 139, 0, 1),               
               textColor: Colors.white,
              onPressed: () {
                appBloc.add(OrderMenuEvent());
            },
        ),
          ),
        ],
    ),  
    );    
       
  }
}



