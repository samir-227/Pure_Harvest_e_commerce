import 'package:equatable/equatable.dart';

class ReviewEntity extends Equatable {
  final String name;
  final String image;
  final num ratting;
  final String date;
  final String reviewDescription;

  ReviewEntity(
      {required this.name,
      required this.image,
      required this.ratting,
      required this.date,
      required this.reviewDescription});
      
        @override
        List<Object?> get props => throw UnimplementedError();
}