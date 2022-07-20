import 'package:equatable/equatable.dart';

class DeleteRoutineParams extends Equatable {
  final int routineID;
  

  const DeleteRoutineParams(
      { required this.routineID});

  @override
  List<Object?> get props => [routineID,];
}