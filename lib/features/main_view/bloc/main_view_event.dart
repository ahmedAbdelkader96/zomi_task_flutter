part of 'main_view_bloc.dart';

@immutable
abstract class MainViewEvent extends Equatable {
  const MainViewEvent();
}

class FetchBlogs extends MainViewEvent {
  final String query;
  final BuildContext context;
  const FetchBlogs({ required this.context, required this.query});
  @override
  List<Object?> get props => [];
}


