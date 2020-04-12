import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  @override
  AppState get initialState => InitialAppState();

  @override
  Stream<AppState> mapEventToState(
    AppEvent event,
  ) async* {
    if (event is OrderMethodevent){
      yield OrderMethod();
    }
    if(event is OrderMenuEvent){
      yield OrderMenus();
    }

    if(event is DeliveryAddressEvent){
      yield DeliveryAddress();
    }

    if(event is NewAddressEvent){
      yield NewAddress();
    }   

    if(event is EstimateEvent){
      yield Estimate();
    }
    
    if (event is PopEvent) {
      yield ShowPop();
    }
    if (event is SearchEvent) {
      yield ShowSearch();
    }
    if (event is DrawerEvent) {
      yield ShowDrawer();
    }

    if (event is CloseDrawerEvent) {
      yield CloseDrawer();
    }

    if(event is ResetDrawerEvent)
    {
      yield ResetDrawer();
    }

    if (event is SelectIngredientSettingEvent) {
      yield SelectIngredientSetting();
    }

    if (event is SelectGridIngredientSettingEvent) {
      yield SelectGridIngredientSetting();
    }

    if (event is ShowSearchResultEvent){
      yield ShowSearchResult();
    }

    if(event is ShowFoodEvent){
      yield ShowFood();
    }

    if(event is FoodCartCountEvent){
         
      yield FoodCartCount();
    }
    
    if(event is ShowCustomizeEvent){
      yield ShowCustomize();
    }

    if(event is AddCartEvent){
      yield AddCart();
    }


    if(event is ItemCountLimitEvent)
    {
      yield ItemCountLimit();
    }

    if(event is ItemRemoveGredientEvent)
    {
      yield ItemRemoveGredient();
    }

    if(event is OrderItemSelectedEvent)
    {
      yield OrderItemSelected();
    }
  }
}
