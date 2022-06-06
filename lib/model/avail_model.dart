import 'package:equatable/equatable.dart';

class AvailModel extends Equatable {
  final int? packageId;
  final String? name;
  final int? price;
  final String? currency;
  final int? day;
  final List<String>? images;

  const AvailModel(
      {this.packageId,
      this.name,
      this.currency,
      this.day,
      this.images,
      this.price});

  factory AvailModel.fromJson(json) => AvailModel(
        packageId: json['package_id'],
        name: json['name'],
        price: json['price'],
        currency: json['currency'],
        day: json['day'],
        images: json['images'].cast<String>(),
      );

  @override
  List<Object?> get props => [
        packageId,
        name,
        price,
        currency,
        day,
        images,
      ];
}
