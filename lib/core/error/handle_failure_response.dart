import 'package:routine2/core/constants/general_constants.dart';
import 'package:routine2/core/error/failure.dart';

String mapFailureResponse(Failure failure) {
  switch (failure.runtimeType) {
    case DbFailure:
      const response = dbFailureMessage;
      return response;
    default:
      const response = unknownFailureMessage;
      return response;
  }
}
