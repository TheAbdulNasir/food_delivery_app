import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bloc.dart';
import '../view/customize.dart';
import './cart.dart';
import '../model/model.dart';



class FoodPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => AppBloc(),
      child: Food(),
    );
  }
}

class Food extends StatelessWidget {
  static BuildContext get context => null;
  @override
  Widget build(BuildContext context) {
    final AppBloc appBloc = BlocProvider.of<AppBloc>(context);
    // Material is a conceptual piece of paper on which the UI appears.
    return Scaffold(
      body: BlocListener<AppBloc, AppState>(
        listener: (context, state) {
          if (state is ShowCustomize) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CustomizePage()),
            );
          }
          if (state is AddCart) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddCartPage()),
            );
          }
        },
        child: Column(
          children: <Widget>[
            FoodDetail(
              appBloc: appBloc,
            ),
            AddCartButton(
              appBloc: appBloc,
            ),
          ],
        ),
      ),
    );
  }
}

class FoodDetail extends StatelessWidget {
  // Fields in a Widget subclass are always marked "final".
  AppBloc appBloc;
  FoodDetail({this.appBloc});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final availableWidth = MediaQuery.of(context).size.width - 160;
    return Theme(
      data: new ThemeData(
        primaryColor: Colors.white,
      ),
      child: Container(
        height: height * 0.925, // in logical pixels
        padding: const EdgeInsets.all(0),
        color: Colors.white,

        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              leading: FlatButton(
                child: Image.asset(
                  "assets/images/icons-delete.png",
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              expandedHeight: 358.0,
              flexibleSpace: FlexibleSpaceBar(
                title: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: availableWidth,
                  ),
                  child: Text(
                    foodOrder.name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
                //   Text(
                // foodOrder.name,
                // overflow: TextOverflow.ellipsis,
                // style: TextStyle(fontSize: 18, color: Colors.black),
                // ),
                background: Column(
                  children: <Widget>[
                    Container(
                      width: width,
                      height: 322,
                      child: Stack(
                        children: <Widget>[
                          Carousel(
                            autoplay: false,
                            images: [
                              NetworkImage(
                                foodOrder.image == ""
                                    ? defaultImageUrl
                                    : foodOrder.image,
                              ),
                              NetworkImage(
                                foodOrder.image == ""
                                    ? defaultImageUrl
                                    : foodOrder.image,
                              ),
                              NetworkImage(
                                foodOrder.image == ""
                                    ? defaultImageUrl
                                    : foodOrder.image,
                              ),
                              NetworkImage(
                                foodOrder.image == ""
                                    ? defaultImageUrl
                                    : foodOrder.image,
                              ),
                            ],
                            dotSize: 4.0,
                            dotSpacing: 15.0,
                            dotColor: Colors.white,
                            indicatorBgPadding: 15.0,
                            dotBgColor: Colors.transparent,
                          ),
                          Positioned(
                            top: 282,
                            child: Container(
                              width: width,
                              height: 40,
                              // Add box decoration
                              decoration: BoxDecoration(
                                // Box decoration takes a gradient
                                gradient: LinearGradient(
                                  // Where the linear gradient begins and ends
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  // Add one stop for each color. Stops should increase from 0 to 1
                                  stops: [0, 1],
                                  colors: [
                                    // Colors are easy thanks to Flutter's Colors class.
                                    Color(0x00FFFFFF),
                                    Color(0xFFFFFFFF),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: width,
                      height: 60,
                      color: Colors.white,
                    ),
                  ],
                ),
                centerTitle: true,
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 10.0),
                      child: Text(
                        "A food with a sharp taste. Often used to refer to tart or sour foods as well",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Helvetica Neue',
                            color: Color.fromRGBO(172, 172, 172, 1)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15, bottom: 5),
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Text(
                              'Quantity',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Helvetica Neue',
                                  fontWeight: FontWeight.bold),
                            ),
                            margin: EdgeInsets.only(bottom: 5),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 55,
                                height: 55,
                                child: IconButton(
                                  icon: ImageIcon(
                                    AssetImage('assets/images/icons-minus.png'),
                                    size: 32,
                                  ),
                                  onPressed: () {
                                    if (cartNum == 1) return;
                                    cartNum--;
                                    BlocProvider.of<AppBloc>(context)
                                        .add(FoodCartCountEvent(cartNum));
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: BlocBuilder<AppBloc, AppState>(
                                  condition: (previousState, state) {
                                    if (state is FoodCartCount)
                                      return true;
                                    else
                                      return false;
                                  },
                                  builder: (context, state) {
                                    return Container(
                                      margin:
                                          EdgeInsets.only(left: 8, right: 8),
                                      child: Text(
                                        cartNum.toString(),
                                        style: TextStyle(
                                            fontSize: 26.0,
                                            fontFamily: 'Helvetica Neue',
                                            fontWeight: FontWeight.bold),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Container(
                                width: 55,
                                height: 55,
                                child: IconButton(
                                  icon: ImageIcon(
                                    AssetImage('assets/images/icons-add.png'),
                                    size: 32,
                                  ),
                                  onPressed: () {
                                    cartNum++;
                                    BlocProvider.of<AppBloc>(context)
                                        .add(FoodCartCountEvent(cartNum));
                                  },
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14),
                      child: InkWell(
                        onTap: () {
                          appBloc.add(
                            ShowCustomizeEvent(),
                          );
                        },
                        child: Text(
                          'Customize',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Helvetica Neue',
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(30, 110, 246, 1),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: Container(
                        height: 10,
                        color: Colors.grey[300],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: ListTile(
                        title: Text(
                          "Description",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Helvetica Neue'),
                        ),
                        subtitle: Text(
                          "One of the best ways to describe food on your menu is by indicating how it was prepared. So long as your customer recognizes the words you choose, it will give them a clear picture of your food’s flavor and appearance.",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Helvetica Neue',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: ListTile(
                        title: Text(
                          "Ingredients",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Helvetica Neue'),
                        ),
                        subtitle: Text(
                          "One of the best ways to describe food on your menu is by indicating how it was prepared. So long as your customer recognizes the words you choose, it will give them a clear picture of your food’s flavor and appearance.",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Helvetica Neue',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: ListTile(
                        title: Text(
                          "Allergens",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Helvetica Neue'),
                        ),
                        subtitle: Text(
                          "One of the best ways to describe food on your menu is by indicating how it was prepared. So long as your customer recognizes the words you choose, it will give them a clear picture of your food’s flavor and appearance.",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Helvetica Neue',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 190,
                    )
                ]
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class AddCartButton extends StatelessWidget {
  // Fields in a Widget subclass are always marked "final".
  AppBloc appBloc;
  AddCartButton({this.appBloc});
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
            child: BlocBuilder<AppBloc, AppState>(
                condition: (previousState, state) {
              if (state is FoodCartCount)
                return true;
              else
                return false;
            }, builder: (context, state) {
              return FlatButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: 100,
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Container(
                      child: Text(
                        'ADD  ' + cartNum.toString() + '  TO CART',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Container(
                      width: 100,
                      child: BlocBuilder<AppBloc, AppState>(
                        condition: (previousState, state) {
                          if (state is FoodCartCount)
                            return true;
                          else
                            return false;
                        },
                        builder: (context, state) {
                          return Container(
                            width: width * 0.2,
                            child: Text(
                              "\$" +
                                  (foodOrder.price * cartNum)
                                      .toStringAsFixed(2),
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                              textAlign: TextAlign.end,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                color: Color.fromRGBO(255, 139, 0, 1),
                textColor: Colors.white,
                onPressed: () {                 
                  foodOrders.add(foodOrder);
                  foodNumber.add(cartNum);
                  print(foodOrders.length);
                  appBloc.add(
                    AddCartEvent(),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
