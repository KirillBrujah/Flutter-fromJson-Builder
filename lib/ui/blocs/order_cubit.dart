import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:from_json_builder/ui/models/models.dart';

part 'order_cubit.freezed.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(const OrderState.initial());

  Future<void> load() async {
    //

    try {
      final json = await rootBundle.loadString("assets/data.json");
      final order = await OrderBuilder().buildFromJson(jsonDecode(json));
      emit(OrderState.loaded(order));
    } catch (e) {
      emit(OrderState.error(e.toString()));
    }

    // final attributesJson = await rootBundle.getJsonList(Assets.db.attributes);
  }
}
