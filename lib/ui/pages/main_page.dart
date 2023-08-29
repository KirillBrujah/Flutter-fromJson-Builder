import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:from_json_builder/ui/blocs/order_cubit.dart';
import 'package:from_json_builder/ui/models/models.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Main Page")),
      body: BlocProvider(
        create: (context) => OrderCubit()..load(),
        child: const _Order(),
      ),
    );
  }
}

class _Order extends StatelessWidget {
  const _Order();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) => state.when(
        initial: () => const Center(child: CircularProgressIndicator()),
        error: (message) => Center(child: Text(message)),
        loaded: (order) => Center(child: _OrderCard(order)),
      ),
    );
  }
}

class _OrderCard extends StatelessWidget {
  const _OrderCard(this.order);

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Order №${order.id}'),
          const SizedBox(height: 10),
          Card(
            child: Row(
              children: [
                Text(order.vehicle.name),
                const SizedBox(width: 10),
                Text('№ ${order.vehicle.id}'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
