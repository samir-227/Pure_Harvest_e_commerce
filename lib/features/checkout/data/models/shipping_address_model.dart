
import 'package:fruits_hub/features/checkout/domain/entities/shipping_address_entity.dart';


class ShippingAddressModel {
  String? name;
  String? phone;
  String? address;
  String? city;
  String? email;

 ShippingAddressModel({
    this.name,
    this.phone,
    this.address,
    this.city,
    this.email,
  });
factory ShippingAddressModel.fromEntity(ShippingAddressEntity entity) => ShippingAddressModel(
   name: entity.name,
   phone: entity.phone,
   address: entity.address,
   city: entity.city,
   email: entity.email
 );
 toJson() => {
   'name': name,
   'phone': phone,
   'address': address,
   'city': city,
   'email': email,
 };
}
 