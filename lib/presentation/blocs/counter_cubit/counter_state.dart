part of 'counter_cubit.dart';

class CounterCubitState extends Equatable {
  final int counter;
  final int transactions;

  const CounterCubitState({
    this.counter = 0,
    this.transactions = 0,
  });

  copyWith({
    int? counter,
    int? transactions,
  }) =>
      CounterCubitState(
        counter: counter ?? this.counter,
        transactions: transactions ?? this.transactions,
      );

  @override
  List<Object?> get props => [counter, transactions];
}
