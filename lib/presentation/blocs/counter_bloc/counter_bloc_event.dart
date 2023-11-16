part of 'counter_bloc.dart';

sealed class CounterBlocEvent {
  const CounterBlocEvent();
}

class CounterIncreased extends CounterBlocEvent {
  final int value;

  const CounterIncreased(this.value);
}

class CounterReset extends CounterBlocEvent {}

class CounterTotalReset extends CounterBlocEvent {}
