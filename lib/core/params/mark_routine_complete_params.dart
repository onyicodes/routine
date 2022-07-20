import 'package:equatable/equatable.dart';

class MarkRoutineDoneParams extends Equatable {
  final int routineID;
  

  const MarkRoutineDoneParams(
      { required this.routineID});

  @override
  List<Object?> get props => [routineID,];
}