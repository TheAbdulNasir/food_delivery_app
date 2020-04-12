// Model class for item
import 'package:json_annotation/json_annotation.dart';
import 'nutrition.dart';
part 'item.g.dart';

@JsonSerializable(anyMap: true)
class Item {
  //
  // Here I just show you how to filter with algolia
  // So I won't parse all the fields in Item
  // But I will show you the whole response from algolia

  @JsonKey(name: 'Name')
  final String name;
  @JsonKey(name: 'Ingredients')
  final List<String> ingredients;
  @JsonKey(name: 'Category')
  final String category;
  @JsonKey(name: 'Avaliable')
  final bool avaliable;
  @JsonKey(name: 'Available_modifiers')
  final List<String> avaliableModifiers;
  @JsonKey(name: 'Price')
  final double price;
  @JsonKey(name: 'Image')
  final String image;
  @JsonKey(name: 'Tax_class')
  final List<String>taxClass;
  @JsonKey(name: 'Added_date')
  final double addedDate;
  @JsonKey(name: 'Description')
  final String description;
  @JsonKey(name: 'Name_cn')
  final String nameCN;
  @JsonKey(name: 'Sold_cnt')
  final double soldCnt;
  @JsonKey(name: 'Nutritions')
  final Nutrition nutritions;
  @JsonKey(name: 'Category_cn')
  final String categoryCN;
  @JsonKey(name: 'Available_variations')
  final List<String> availableVariations;
  @JsonKey(name: 'Spicy_level')
  final double spicyLevel;
  @JsonKey(name: 'Business_id')
  final String businessID;
  

  Item(
    this.name,
    this.ingredients,
    this.category,
    this.avaliable,
    this.avaliableModifiers,
    this.price,
    this.image,
    this.taxClass,
    this.addedDate,
    this.description,
    this.nameCN,
    this.soldCnt,
    this.nutritions,
    this.categoryCN,
    this.availableVariations,
    this.spicyLevel,
    this.businessID,
  );

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson(Item item) => _$ItemToJson(this);
}

// class Tax{

//   @JsonKey(name: 'base')
//   final double base;
//   @JsonKey(name: 'drink')
//   final double drink;

//   Tax(
//     this.base,
//     this.drink,
//   );

  // Tax.fromJson(Map<String, dynamic> json)
  //     : base = (json['base'] as num)?.toDouble(),     
  //       drink = (json['drink'] as num)?.toDouble();

//   Map<String, dynamic> toJson() =>
//     {
//       'base': base,
//       'drink': drink,
//     };
// }

