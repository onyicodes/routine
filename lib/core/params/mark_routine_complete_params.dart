import 'package:equatable/equatable.dart';

class MarkRoutineDoneParams extends Equatable {
  final int routineID;
  final bool marked;

  const MarkRoutineDoneParams({required this.routineID, required this.marked});

  @override
  List<Object?> get props => [
        routineID,
      ];
}
