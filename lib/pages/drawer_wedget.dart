import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bloc.dart';
import '../model/model.dart';

class DrawerWidget extends StatelessWidget {
  AppBloc appBloc;
  int sharedValue = 0;
  DrawerWidget({this.appBloc});
  final Map<int, Widget> children = const <int, Widget>{
    0:Text(
      'I don\'t eat',
       style: TextStyle(fontSize: 13, fontFamily: 'Helvetica Neue', fontWeight: FontWeight.w500),
       ),
    1: Text(
      'I’m vegetarian',
      style: TextStyle(fontSize: 13, fontFamily: 'Helvetica Neue', fontWeight: FontWeight.w500),
      ),
    2: Text(
      'I’m vegan', 
      style: TextStyle(fontSize: 13, fontFamily: 'Helvetica Neue', fontWeight: FontWeight.w500),
      ),
  };
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;    
    return BlocBuilder<AppBloc, AppState>(        
        builder: (context, state) {
          return SizedBox(
              width: size.width * 0.9,
              child: Drawer(
                child: Container(
                  width: size.width*0.9,
                  height: size.height,
                  color: Colors.grey[50],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 37.0),
                      Container(
                        width: size.width*0.9,
                        height: 46.0,
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            FlatButton(
                              onPressed: (){
                                for (var i = 0; i < 29; i++) {
                                  Singleton().settings[i].selected = false;                                  
                                }
                                appBloc.add(ResetDrawerEvent());
                              },
                              textColor: Colors.blue,
                              child: Text('Reset',
                                style: TextStyle(fontSize: 16, fontFamily: 'Helvetica Neue', fontWeight: FontWeight.w500),
                              ),
                            ),

                            Text(
                              'Preference',
                              style: TextStyle(fontSize: 17.0, fontFamily: 'SF Pro Text', fontWeight: FontWeight.bold),
                            ),

                            FlatButton(
                              onPressed: (){
                                confirmSelected = true;
                                appBloc.add(CloseDrawerEvent());
                              },
                              textColor: Color(0xFFFF8B00),
                              child: Text('Confirm',
                                style: TextStyle(fontSize: 16, fontFamily: 'Helvetica Neue', fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: size.width*0.9,
                        height: 1.0,
                        color: Colors.grey[400],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20.0, 10, 20, 15),
                        child: Text(
                          'Ingredients:',
                          style: TextStyle(fontSize: 18.0, fontFamily: 'Helvetica Neue', fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        width: size.width,
                        child: CupertinoSegmentedControl<int>(
                          children: children,
                          onValueChanged: (int newValue) {
                            print('kkk ' + newValue.toString());
                           
                            appBloc.add(SelectIngredientSettingEvent(newValue));
                            sharedValue = newValue;
                          },
                          groupValue: sharedValue,
                          borderColor: Color(0xFFFF8B00),
                          selectedColor: Color(0xFFFF8B00),
                          pressedColor: Color(0xFFFF8B00),
                          unselectedColor: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: size.width*0.9,
                          color: Colors.grey[50],
                          child: drawerSettingColumn(size, sharedValue),
                        ),
                      ),
                    ],
                  ),
                ),
              )
          );
        }
    );
  }
  Column drawerSettingColumn(Size size, int value) {
    double widthC01 = size.width * 0.9;
    double heightC01 = ((size.width*0.9 - 130) / 4 + 22) * 2.0 + 48;
    double widthC02 = size.width * 0.9;
    double heightC02 = 1.0;
    int startIndex = 0;
    int count01 = 5;
    int count02 = 8;
    double ratio = (size.width*0.9 - 130)/ 4 / ((size.width*0.9 - 130) / 4 + 36);

    if(value == 1){
      widthC01 = 0;
      heightC01 = 0;
      widthC02 = 0;
      heightC02 = 0;
      startIndex = 13;
      count01 = 0;
      count02 = 8;
      for (var i = 0; i < 5; i++) {
        Singleton().settings[i].selected = true;
      }
    }

    if(value == 2){
      widthC01 = 0;
      heightC01 = 0;
      widthC02 = 0;
      heightC02 = 0;
      startIndex = 21;
      count01 = 0;
      count02 = 8;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: widthC01,
          height: heightC01,
          child:
          DrawerGridItemWidget(ratio:ratio,
            appBloc: appBloc,
            startIndex: startIndex,
            count:count01
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Container(
            width: widthC02,
            height: heightC02,
            color: Colors.grey[400],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 10, 20, 0),
          child: Text(
            'Allergens:',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        Expanded(
          child: Container(
            width: size.width * 0.9,
            child:
            DrawerGridItemWidget(
              ratio: ratio,
              appBloc: appBloc,
              startIndex: startIndex + count01,
              count:count02
            ),
          ),
        )
      ],
    );
  }
}

class ImageCellGrid{
  Color itemGridColor;
  Color itemTextColor;
  String iconName;
  String title;
  ImageCellGrid({this.itemGridColor, this.itemTextColor, this.iconName, this.title});
}

class DrawerGridItemWidget extends StatelessWidget {
  double ratio;
  int startIndex;
  AppBloc appBloc;
  int count;
  List<ImageCellGrid> settings;

  DrawerGridItemWidget({
    this.ratio, this.appBloc, this.startIndex, this.count,
  });
  @override
  Widget build(BuildContext context) {
    this.settings =[];
    for( var i = 0 ; i < count; i++) {
      Setting item = Singleton().settings[startIndex + i];
      if(item.selected){
        String title = item.title;
        String iconName = 's_' + item.iconName;
        Color itemGridColor = Color(0xFFFF8B00);
        Color itemTextColor = Color(0xFFFF8B00);
        this.settings.add(
          ImageCellGrid(title: title,
            iconName:iconName,
            itemGridColor: itemGridColor,
            itemTextColor: itemTextColor,
          ),
        );
      }else{
        String title = item.title;
        String iconName = item.iconName;
        Color itemGridColor = Colors.grey[200];
        Color itemTextColor = Colors.grey[600];
        this.settings.add(
          ImageCellGrid(title: title,
            iconName:iconName,
            itemGridColor: itemGridColor,
            itemTextColor: itemTextColor,
          ),
        );
      }
    }

    return GridView.count(
      crossAxisCount: 4,
      childAspectRatio:ratio,
      mainAxisSpacing: 0,
      crossAxisSpacing: 30,
      padding:EdgeInsets.fromLTRB(20, 20, 20, 0),
      children: List.generate(settings.length, (index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Material(
                child: InkWell(
                  onTap: () {
                    print('kkkk' + index.toString());
                    Singleton().settings[index + startIndex].selected = !Singleton().settings[index + startIndex].selected;
                    appBloc.add(SelectGridIngredientSettingEvent());
                  },
                  child:Container(
                    decoration: BoxDecoration(
                      color: settings[index].itemGridColor,
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    child:Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('assets/images/' + (settings[index].iconName)),
                    ),
                  ),
                )
            ),

            Container(
              height: 35,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(4.0, 4.0, 0, 4.0),
                child: Text(
                  (settings[index].title),
                  style:TextStyle(fontSize: 12, color: settings[index].itemTextColor,),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}