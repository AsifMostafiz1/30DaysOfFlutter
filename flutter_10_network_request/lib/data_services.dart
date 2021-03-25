import 'package:http/http.dart' as http;

class DataService {
  Future<String> makeApiRequest() async {

    https://jsonplaceholder.typicode.com/posts
    //http://api.openweathermap.org/data/2.5/weather?q=Pabna&appid=3b9a0e5e60c2f30f6af54e84222bd83f
    final quaryParameters ={
      "q":"Pabna" , "appid":"3b9a0e5e60c2f30f6af54e84222bd83f"
    };

    final uri = Uri.https("api.openweathermap.org", "/data/2.5/weather", quaryParameters);

    final response = await http.get(uri);

    return response.body;
  }
}
