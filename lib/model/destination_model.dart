import 'package:equatable/equatable.dart';

class DestinationModel extends Equatable {
  final int destinationId;
  final String name;

  const DestinationModel({this.destinationId = 0, this.name = ''});

  factory DestinationModel.fromJson(json) => DestinationModel(
        destinationId: json['destination_id'],
        name: json['name'],
      );

  @override
  List<Object?> get props => [destinationId, name];
}
