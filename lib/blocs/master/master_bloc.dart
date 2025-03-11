import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_login_bloc/models/youtube_video.dart';

part 'master_event.dart';
part 'master_state.dart';

class MasterBloc extends Bloc<MasterEvent, MasterState> {
  MasterBloc(super.initialState);

  MasterState get initialState => MasterState.initialState();

  Stream<MasterState> mapEventToState(MasterEvent event) async* {
    if (event is MasterSetTab) {
      yield state.copyWith(currentTab: event.tab);
    } else if (event is MasterAddToHistory) {
      yield* _addToHistory(event);
    } else if (event is MasterRemoveFromHistory) {
      yield* _removeFromHistory(event);
    } else if (event is MasterLogOut) {
      yield state.copyWith(history: [], currentTab: 0);
    } else if (event is MasterAddToFavorites) {
      yield* _addToFavorites(event);
    }
  }

  Stream<MasterState> _addToHistory(MasterAddToHistory event) async* {
    final int index = state.history
        .indexWhere((item) => item.videoId == event.youTubeVideo.videoId);

    if (index == -1) {
      // event.youTubeVideo
      final history = List<YouTubeVideo>.from(this.state.history);
      history.add(event.youTubeVideo);
      yield this.state.copyWith(history: history);
    }
  }

  Stream<MasterState> _addToFavorites(MasterAddToFavorites event) async* {
    final int index = state.favorites
        .indexWhere((item) => item.videoId == event.youTubeVideo.videoId);

    if (index == -1) {
      // event.youTubeVideo
      final favorites = List<YouTubeVideo>.from(state.favorites);
      favorites.add(event.youTubeVideo);
      yield state.copyWith(favorites: favorites);
    }
  }

  Stream<MasterState> _removeFromHistory(MasterRemoveFromHistory event) async* {
    final history = List<YouTubeVideo>.from(state.history);
    history.removeAt(event.index);
    yield state.copyWith(history: history);
  }
}
