import 'package:sampleapi/Home/repo/model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<ArticleModel> getArticleApiData() async {
    var response = await http.get(Uri.parse("https://www.boredapi.com/api/activity/"));
    var activity;
    if(response.statusCode == 200){
     activity = articleModelFromJson(response.body);

     print(activity);
    }
    return activity;
  }
}