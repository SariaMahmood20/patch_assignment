class AppExceptions implements Exception{
  String? message;
  String? prefix;

  AppExceptions(this.message, this.prefix);

  String toString(){
    return '$message';
  }
}

class FetchDataException extends AppExceptions{
  FetchDataException([String? message]): super(message, "Error while communicating!");
}

class FetchBadRequestException extends AppExceptions{
  FetchBadRequestException([String? message]): super(message, "Bad Request Exception");
}

class FetchUnauthorisedAccessException extends AppExceptions{
  FetchUnauthorisedAccessException([String? message]): super(message, "Unauthorised Access Exception");
}

class FetchInvalidInputException extends AppExceptions{
  FetchInvalidInputException([String? message]): super(message, "Invalid Input Exception");
}