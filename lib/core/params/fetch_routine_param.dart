import 'package:equatable/equatable.dart';

class FetchRoutineWithIDParams extends Equatable {
  final int routineID;
  

  const FetchRoutineWithIDParams(
      { required this.routineID});

  @override
  List<Object?> get props => [routineID,];
}