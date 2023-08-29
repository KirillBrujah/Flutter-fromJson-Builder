import 'package:flutter/material.dart';
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
  late final OrderInfo info;
  late final Vehicle vehicle;

  Future<Order> buildFromJson(Map<String, dynamic> json) async {
    info = _buildInfo(json);
    vehicle = _buildVehicle(json["vehicle"]);

    return Order(
      id: info.id,
      vehicle: vehicle,
    );
  }

  OrderInfo _buildInfo(Map<String, dynamic> json) {
    try {
      return OrderInfo.fromJson(json);
    } catch (e) {
      _reportError(
        exception: e,
        context: "Info parsing error",
      );
      rethrow;
    }
  }

  Vehicle _buildVehicle(Map<String, dynamic> json) {
    try {
      return Vehicle.fromJson(json);
    } catch (e) {
      _reportError(
        exception: e,
        context: "Vehicle parsing error",
      );
      rethrow;
    }
  }

  void _reportError({required Object exception, required String context}) {
    FlutterError.reportError(FlutterErrorDetails(
      exception: exception,
      context: ErrorDescription(context),
      library: "OrderBuilder",
    ));
  }
}
