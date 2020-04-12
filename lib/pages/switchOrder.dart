import 'package:flutter/material.dart';
import '../bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../view/order_menu.dart';
import './switch_to_delivery.dart';
import '../view/cart.dart';
import '../model/model.dart';

class SwitchOrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => AppBloc(),
      child: _SwitchOrderPage(),
    );
  }
}

class _SwitchOrderPage extends StatelessWidget {
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

          if(state is DeliveryAddress){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DeliveryAddressPage()),
            );
          }
        },
        child: Column(
          children: <Widget>[
            SwitchOrderPageAppBar(),
            Container(
              height: 1,
              color: Colors.black,
            ),
            SwitchOrderPageState(appBloc: appBloc),
          ],
        ),
      ),
    );
  }
}

class SwitchOrderPageAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.1-1, // in logical pixels
      padding: const EdgeInsets.only(top: 24.0),
      decoration: BoxDecoration(color: Colors.white),
      // Row is a horizontal, linear layout.
       child: Row(
        // <Widget> is the type of items in the list.
        children: <Widget>[
          SizedBox(
            width: 40,
          ),
         
          // Expanded expands its child to fill the available space.
          Expanded(
            child: Text(
              'Switch Order',
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

class SwitchOrderPageState extends StatelessWidget {
  // Fields in a Widget subclass are always marked "final".
  AppBloc appBloc;
  SwitchOrderPageState({this.appBloc});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Container(
      height: height * 0.9, // in logical pixels
      color: Color.fromRGBO(241, 242, 244, 1),
      padding: const EdgeInsets.only(top: 105),
      // Row is a horizontal, linear layout.
      child: ListView(
        padding: const EdgeInsets.all(0),
        // <Widget> is the type of items in the list.
        children: <Widget>[
          InkWell(
            onTap: () {
              orderMethods[0].selected = true;
              orderMethods[1].selected = false;
              orderMethods[2].selected = false;
              appBloc.add(OrderMenuEvent());
            },
            child: Container(
              color: Colors.white,
              child: ListTile(
                title: Text(
                  "Dine In",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Helvetica Neue',
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.left,
                ),
                trailing: ImageIcon(
                  AssetImage('assets/images/icons-back.png'),
                  size: 16.0,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          InkWell(
            onTap: () {
              orderMethods[0].selected = false;
              orderMethods[1].selected = true;
              orderMethods[2].selected = false;
              appBloc.add(OrderMenuEvent());
            },
            child: Container(
              color: Colors.white,
              child: ListTile(
                title: Text(
                  "Pick Up",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Helvetica Neue',
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.left,
                ),
                trailing: ImageIcon(
                  AssetImage('assets/images/icons-back.png'),
                  size: 16.0,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          InkWell(
            onTap: () {
              orderMethods[0].selected = false;
              orderMethods[1].selected = false;
              orderMethods[2].selected = true;
              appBloc.add(DeliveryAddressEvent());
            },
            child: Container(
              color: Colors.white,
              child: ListTile(
                title: Text(
                  "Delivery",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Helvetica Neue',
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.left,
                ),
                trailing: ImageIcon(
                  AssetImage('assets/images/icons-back.png'),
                  size: 16.0,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
