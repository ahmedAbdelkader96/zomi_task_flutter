import 'package:http/http.dart' as http;


abstract class IMainViewRepository {

  Future<http.Response> fetchBlogs({required String query});
}
