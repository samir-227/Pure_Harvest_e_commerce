import 'package:equatable/equatable.dart';
import 'package:fruits_hub/core/helpers/get_currency.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';

import 'details.dart';

class Amount extends Equatable {
  final String? total;
  final String? currency;
  final Details? details;

  const Amount({this.total, this.currency, this.details});

  factory Amount.fromEntity(OrderEntity entity) => Amount(
      total: entity.calculateTotalPriceAfterShippingAndDiscount().toString(),
      currency: getCurrency(),
      details: Details.fromEntity(entity));
  Map<String, dynamic> toJson() => {
        'total': total,
        'currency': currency,
        'details': details?.toJson(),
      };

  @override
  List<Object?> get props => [total, currency, details];
}
