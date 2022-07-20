import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

// General failures
class DbFailure extends Failure {}

class CacheFailure extends Failure {}

class NetworkFailure extends Failure {}

class UrlNotFoundFailure extends Failure {}

class AddressEmptyFailure extends Failure {}