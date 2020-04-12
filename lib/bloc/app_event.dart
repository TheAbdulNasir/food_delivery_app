import 'package:meta/meta.dart';

@immutable
abstract class AppEvent {}

class OrderMethodevent extends AppEvent{}
class OrderMenuEvent extends AppEvent{}
class PopEvent extends AppEvent {}
class SearchEvent extends AppEvent {}
class DrawerEvent extends AppEvent {}
class CloseDrawerEvent extends AppEvent{}
class ResetDrawerEvent extends AppEvent{}

class SelectIngredientSettingEvent extends AppEvent {
  final int val;
  SelectIngredientSettingEvent(this.val);}

class SelectGridIngredientSettingEvent extends AppEvent{}

class ShowSearchResultEvent extends AppEvent{}

class ShowFoodEvent extends AppEvent{}

class FoodCartCountEvent extends AppEvent {
  final int count;
  FoodCartCountEvent(this.count);
}

class ShowCustomizeEvent extends AppEvent{}

class AddCartEvent extends AppEvent{}

class DeliveryAddressEvent extends AppEvent{}

class NewAddressEvent extends AppEvent{}


class EstimateEvent extends AppEvent{}

class ItemCountLimitEvent extends AppEvent{}

class ItemRemoveGredientEvent extends AppEvent{}

class OrderItemSelectedEvent extends AppEvent{}
