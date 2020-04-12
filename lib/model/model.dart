import './item.dart';
Item foodOrder;
List<Item> foodOrders=[];
List<int> foodNumber = [];
class Order {
  bool selected;
  String order;
  Order({this.selected, this.order});
}

List<Order> orderMethods = [
  Order(selected: false, order: 'Dine In'),
  Order(selected: false, order: 'Pick Up'),
  Order(selected: true, order: 'Delivery'),
];

class CustomizedItem{ 
  String title;
  String value;
  CustomizedItem({ this.title, this.value});
}



class Setting {
  //item defining class
  bool selected;
  String title;
  String iconName;

  Setting({this.title, this.iconName, this.selected});
}

class SpiceLevel {
  // int selected;
  String title;
  String value;
  bool selected;
  SpiceLevel({this.title, this.value, this.selected});
}

class MeatPreparation {
  String title;
  String value;
  bool selected;
  MeatPreparation({this.title, this.value, this.selected});
}

class SideUp {
  bool selected;
  String title;
  String value;
  SideUp({this.selected, this.title, this.value});
}

class AddOn {
  bool selected;
  String title;
  String value;
  AddOn({this.selected, this.title, this.value});
}

bool specialInstructionSelected = false;

class OrderCart {
  bool select;
  String title;
  String value1;
  Custom customs;
  OrderCart({this.select, this.title, this.value1,this.customs });
}

class Custom {
  List<SpiceLevel> spiceLevels;
  List<MeatPreparation> meatPreparations;
  List<SideUp> sideUps;
  List<AddOn> addOns;
  Custom({this.spiceLevels, this.meatPreparations, this.sideUps, this.addOns});

}



class Singleton {
  static final Singleton _singleton = Singleton._internal();

  factory Singleton() {
    return _singleton;
  }

  Singleton._internal();

  List<Setting> settings = [
    //preference items detail
    Setting(title: 'Poultry', iconName: 'poultry.png', selected: false),
    Setting(title: 'Pork', iconName: 'pork.png', selected: false),
    Setting(title: 'Lamb', iconName: 'lamb.png', selected: false),
    Setting(title: 'Beef', iconName: 'beef.png', selected: false),
    Setting(title: 'Seafood', iconName: 'seafood.png', selected: false),
    Setting(title: 'Milk', iconName: 'milk.png', selected: false),
    Setting(title: 'Eggs', iconName: 'eggs.png', selected: false),
    Setting(title: 'Stoybeans', iconName: 'stoybeans.png', selected: false),
    Setting(title: 'Wheats', iconName: 'wheats.png', selected: false),
    Setting(title: 'Peanuts', iconName: 'peanuts.png', selected: false),
    Setting(title: 'TreeNuts', iconName: 'tree_nuts.png', selected: false),
    Setting(title: 'Fish', iconName: 'fish.png', selected: false),
    Setting(title: 'Shellfish', iconName: 'shellfish.png', selected: false),
    Setting(title: 'Milk', iconName: 'milk.png', selected: false),
    Setting(title: 'Eggs', iconName: 'eggs.png', selected: false),
    Setting(title: 'Stoybeans', iconName: 'stoybeans.png', selected: false),
    Setting(title: 'Wheats', iconName: 'wheats.png', selected: false),
    Setting(title: 'Peanuts', iconName: 'peanuts.png', selected: false),
    Setting(title: 'TreeNuts', iconName: 'tree_nuts.png', selected: false),
    Setting(title: 'Fish', iconName: 'fish.png', selected: false),
    Setting(title: 'Shellfish', iconName: 'shellfish.png', selected: false),
    Setting(title: 'Milk', iconName: 'milk.png', selected: false),
    Setting(title: 'Eggs', iconName: 'eggs.png', selected: false),
    Setting(title: 'Stoybeans', iconName: 'stoybeans.png', selected: false),
    Setting(title: 'Wheats', iconName: 'wheats.png', selected: false),
    Setting(title: 'Peanuts', iconName: 'peanuts.png', selected: false),
    Setting(title: 'TreeNuts', iconName: 'tree_nuts.png', selected: false),
    Setting(title: 'Fish', iconName: 'fish.png', selected: false),
    Setting(title: 'Shellfish', iconName: 'shellfish.png', selected: false),
  ];

  List<String> searchCategories = [
    //Search lists
    'Poultry', 'Milk', 'Pork', 'Beef', 'Fish', 'Peanut', 'Seafood',
    'Soybeans','Eggs','Lamb','Shellfish'
  ];

  List<OrderCart> orderCarts = [
    OrderCart(
      select: false,
      title:'Chongqing Style Roast Chicken', 
      value1: '18.99', 
      customs:Custom(
      spiceLevels: [
        SpiceLevel(title: 'Non Spicy', value: '0.00', selected: true),
        SpiceLevel(title: 'Mild Spicy', value: '0.00', selected: false),
        SpiceLevel(title: 'Medium Spicy', value: '0.00', selected: false),
        SpiceLevel(title: 'Extra Spicy', value: '0.00', selected: false),
      ],
      meatPreparations: [
        MeatPreparation(title: 'Rare', value: '0.00', selected: true),
        MeatPreparation(title: 'Medium', value: '0.00', selected: false),
        MeatPreparation(title: 'Medium Well', value: '0.00', selected: false),
        MeatPreparation(title: 'Well Done', value: '0.00', selected: false),
      ],
      sideUps: [
        SideUp(selected: true, title: 'Fried Fries', value: '0.00'),
        SideUp(selected: false, title: 'Mushroom', value: '0.00'),
        SideUp(selected: false, title: 'Caesar Salad', value: '0.00'),
        SideUp(selected: false, title: 'Potato', value: '0.00'),
        SideUp(selected: false, title: 'Corn', value: '0.00'),
      ],
      addOns: [
        AddOn(selected: true, title: 'Pudding', value: '0.50'),
        AddOn(selected: false, title: 'Cheese', value: '0.50'),
        AddOn(selected: false, title: 'Black Sugar Boba', value: '0.50'),
        AddOn(selected: false, title: 'Rainbow Jelly', value: '0.50'),
        AddOn(selected: false, title: 'Herbal Jelly', value: '0.50'),
      ],
    ),  )
  ];
}

bool confirmSelected =false; // if confirm button click in preference page, show buttons on order Menu page.
String address1 = '1130 South Michigan Ave, Chicago, IL 60611'; //current address
String address2 = '2f'; //current address

String aptSuiteFloor = '2f';
String street = '1130 South Michigan Ave';
String city = 'Chicago';
String state = 'IL';
String zipcode = '60611';
String country = 'United States';

String defaultImageUrl = 'https://discountseries.com/wp-content/uploads/2017/09/default.jpg';

bool currentLocationSelected = false; //if current address selected, return true, if new address selected, return false.

int orderCartNum = 0;
int cartNum = 1;
double totalPri = 0;
bool cartSelected = false; //if user click SwitchOrder opition in cart page, this value is true. So can comeback cart page. 