part of 'main_view_bloc.dart';

abstract class MainViewState extends Equatable {
  const MainViewState();
}

class MainViewInitialState extends MainViewState {
  @override
  List<Object> get props => [];
}

class LoadingToFetchBlogsState extends MainViewState {
  @override
  List<Object> get props => [];
}

class DoneToFetchBlogsState extends MainViewState {
  final List<BlogModel> blogs;

  const DoneToFetchBlogsState({required this.blogs});

  @override
  List<Object> get props => [];
}

class ErrorToFetchBlogsState extends MainViewState {
  final String message;

  const ErrorToFetchBlogsState({required this.message});

  @override
  List<Object> get props => [];
}
