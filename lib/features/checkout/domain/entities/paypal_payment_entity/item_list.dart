import 'package:equatable/equatable.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_item_entity.dart';

import 'item.dart';

class ItemList extends Equatable {
  final List<Item>? items;

  const ItemList({this.items});

  Map<String, dynamic> toJson() => {
        'items': items?.map((e) => e.toJson()).toList(),
      };

  factory ItemList.fromEntity({required List<CartItemEntity> items}) =>
      ItemList(items: items.map((e) => Item.fromEntity(e)).toList());
  @override
  List<Object?> get props => [items];
}
