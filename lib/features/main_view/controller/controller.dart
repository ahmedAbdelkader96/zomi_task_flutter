import 'package:http/http.dart' as http;
import 'package:task/features/main_view/repository/repository.dart';

class MainViewController {
  final repo = MainViewRepository();

  Future<http.Response> fetchBlogs({required String query}) {
    return repo.fetchBlogs(query: query);
  }
}
