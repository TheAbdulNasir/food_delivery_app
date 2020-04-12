import 'package:flutter/material.dart';
import 'view/order_menu.dart';

void main() => runApp(MaterialApp(

  home:orderMenu,
));
 OrderMenu get orderMenu => OrderMenu(businessID: 'businessID');
