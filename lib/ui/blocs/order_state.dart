part of 'order_cubit.dart';

@freezed
class OrderState with _$OrderState {

  const factory OrderState.initial() = _initial;

  const factory OrderState.error(String message) = _error;

  const factory OrderState.loaded(Order order) = _loaded;
}