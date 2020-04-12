import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:algolia/algolia.dart';
import '../bloc/bloc.dart';
import '../pages/drawer_wedget.dart';
import './food.dart';
import '../pages/search_page.dart';
import '../pages/switchOrder.dart';
import './cart.dart';
import '../model/model.dart';
import '../model/item.dart';

class OrderMenu extends StatefulWidget {
  final String businessID;
  OrderMenu({this.businessID});

  @override
  OrderMenuState createState() {
    return new OrderMenuState();
  }
}

class OrderMenuState extends State<OrderMenu> {
  GlobalKey<ScaffoldState> _dKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double ratio = (width - 8 * 3) / (width - 8 * 3 + 158);
    return BlocProvider(
      builder: (context) => AppBloc(),
      child: OrderMenuWidget(ratio: ratio, dKey: _dKey, context: context),
    );
  }
}

class OrderMenuWidget extends StatefulWidget {
  final double ratio;
  final GlobalKey<ScaffoldState> dKey;
  BuildContext context;

  OrderMenuWidget({this.ratio, this.dKey, this.context});

  @override
  _OrderMenuWidgetState createState() => _OrderMenuWidgetState();
}

class _OrderMenuWidgetState extends State<OrderMenuWidget> {
  int foodNumber = 15;
  List<Item> _items;
  Algolia algolia;

  void _incrementCounter() async {
    final items = await filterItem();
    setState(() {
      _items.clear();
      _items.addAll(items);
      foodNumber = _items.length;
    });
  }

  @override
  void initState() {
    super.initState();
    _items = [];
    algolia = Algolia.init(
        applicationId: 'O9HDK5T143',
        apiKey: '1d30ddb4f1a398e27ed92327682630fe');
    _incrementCounter();
  }

