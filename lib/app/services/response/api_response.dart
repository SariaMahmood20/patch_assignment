import 'status.dart';

class ApiResponse<T>{
  
  String? message;
  Status? status;
  T? data;

  ApiResponse(this.data, this.message, this.status);

  ApiResponse.loading(): status = Status.loading;
  ApiResponse.completed(this.data): status = Status.completed;
  ApiResponse.failed(): status = Status.failed;

  String toString(){
    return 'Message: $message Status: $status Data: $data';
  }

}