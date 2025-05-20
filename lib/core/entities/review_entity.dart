import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'review_entity.g.dart';

@HiveType(typeId: 0)
class ReviewEntity extends Equatable {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String image;

  @HiveField(2)
  final num ratting;

  @HiveField(3)
  final String date;

  @HiveField(4)
  final String reviewDescription;

  ReviewEntity(
      {required this.name,
      required this.image,
      required this.ratting,
      required this.date,
      required this.reviewDescription});

  @override
  List<Object?> get props => [name, image, ratting, date, reviewDescription];
}