  Future<List<Item>> filterItem() async {
    // Demo: how to filter items which has MILK in Ingredients
    // String text1 = 'Ingredients:';
    // String filter = text1 + hintText;
    //final String filter = 'Ingredients:PORK';
    final String index = 'test_items';
    AlgoliaQuery query = algolia.instance.index(index).search('');
    //query = query.setFilters(filter);
    query = query.setPage(3);
    query = query.setHitsPerPage(30);
    try {
      final response = await query.getObjects();
      return response.hits.map((hit) {
        // print each response data
        print(hit.data.toString());
        // parse to item object
        return Item.fromJson(hit.data);
      }).toList();
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<bool> _onBackPressed() {
    return showDialog(
        context: widget.context,
        builder: (BuildContext context) => CupertinoAlertDialog(
              title: Text("CONFIRM TO LEAVE"),
              content: Text(
                "By pressing 'Confirm' you will leave this order page and cart will be cleaned.",
                style: TextStyle(height: 1.5, wordSpacing: 1.5),
              ),
              actions: <Widget>[
                CupertinoDialogAction(
                  isDefaultAction: true,
                  child: Text("Cancel"),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
                CupertinoDialogAction(
                  isDefaultAction: true,
                  child: Text(
                    "Confirm",
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    final AppBloc appBloc = BlocProvider.of<AppBloc>(context);
    return BlocBuilder<AppBloc, AppState>(
      condition: (previousState, state) {
        if (state is ItemCountLimit)
          return true;
        else
          return false;
      },
      builder: (context, state) {
        return WillPopScope(
          onWillPop: _onBackPressed,
          child: Scaffold(
            
            key: widget.dKey,            
            endDrawer: DrawerWidget(
              appBloc: appBloc,
            ),
            drawerEdgeDragWidth:0.0, // MediaQuery.of(context).size.width * 0.8,
            drawerDragStartBehavior: DragStartBehavior.down,
            body: BlocListener<AppBloc, AppState>(
              listener: (context, state) {
                if (state is OrderMethod) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SwitchOrderPage()),
                  );
                }
                if (state is ShowSearch) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchPage()),
                  );
                }
                if (state is ShowDrawer) {
                  widget.dKey.currentState.openEndDrawer();
                  // appBloc.add(SelectGridIngredientSettingEvent());
                }
                if (state is CloseDrawer) {
                  Navigator.pop(context);
                }
                if (state is ResetDrawer) {
                  return true;
                }
                if (state is ShowFood) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FoodPage()),
                  );
                }
                if (state is AddCart) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddCartPage()),
                  );
                }
              },
              child: SafeArea(
                
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    NavWidget(
                      appBloc: appBloc,
                    ),
                    ButtonAppBar(appBloc: appBloc),
                    Expanded(
                      child: foodNumber < 20
                          ? FoodMenu_Style2(appBloc: appBloc, items: _items)
                          : FoodMenu_Style1(
                              ratio: widget.ratio,
                              appBloc: appBloc,
                              items: _items),
                      //FoodMenu_Style1(ratio:ratio,appBloc:appBloc),
                    ),
                    OrderCartViewButton(
                      appBloc: appBloc,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class FoodMenu_Style1 extends StatelessWidget {
  AppBloc appBloc;
  final double ratio;
  List<Item> items;
  FoodMenu_Style1({this.ratio, this.appBloc, this.items});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28,
      width: MediaQuery.of(context).size.width,
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: new PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: new Container(
              color: Colors.white,
              child: new Container(
                child: Column(
                  children: <Widget>[
                    new TabBar(
                      isScrollable: true,
                      unselectedLabelColor: Colors.grey,
                      labelColor: Color(0xFFFF8B00),
                      indicatorColor: Color(0xFFFF8B00),
                      indicatorWeight: 4.0,
                      indicatorSize: TabBarIndicatorSize.tab,
                      tabs: [
                        Tab(
                            child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
                          child: Text(
                            'TOP 20 Picks',
                            style: TextStyle(
                                fontSize: 14.0, fontFamily: 'Helvetica Neue'),
                          ),
                        )),
                        Tab(
                            child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
                          child: Text(
                            'Classic',
                            style: TextStyle(
                                fontSize: 14.0, fontFamily: 'Helvetica Neue'),
                          ),
                        )),
                        Tab(
                            child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
                          child: Text(
                            'Dim Sum',
                            style: TextStyle(
                                fontSize: 14.0, fontFamily: 'Helvetica Neue'),
                          ),
                        )),
                        Tab(
                            child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
                          child: Text(
                            'Chef Specials',
                            style: TextStyle(
                                fontSize: 14.0, fontFamily: 'Helvetica Neue'),
                          ),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TabBarView(
              children: [
                new GridItemWidget(
                    ratio: ratio, appBloc: appBloc, items: items),
                new GridItemWidget(
                    ratio: ratio, appBloc: appBloc, items: items),
                new GridItemWidget(
                    ratio: ratio, appBloc: appBloc, items: items),
                new GridItemWidget(
                    ratio: ratio, appBloc: appBloc, items: items),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FoodMenu_Style2 extends StatelessWidget {
  AppBloc appBloc;
  List<Item> items;
  FoodMenu_Style2({this.appBloc, this.items});

  @override
  Widget build(BuildContext context) {
    print(items);
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: 625,
      width: width,
      padding: const EdgeInsets.all(0),
      child: CustomScrollView(
        slivers: <Widget>[
          renderTitle('Top 20 picks'),
          SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: SliverGrid.count(
              crossAxisCount: 2,
              childAspectRatio: 0.72,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              children: List.generate(items.length, (index) {
                Item item = items[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        appBloc.add(ShowFoodEvent());
                      },
                      child: Container(
                        padding: const EdgeInsets.all(0),
                        width: 175,
                        height: 175,
                        child: Image.network(
                          item.image == "" ? defaultImageUrl : item.image,
                          fit: BoxFit.cover,
                          height: double.infinity,
                          width: double.infinity,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
                      child: Text(
                        item.name,
                        style: TextStyle(
                            fontSize: 14.0, fontFamily: 'Helvetica Neue'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 4.0),
                      child: Text(
                        '\$' + item.price.toString(),
                        style: TextStyle(
                            fontSize: 16.0, fontFamily: 'Helvetica Neue'),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
          renderTitle('Classic'),
          SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: SliverGrid.count(
              crossAxisCount: 2,
              childAspectRatio: 0.72,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              children: List.generate(items.length, (index) {
                Item item = items[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        appBloc.add(ShowFoodEvent());
                      },
                      child: Container(
                        padding: const EdgeInsets.all(0),
                        width: 175,
                        height: 175,
                        child: Image.network(
                          item.image == "" ? defaultImageUrl : item.image,
                          fit: BoxFit.cover,
                          height: double.infinity,
                          width: double.infinity,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
                      child: Text(
                        item.name,
                        style: TextStyle(
                            fontSize: 14.0, fontFamily: 'Helvetica Neue'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 4.0),
                      child: Text(
                        '\$' + item.price.toString(),
                        style: TextStyle(
                            fontSize: 16.0, fontFamily: 'Helvetica Neue'),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
          renderTitle('Dim Sum'),
          SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: SliverGrid.count(
              crossAxisCount: 2,
              childAspectRatio: 0.72,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              children: List.generate(items.length, (index) {
                Item item = items[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        appBloc.add(ShowFoodEvent());
                      },
                      child: Container(
                        padding: const EdgeInsets.all(0),
                        width: 175,
                        height: 175,
                        child: Image.network(
                          item.image == "" ? defaultImageUrl : item.image,
                          fit: BoxFit.cover,
                          height: double.infinity,
                          width: double.infinity,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
                      child: Text(
                        item.name,
                        style: TextStyle(
                            fontSize: 14.0, fontFamily: 'Helvetica Neue'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 4.0),
                      child: Text(
                        '\$' + item.price.toString(),
                        style: TextStyle(
                            fontSize: 16.0, fontFamily: 'Helvetica Neue'),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
          renderTitle('Chef Special'),
          SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: SliverGrid.count(
              crossAxisCount: 2,
              childAspectRatio: 0.72,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              children: List.generate(items.length, (index) {
                Item item = items[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        appBloc.add(ShowFoodEvent());
                      },
                      child: Container(
                        padding: const EdgeInsets.all(0),
                        width: 175,
                        height: 175,
                        child: Image.network(
                          item.image == "" ? defaultImageUrl : item.image,
                          fit: BoxFit.cover,
                          height: double.infinity,
                          width: double.infinity,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
                      child: Text(
                        item.name,
                        style: TextStyle(
                            fontSize: 14.0, fontFamily: 'Helvetica Neue'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 4.0),
                      child: Text(
                        '\$' + item.price.toString(),
                        style: TextStyle(
                            fontSize: 16.0, fontFamily: 'Helvetica Neue'),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

Widget renderTitle(String title) {
  return SliverToBoxAdapter(
    child: Container(
      color: Color.fromRGBO(230, 230, 230, 1),
      padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
      height: 60,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(
                width: 16,
              ),
              Text(
                title,
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'SF Pro Text',
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Spacer(
            flex: 1,
          ),
          Container(
            height: 8,
            color: Colors.white,
          ),
        ],
      ),
    ),
  );
}

class CustomItemButton extends StatelessWidget {
  final int index;
  final String text;
  CustomItemButton({this.index, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0, 10.0),
      child: Container(
        decoration: new BoxDecoration(
          color: Color.fromRGBO(255, 139, 0, 1),
          borderRadius: new BorderRadius.all(Radius.circular(15.0)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 15,
            ),
            Text(
              this.text,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(
              width: 8,
            ),
            Image.asset(
              "assets/images/icons-delete-filled_white.png",
              width: 16,
              height: 16,
            ),
            SizedBox(
              width: 15,
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonAppBar extends StatelessWidget {
  AppBloc appBloc;
  ButtonAppBar({this.appBloc});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return _Container(appBloc: appBloc);
      },
    );
    //_Container();
  }
}

class _Container extends StatelessWidget {
  final int count = 29;
  AppBloc appBloc;
  List<int> itemSelecteds;
  _Container({this.appBloc});
  @override
  Widget build(BuildContext context) {
    this.itemSelecteds = [];
    for (var i = 0; i < count; i++) {
      Setting item = Singleton().settings[i];
      if (item.selected) {
        this.itemSelecteds.add(i);
      }
    }
    if (itemSelecteds.length == 0) {
      confirmSelected = false;
    }
    return Visibility(
      child: Container(
        height: 50,
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(0),
          children: List.generate(
            itemSelecteds.length,
            (index) {
              return InkWell(
                onTap: () {
                  Singleton().settings[itemSelecteds[index]].selected = false;
                  itemSelecteds.removeAt(index);
                  appBloc.add(ItemRemoveGredientEvent());
                },
                child: CustomItemButton(
                  index: index,
                  text:
                      'No ' + Singleton().settings[itemSelecteds[index]].title,
                ),
              );
            },
          ),
        ),
      ),
      visible: this.itemSelecteds.length != 0 && confirmSelected ? true : false,
    );
  }
}

class GridItemWidget extends StatelessWidget {
  double ratio;
  AppBloc appBloc;
  List<Item> items;
  GridItemWidget({this.ratio, this.appBloc, this.items});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: ratio,
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
      children: List.generate(items.length, (index) {
        Item item = items[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            InkWell(
              onTap: () {     
                foodOrder = item;           
                appBloc.add(ShowFoodEvent());
              },
              child: Container(
                padding: const EdgeInsets.all(0),
                width: 175,
                height: 175,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  color: Colors.transparent,
                ),
                child: Image.network(
                  item.image == "" ? defaultImageUrl : item.image,
                 
                  height: double.infinity,
                  width: double.infinity,
                  alignment: Alignment.center,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
              child: Container(
                padding: const EdgeInsets.all(0),
                height: 36,
                child: Text(
                  item.name,
                  style:
                      TextStyle(fontSize: 14.0, fontFamily: 'Helvetica Neue'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 4.0),
              child: Text(
                '\$' + item.price.toString(),
                style: TextStyle(fontSize: 16.0, fontFamily: 'Helvetica Neue'),
              ),
            ),
          ],
        );
      }),
    );
  }
}

class NavWidget extends StatelessWidget {
  AppBloc appBloc;
  NavWidget({this.appBloc});
  List<String> selectedOrder;
  @override
  Widget build(BuildContext context) {
    this.selectedOrder = [];
    for (var i = 0; i < 3; i++) {
      Order item = orderMethods[i];
      if (item.selected) {
        this.selectedOrder.add(orderMethods[i].order);
      }
    }
    return Container(
      height: 40,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(
                width: 16.0,
              ),
              Material(
                  child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Image.asset('assets/images/icon_back.png',
                    width: 20.0, height: 20.0),
              )),
              SizedBox(
                width: 36.0,
              ),
            ],
          ),
          InkWell(
            onTap: () {
              appBloc.add(OrderMethodevent());
            },
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    selectedOrder[0],
                    style: TextStyle(
                        fontSize: 17.0,
                        fontFamily: 'SF Pro Text',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Material(
                  child: Image.asset(
                      'assets/images/scroll_triangle_down_dark.png',
                      width: 7.0,
                      height: 14.0),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Row(
              children: <Widget>[
                Material(
                    child: InkWell(
                  onTap: () {
                    appBloc.add(SearchEvent());
                  },
                  child: Image.asset('assets/images/icon_search.png',
                      width: 24, height: 24),
                )),
                SizedBox(
                  width: 8.0,
                ),
                Material(
                    child: InkWell(
                  onTap: () {
                    appBloc.add(DrawerEvent());
                  },
                  child: Image.asset('assets/images/icon_slider.png',
                      width: 24.0, height: 24.0),
                )),
                SizedBox(
                  width: 16.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OrderCartViewButton extends StatelessWidget {
  // Fields in a Widget subclass are always marked "final".
  AppBloc appBloc;
  OrderCartViewButton({this.appBloc});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Visibility(
      child: Container(
        height: height * 0.075,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              width: width,
              height: 50,
              child: FlatButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        height: 30,
                        width: 30,
                        // margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(
                                  15.0) //                 <--- border radius here
                              ),
                        ),
                        child: Text(
                          orderCartNum.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Helvetica Neue',
                              fontSize: 14),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        'VIEW ORDER',
                        style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontSize: 16.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Container(
                      width: 100,
                      padding: const EdgeInsets.all(8),
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
                              "\$ " + totalPri.toString(),
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
                  appBloc.add(
                    AddCartEvent(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      visible: orderCartNum > 0 ? true : false,
    );
  }
}
