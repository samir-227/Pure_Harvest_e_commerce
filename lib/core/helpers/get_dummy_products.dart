import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/entities/review_entity.dart';

ProductEntity getDummyProduct() {
  return ProductEntity(
      name: 'product name',
      code: 'product code',
      description: 'product description',
      price: 100,
      reviews: [
        ReviewEntity(
            name: 'review name',
            image: '',
            ratting: 5,
            date: " 30/4/2025",
            reviewDescription: 'review description')
      ],
      expirationsMonths: 2,
      numberOfCalories: 100,
      unitAmount: 1,
      isOrganic: true,
      isFeatured: true,
      imageUrl: null);
}
List<ProductEntity> getDummyProducts() => List.generate(10, (index) => getDummyProduct());
