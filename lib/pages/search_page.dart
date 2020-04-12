import 'package:flutter/cupertino.dart';
import 'package:algolia/algolia.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../view/food.dart';
import '../model/item.dart';
import '../model/model.dart';
import '../bloc/bloc.dart';

String hintText = 'Dishes in ..';

class SearchPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    bool flag = true;
    // final AppBloc appBloc = BlocProvider.of<AppBloc>(context);
    return BlocProvider(
      builder: (context) => AppBloc(),
      child: BlocListener<AppBloc, AppState>(
          listener: (context, state) {
            if (state is ShowSearchResult) {}
            if (state is ShowFood) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FoodPage()),
              );
            }
          },
          child: Scaffold(
            resizeToAvoidBottomPadding: false,
            backgroundColor: Colors.white,
            body: SafeArea(child:
                BlocBuilder<AppBloc, AppState>(builder: (context, state) {
              return SearchResultListWidget(
                showFlag: flag,
               
              );
            })),
          )),
    );
  }
}

class SearchResultListWidget extends StatefulWidget {
 
  bool showFlag;
  SearchResultListWidget({this.showFlag,});

  @override
  _SearchResultListWidgetState createState() => _SearchResultListWidgetState();
}

class _SearchResultListWidgetState extends State<SearchResultListWidget> {
 
  int _counter = 0;
  List<Item> _items;
  Algolia algolia;
  double height = 600;
  void _incrementCounter() async {
    final items = await filterItem();
    setState(() {
      _items.clear();
      _items.addAll(items);
    });
  }

  @override
  void initState() {
    super.initState();
    _items = [];
    algolia = Algolia.init(
        applicationId: 'O9HDK5T143',
        apiKey: '1d30ddb4f1a398e27ed92327682630fe');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 49,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  SizedBox(
                    width: 14,
                  ),
                  Expanded(
                    child: Container(
                      height: 34.0,
                      child: Container(
                        height: 34,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(17.0)),
                          color: Color(0x88ACACAC),
                        ),
                        padding: EdgeInsets.only(left: 0.0),
                        child: TextField(
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 7.50),
                            border: InputBorder.none,
                            hintText: hintText,
                            prefixIcon: IconButton(
                                padding: EdgeInsets.only(bottom: 0.10),
                                icon: Icon(Icons.search),
                                color: Colors.grey[800],
                                onPressed: () {}),
                          ),
                        ),
                      ),
                    ),
                  ),
                  FlatButton(
                      onPressed: () {
                        hintText = 'Dishes in ..';
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.blueAccent,
                        ),
                      )),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(0),
                height: 1.0,
                color: Colors.grey[300],
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: this.widget.showFlag == false
                            ? InkWell(
                                onTap: () {
                                  FocusScope.of(context).requestFocus(new FocusNode());
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: ListView.separated(
                                    separatorBuilder: (context, index) =>
                                        Divider(
                                      color: Colors.grey,
                                    ),
                                    itemCount: _items.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                     Item item = _items[index];
                                      return InkWell(
                                        onTap: () {
                                          foodOrder = item;
                                         BlocProvider.of<AppBloc>(context).add(ShowFoodEvent());
                                        },
                                        child: Container(
                                          height: 112,
                                          color: Colors.white,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 16.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: <Widget>[
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          0.0, 14.0, 8.0, 2.0),
                                                      child: Text(
                                                        item.name,
                                                        overflow: TextOverflow.ellipsis,
                                                        style: TextStyle(
                                                          fontSize: 16,                                                          
                                                          color: Colors.black,
                                                          fontFamily:
                                                              'Helvetica Neue',
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          0.0, 2.0, 8.0, 2.0),
                                                      child: Text(
                                                        'A food with a sharp taste. Often used to...',
                                                        style: TextStyle(
                                                          fontSize: 13,
                                                          color: Colors.grey,
                                                          fontFamily:
                                                              'Helvetica Neue',
                                                        ),
                                                      ),
                                                    ),
                                                    Spacer(
                                                      flex: 1,
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          0.0, 2.0, 0.0, 4.0),
                                                      child: Text(
                                                        "\$" +
                                                            item.price
                                                                .toString(),
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.black,
                                                          fontFamily:
                                                              'Helvetica Neue',
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                width: 16,
                                              ),
                                              Container(
                                                width: 96,
                                                height: 96,
                                                child: Image.network(
                                                  item.image == ""
                                                      ? defaultImageUrl
                                                      : item.image,
                                                  fit: BoxFit.cover,
                                                  height: double.infinity,
                                                  width: double.infinity,
                                                  alignment: Alignment.center,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ))
                            : Container(
                                width: MediaQuery.of(context).size.width,
                                height: height,
                                color: Color.fromRGBO(241, 242, 244, 1),
                                padding: const EdgeInsets.all(0),
                                child: Column(
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          height: 60,
                                          padding:
                                              const EdgeInsets.only(top: 30),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              SizedBox(
                                                width: 16,
                                              ),
                                              Text(
                                                'What’s Hot Here',
                                                style: TextStyle(
                                                    fontSize: 22,
                                                    color: Colors.black,
                                                    fontFamily:
                                                        'Helvetica Neue',
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 300,
                                          child: GridView.count(
                                            primary: false,
                                            padding: const EdgeInsets.all(20),
                                            crossAxisSpacing: 10,
                                            mainAxisSpacing: 10,
                                            crossAxisCount: 4,
                                            childAspectRatio:
                                                MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    4 /
                                                    38,
                                            children: List.generate(
                                                Singleton()
                                                    .searchCategories
                                                    .length, (index) {
                                              return Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5.0)),
                                                  color: Color.fromRGBO(
                                                      220, 220, 220, 1),
                                                ),
                                                child: InkWell(
                                                  onTap: () {
                                                    //this.widget.appBloc.add(ShowSearchResultEvent());
                                                    this.widget.showFlag =
                                                        false;
                                                    setState(() {
                                                      hintText = Singleton()
                                                              .searchCategories[
                                                          index];
                                                      _incrementCounter();
                                                    });
                                                  },
                                                  child: Center(
                                                    child: Text(
                                                      (Singleton()
                                                              .searchCategories[
                                                          index]),
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontFamily:
                                                            'SF Pro Display',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Future<List<Item>> filterItem() async {
    // Demo: how to filter items which has MILK in Ingredients
    String text1 = 'Ingredients:';
    String filter = text1 + hintText;
    print(filter);
    final String index = 'test_items';
    AlgoliaQuery query = algolia.instance.index(index).search('');
    query = query.setFilters(filter);

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
}
