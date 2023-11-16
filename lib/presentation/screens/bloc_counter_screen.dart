import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: const _BlocCounterView(),
    );
  }
}

class _BlocCounterView extends StatelessWidget {
  const _BlocCounterView();

  void _increaseBy(BuildContext context, [int value = 1]) {
    context.read<CounterBloc>().add(CounterIncreased(value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Counter'),
        actions: [
          IconButton(
            onPressed: () =>
                context.read<CounterBloc>().add(CounterTotalReset()),
            icon: const Icon(Icons.refresh_outlined),
          ),
        ],
      ),
      body: context.select(
        (CounterBloc counterBloc) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Counter value: ${counterBloc.state.counter}'),
              const SizedBox(height: 10),
              Text('Number of transactions: ${counterBloc.state.transactions}')
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            child: const Text('+3'),
            onPressed: () => _increaseBy(context, 3),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: '2',
            child: const Text('+2'),
            onPressed: () => _increaseBy(context, 2),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: '3',
            child: const Text('+1'),
            onPressed: () => _increaseBy(context),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: '4',
            child: const Text(
              'Reset counter',
              textAlign: TextAlign.center,
            ),
            onPressed: () => context.read<CounterBloc>().add(CounterReset()),
          ),
        ],
      ),
    );
  }
}
