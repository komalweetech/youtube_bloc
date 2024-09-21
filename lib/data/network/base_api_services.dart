abstract class BaseApiServices {

  // for get type Api.
  Future<dynamic> getApi(String url);

  // for post type api.
  Future<dynamic> postApi(String url, var data);

    // for delete api
  Future<dynamic> deleteApi(String url);


}