import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

final base_url = dotenv.get('BASE_URL');
GetStorage AsyncStorage = GetStorage();

getHttp(url) async {
  try {
    final Url = Uri.parse("${base_url}/${url}");
    // print(Url);
    var response = await http.get(
      Url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    return response;
  } catch (e) {
    return e;
  }
}

getHttpCustomUrl(url) async {
  try {
    final Url = Uri.parse(url);
    var response = await http.get(
      Url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    return response;
  } catch (e) {
    return e;
  }
}

deleteHttp(url) async {
  try {
    final Url = Uri.parse("${base_url}/${url}");
    var response = await http.delete(
      Url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    return response;
  } catch (e) {
    return e;
  }
}

postHttp(url, body) async {
  var URL = Uri.parse("${base_url}/${url}");
  try {
    var response = await http.post(
      URL,
      body: body,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        // 'Authorization':
        //     AsyncStorage.hasData('token') ? AsyncStorage.read("token") : ""
      },
    );
    //print(response.statusCode);
    return response;
  } catch (e) {
    return 'err';
  }
}

patchHttp(url, body) async {
  var URL = Uri.parse("${base_url}/${url}");
  try {
    var response = await http.patch(
      URL,
      body: body,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            AsyncStorage.hasData('token') ? AsyncStorage.read("token") : ""
      },
    );
    //print(response.statusCode);
    return response;
  } catch (e) {
    return 'err';
  }
}

postHttpWitoutToken(url, body) async {
  var URL = Uri.parse("${base_url}/${url}");
  try {
    var response = await http.post(
      URL,
      body: body,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    //print(response.statusCode);
    return response;
  } catch (e) {
    return 'err';
  }
}
