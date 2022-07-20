
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:routine2/core/error/failure.dart';



abstract class UseCase<Type, Params>{
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable{
  @override
  List<Object?> get props => [];
}

class Params extends Equatable{
  final int number;

  const Params({required this.number});

  @override
  List<Object?> get props => [number];

}