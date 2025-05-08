class ShippingAddressEntity {
  String? name;
  String? phone;
  String? address;
  String? city;
  String? email;

  ShippingAddressEntity(
      {this.name, this.phone, this.address, this.city, this.email});

  String getAddress() {
    return '$city-$address';
  }
}
