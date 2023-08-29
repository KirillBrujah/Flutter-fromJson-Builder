import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';

part 'models.g.dart';

@freezed
class Order with _$Order {
  const factory Order({
    required int id,
    required Vehicle vehicle,
  }) = _Order;
}

@freezed
class OrderInfo with _$OrderInfo {
  const factory OrderInfo({
    required int id,
  }) = _OrderInfo;

  factory OrderInfo.fromJson(Map<String, dynamic> json) =>
      _$OrderInfoFromJson(json);
}

@freezed
class Vehicle with _$Vehicle {
  const factory Vehicle({
    required int id,
    required String name,
  }) = _Vehicle;

  factory Vehicle.fromJson(Map<String, dynamic> json) =>
      _$VehicleFromJson(json);
}

class OrderBuilder {
//
}
