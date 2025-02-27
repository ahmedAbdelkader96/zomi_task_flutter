import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:task/features/main_view/repository/irepository.dart';
import 'package:http/http.dart' as http;
import 'package:task/global/methods_helpers_functions/local_storage_helper.dart';

class MainViewRepository implements IMainViewRepository {
  @override
  Future<http.Response> fetchBlogs({required String query}) async {
    try {
      String? token = await LocalStorageHelper.getString(key: 'token');

      var headers = {"Authorization": "Bearer $token"};
      var url = Uri.parse(
          '${dotenv.env['end_point']}/blogs${query.isNotEmpty ? '?q=$query' : ''}');
      var res = await http
          .get(url, headers: headers)
          .timeout(const Duration(seconds: 60));
      return res;
    } catch (e) {
      rethrow;
    }
  }
}
