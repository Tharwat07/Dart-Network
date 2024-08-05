import 'dart:convert';
import 'dart:io';


const String baseUrl = "YOUR_BASE_URL";
const String URL = "YOUR_URL";
const String token = "YOUR_TOKEN" ;

HttpHeaders? headers;

enum Method {
  GET,
  POST,
  PUT,
  PATCH,
  DELETE,
}

final HttpClient client = HttpClient();

Future<HttpClientRequest> switchFunc(
    Method method, HttpClientRequest? request, Uri uri) async {
  switch (method) {
    case Method.GET:
      return await client.getUrl(uri);
    case Method.POST:
      return await client.postUrl(uri);
    case Method.PUT:
      return await client.putUrl(uri);
    case Method.PATCH:
      return await client.patchUrl(uri);
    case Method.DELETE:
      return await client.deleteUrl(uri);
  }
}

void addHeaders(HttpClientRequest? request) {
    request!.headers.contentType = ContentType.json;
    request.headers.add("Accept", "application/json");


  if (token != null) {
    request.headers.add(
        "Authorization", "Bearer ${token}");
  }
}

void addBody(
    HttpClientRequest? request, Map<String, dynamic>? body) {
    if (body != null) {
      request!.write(jsonEncode(body));
  }
}

HttpHeaders getHeaders(HttpClientRequest? request) {
  return request!.headers;
}

String getUrl(String endPoint) {
  return baseUrl + endPoint;
}
