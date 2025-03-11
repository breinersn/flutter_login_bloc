part of 'master_bloc.dart';

class MasterState extends Equatable {
  final int currentTab;
  final List<YouTubeVideo> history;
  final List<YouTubeVideo> favorites;

  const MasterState(
      {required this.currentTab,
      required this.history,
      required this.favorites});

  static MasterState initialState() =>
      const MasterState(currentTab: 0, history: [], favorites: []);

  MasterState copyWith(
      {int? currentTab,
      List<YouTubeVideo>? history,
      List<YouTubeVideo>? favorites}) {
    return MasterState(
        currentTab: currentTab ?? this.currentTab,
        history: history ?? this.history,
        favorites: favorites ?? this.favorites);
  }

  @override
  List<Object> get props => [currentTab, history, favorites];
}
