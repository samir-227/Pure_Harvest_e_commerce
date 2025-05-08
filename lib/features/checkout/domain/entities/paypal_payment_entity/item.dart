import 'package:equatable/equatable.dart';
import 'package:fruits_hub/core/helpers/get_currency.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_item_entity.dart';

class Item extends Equatable {
  final String? name;
  final int? quantity;
  final String? price;
  final String? currency;

  const Item({this.name, this.quantity, this.price, this.currency});

  factory Item.fromEntity(CartItemEntity cartItemEntity) => Item(
      name: cartItemEntity.product.name,
      quantity: cartItemEntity.quantity,
      price: cartItemEntity.product.price.toString(),
      currency: getCurrency());

  Map<String, dynamic> toJson() => {
        'name': name,
        'quantity': quantity,
        'price': price,
        'currency': currency,
      };

  @override
  List<Object?> get props => [name, quantity, price, currency];
}
