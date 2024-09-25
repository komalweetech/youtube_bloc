class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.data, this.message);

    ApiResponse.loading() : status = Status.loading;


}