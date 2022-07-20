part of 'fetch_routines_bloc.dart';

abstract class FetchRoutinesEvent extends Equatable {
  const FetchRoutinesEvent();

  @override
  List<Object> get props => [];
}

class FetchAllRoutinesEvent extends FetchRoutinesEvent {
  
  const FetchAllRoutinesEvent();

  @override
  List<Object> get props => [];
}
