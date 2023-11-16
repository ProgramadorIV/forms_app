part of 'counter_bloc.dart';

class CounterBlocState extends Equatable {
  const CounterBlocState({
    this.counter = 10,
    this.transactions = 0,
  });

  final int counter;
  final int transactions;

  CounterBlocState copyWith({
    int? counter,
    int? transactions,
  }) =>
      CounterBlocState(
        counter: counter ?? this.counter,
        transactions: transactions ?? this.transactions,
      );

  @override
  List<Object> get props => [counter, transactions];
}
