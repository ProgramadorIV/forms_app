import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: const _CubitCounterView(),
    );
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();

  void increaseBy(BuildContext context, [int value = 1]) {
    context.read<CounterCubit>().increaseBy(value);
  }

  @override
  Widget build(BuildContext context) {
    // final counterState = context.watch<CounterCubit>().state;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit Counter'),
        actions: [
          IconButton(
            onPressed: () => context.read<CounterCubit>().reset(),
            icon: const Icon(Icons.refresh_outlined),
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterCubitState>(
          // buildWhen: (previous, current) => current.counter != previous.counter,
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Counter value: ${state.counter}'),
                const SizedBox(height: 10),
                Text('Number of transactions: ${state.transactions}'),
              ],
            );
          },
        ),
        //Esto es lo mismo que un blocbuilder pero unicamente
        //sirve para un bloc a la vez.
        //
        // child: context.select((CounterCubit value) {
        //   return Column(
        //     children: [
        //       Text('Counter value: ${value.state.counter}'),
        //       const SizedBox(height: 10),
        //       Text('Number of transactions: ${value.state.transactions}'),
        //     ],
        //   )
        // })
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            child: const Text('+3'),
            onPressed: () => increaseBy(context, 3),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: '2',
            child: const Text('+2'),
            onPressed: () => increaseBy(context, 2),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: '3',
            child: const Text('+1'),
            onPressed: () => increaseBy(context),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: '4',
            child: const Text(
              'Reset counter',
              textAlign: TextAlign.center,
            ),
            onPressed: () => context.read<CounterCubit>().resetCounter(),
          )
        ],
      ),
    );
  }
}
