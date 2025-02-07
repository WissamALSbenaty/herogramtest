
import 'package:herogram/data/errors/custom_error.dart';

class InternetConnectionError extends CustomError {
  InternetConnectionError()
      : super(
            errorMessage: 'It seems you are not connected to the internet',
            );
}

class SomethingWentWrongError extends CustomError {
  SomethingWentWrongError()
      : super(
            errorMessage: 'Something went wrong , please try again later',
            );
}

class ServerError extends CustomError {
  ServerError()
      : super(
          errorMessage: 'Oops! We are sorry for this experience',

        );
}

class ForbiddenError extends CustomError {
  ForbiddenError()
      : super(
            errorMessage: 'You are not allowed to access this page',
            );
}

class UnSupportedLocationError extends CustomError {
  UnSupportedLocationError()
      : super(
            errorMessage:
                'Unfortunately, our services are currently unavailable in your area.',
            );
}

class NotFoundError extends CustomError {
  NotFoundError({required super.errorMessage})
      : super();
}

class BadRequestError extends CustomError {
  final Map<String, String>? validationErrors;
  BadRequestError({required this.validationErrors, required super.errorMessage})
      : super(

        );
}

class UnProcessableEntityError extends CustomError {
  UnProcessableEntityError({required super.errorMessage})
      : super(

        );
}

class UnAuthorizedError extends CustomError {
  UnAuthorizedError()
      : super(
            errorMessage: 'Oops! It seems you\'re not registered',
            );
}

class IsNotBiggerThanError extends CustomError {
  IsNotBiggerThanError(
      {required final String fieldName, required final num number})
      : super(
            errorMessage:
                "${fieldName} ${"should be bigger than"} $number",
            );
}

class IsNotSmallerThanError extends CustomError {
  IsNotSmallerThanError(
      {required final String fieldName, required final num number})
      : super(
            errorMessage:
                "${fieldName} ${"should be smaller than"} $number",
            );
}

class IsNotNameError extends CustomError {
  IsNotNameError({required final String fieldName})
      : super(
            errorMessage:
                "${fieldName} ${"is not a valid name"}",
            );
}

class IsNotNumberError extends CustomError {
  IsNotNumberError({required final String fieldName})
      : super(
            errorMessage:
                "${fieldName} ${"is not a valid number"}",
            );
}

class EmptyFieldError extends CustomError {
  EmptyFieldError({required final String fieldName})
      : super(
            errorMessage:
                "${fieldName} ${"should not be empty"}",
            );
}

class ShorterThanError extends CustomError {
  ShorterThanError(
      {required final String fieldName, required final int minLength})
      : super(
            errorMessage:
                "${fieldName} ${"should be with length"} $minLength",
            );
}

class IsNotSelectedError extends CustomError {
  IsNotSelectedError({required final String fieldName})
      : super(
            errorMessage:
                "${"Please select"} ${fieldName}",
            );
}
