import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterCubitState> {
  CounterCubit() : super(const CounterCubitState(counter: 10));

  void increaseBy(int value) {
    emit(state.copyWith(
      counter: state.counter + value,
      transactions: state.transactions + 1,
    ));
  }

  void resetCounter() {
    emit(state.copyWith(counter: 0));
  }

  void reset() {
    emit(state.copyWith(
      counter: 0,
      transactions: 0,
    ));
  }
}
