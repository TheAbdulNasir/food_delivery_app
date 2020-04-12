import 'package:flutter/material.dart';
import '../bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import '../pages/orderNowPage.dart';

class BusinessHomePage extends StatefulWidget {
  final String businessID;
  BusinessHomePage({this.businessID});

  @override
  _BusinessHomePageState createState() => _BusinessHomePageState();
}

class _BusinessHomePageState extends State<BusinessHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => AppBloc(),
      child: _BusinessHomePage(),
    );
  }
}

class _BusinessHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppBloc appBloc = BlocProvider.of<AppBloc>(context);

    // Material is a conceptual piece of paper on which the UI appears.
    return Scaffold(
      body: BlocListener<AppBloc, AppState>(
        listener: (context, state) {
          
        },
        child: Column(
          children: <Widget>[
            BusinessHomePageAppBar(),
            BusinessHomePageState(appBloc: appBloc),
          ],
        ),
      ),
    );
  }
}

class BusinessHomePageAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.1, // in logical pixels
      padding: const EdgeInsets.only(top: 35.0),
      decoration: BoxDecoration(color: Colors.white),
      // Row is a horizontal, linear layout.
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 11),
            child: Text(
              'Business HomePage',
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
          Divider(
            height: 2,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}

class BusinessHomePageState extends StatelessWidget {
  // Fields in a Widget subclass are always marked "final".
  AppBloc appBloc;
  BusinessHomePageState({this.appBloc});
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
              appBloc.add(OrderMethodevent());
            },
            child: Container(
              color: Colors.white,
              child: ListTile(
                title: Text(
                  "Order Now",
                  style:
                      TextStyle(fontSize: 16.0, fontFamily: 'Helvetica Neue', fontWeight: FontWeight.w500),
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
