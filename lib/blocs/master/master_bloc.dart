import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_login_bloc/models/youtube_video.dart';

part 'master_event.dart';
part 'master_state.dart';

class MasterBloc extends Bloc<MasterEvent, MasterState> {
  MasterBloc() : super(MasterState(currentTab: 0, history: [], favorites: [])) {
    on<MasterSetTab>(_onSetTab);
  }

  // MasterState get initialState => MasterState.initialState();

  mapEventToState(MasterEvent event, Emitter<MasterState> emit) async {
    if (event is MasterSetTab) {
      _onSetTab(event, emit);
      emit(state.copyWith(currentTab: event.tab));
    } else if (event is MasterAddToHistory) {
      on<MasterAddToHistory>(_addToHistory(event));
      emit(_addToHistory(event));
    } else if (event is MasterRemoveFromHistory) {
      on<MasterRemoveFromHistory>(_removeFromHistory(event));
      on<MasterLogOut>(_removeFromHistory(event));
      emit(_removeFromHistory(event));
    } else if (event is MasterLogOut) {
      emit(state.copyWith(history: [], currentTab: 0));
    } else if (event is MasterAddToFavorites) {
      on<MasterAddToFavorites>(_addToFavorites(event));
      emit(_addToFavorites(event));
    }
  }

  void _onSetTab(MasterSetTab event, Emitter<MasterState> emit) {
    emit(state.copyWith(currentTab: event.tab));
  }

  _addToHistory(MasterAddToHistory event) async {
    final int index = state.history
        .indexWhere((item) => item.videoId == event.youTubeVideo.videoId);

    if (index == -1) {
      // event.youTubeVideo
      final history = List<YouTubeVideo>.from(this.state.history);
      history.add(event.youTubeVideo);
      state.copyWith(history: history);
    }
  }

  _addToFavorites(MasterAddToFavorites event) async {
    final int index = state.favorites
        .indexWhere((item) => item.videoId == event.youTubeVideo.videoId);

    if (index == -1) {
      // event.youTubeVideo
      final favorites = List<YouTubeVideo>.from(state.favorites);
      favorites.add(event.youTubeVideo);
      state.copyWith(favorites: favorites);
    }
  }

  _removeFromHistory(MasterRemoveFromHistory event) async {
    final history = List<YouTubeVideo>.from(state.history);
    history.removeAt(event.index);
    state.copyWith(history: history);
  }
}
