import 'package:meta/meta.dart';

@immutable
abstract class AppState {}

class InitialAppState extends AppState {}

class OrderMethod extends AppState{}
class OrderMenus extends AppState{}
class ShowPop extends AppState {}
class ShowDrawer extends AppState {}
class CloseDrawer extends AppState {}
class ShowSearch extends AppState {}
class SelectIngredientSetting extends AppState{}
class SelectGridIngredientSetting extends AppState{}
class ShowSearchResult extends AppState{}
class ShowFood extends AppState{}
class FoodCartCount extends AppState {}
class ShowCustomize extends AppState {}
class AddCart extends AppState{}
class DeliveryAddress extends AppState{}
class NewAddress extends AppState{}
class Estimate extends AppState{}
class ItemCountLimit extends AppState{}
class ItemRemoveGredient extends AppState{}
class ResetDrawer extends AppState{}
class OrderItemSelected extends AppState{}
