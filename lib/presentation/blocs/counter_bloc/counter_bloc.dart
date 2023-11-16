import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_bloc_event.dart';
part 'counter_bloc_state.dart';

class CounterBloc extends Bloc<CounterBlocEvent, CounterBlocState> {
  CounterBloc() : super(const CounterBlocState()) {
    on<CounterIncreased>((event, emit) => _onCounterIncreased(event, emit));
    on<CounterReset>((event, emit) => _onCounterReset(event, emit));
    on<CounterTotalReset>((event, emit) => _onCounterTotalReset(event, emit));
  }

  void _onCounterIncreased(
      CounterIncreased event, Emitter<CounterBlocState> emit) {
    emit(state.copyWith(
      counter: state.counter + event.value,
      transactions: state.transactions + 1,
    ));
  }

  void _onCounterReset(CounterReset event, Emitter<CounterBlocState> emit) {
    emit(state.copyWith(counter: 0));
  }

  void _onCounterTotalReset(
      CounterTotalReset event, Emitter<CounterBlocState> emit) {
    emit(state.copyWith(
      counter: 0,
      transactions: 0,
    ));
  }

  // OTRA FORMA DE EMITIR EVENTOS DIRECTAMENTE EN ESTA CLASE ES LLAMAR ESTOS
  // MÉTODOS EN EL UI Y ASÍ CENTRALIZAMOS EL MANEJO A UNA ÚNICA CLASE

  void increaseBy([int value = 1]) {
    add(CounterIncreased(value));
  }

  void reset() {
    add(CounterReset());
  }

  void totalReset() {
    add(CounterTotalReset());
  }
}
