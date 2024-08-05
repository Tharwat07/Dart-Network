import 'dart:convert';
import 'dart:io';
import 'network_config.dart';

HttpHeaders? headers;

class NetworkService {
  Future callAPI<T>(Method? method, String path,
      {Map<String, dynamic>? body, bool? formData}) async {
    if (formData == true) {
      // dio.FormData data = dio.FormData.fromMap(body!);
      // final response = await dio.Dio().post(
      //   getUrl(path),
      //   data: data,
      //   options: dio.Options(
      //     contentType: dio.Headers.formUrlEncodedContentType,
      //     headers: {
      //       "Accept": "application/json",
      //       'lang': Get.locale!.languageCode,
      //     },
      //   ),
      // );
      // if (response.statusCode == 200) {
      //   return response;
      // } else {}
    } else {
      final Uri uri = Uri.parse(getUrl(path));

      HttpClientRequest? request;
      request = await switchFunc(method!, request, uri);

      addHeaders(request);

      addBody(request, body);

      headers = getHeaders(request);

      HttpClientResponse response = await request.close();

      response.timeout(Duration(seconds: 60));

      String responseBody = await response.transform(utf8.decoder).join();

      final decodedResponse = jsonDecode(responseBody);

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        return decodedResponse as T;
      } else {
        print('Failed to $method Status code: ${response.statusCode}');
        throw Exception(
            'Failed to $method Status code: ${response.statusCode}');
      }
    }
  }
}
