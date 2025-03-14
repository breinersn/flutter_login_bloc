import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_login_bloc/models/youtube_video.dart';

part 'master_event.dart';
part 'master_state.dart';

class MasterBloc extends Bloc<MasterEvent, MasterState> {
  MasterBloc()
      : super(const MasterState(currentTab: 0, history: [], favorites: [])) {
    on<MasterSetTab>(_onSetTab);
    on<MasterAddToFavorites>(_addToFavorites);
    on<MasterAddToHistory>(_addToHistory);
    on<MasterRemoveFromHistory>(_removeFromHistory);
  }

  mapEventToState(MasterEvent event, Emitter<MasterState> emit) {
    if (event is MasterSetTab) {
      _onSetTab(event, emit);
      state.copyWith(currentTab: event.tab);
    } else if (event is MasterAddToHistory) {
      _addToHistory(event, emit);
    } else if (event is MasterRemoveFromHistory) {
      _removeFromHistory(event, emit);
    } else if (event is MasterLogOut) {
      emit(state.copyWith(history: [], currentTab: 0));
    } else if (event is MasterAddToFavorites) {
      _addToFavorites(event, emit);
    }
  }

  void _onSetTab(MasterSetTab event, Emitter<MasterState> emit) {
    emit(state.copyWith(currentTab: event.tab));
  }

  _addToHistory(MasterAddToHistory event, emit) {
    final int index = state.history
        .indexWhere((item) => item.videoId == event.youTubeVideo.videoId);

    if (index == -1) {
      // event.youTubeVideo
      final history = List<YouTubeVideo>.from(state.history);
      history.add(event.youTubeVideo);
      emit(state.copyWith(history: history));
    }
  }

  _addToFavorites(MasterAddToFavorites event, emit) {
    final int index = state.favorites
        .indexWhere((item) => item.videoId == event.youTubeVideo.videoId);

    if (index == -1) {
      // event.youTubeVideo
      final favorites = List<YouTubeVideo>.from(state.favorites);
      favorites.add(event.youTubeVideo);
      emit(state.copyWith(favorites: favorites));
    }
  }

  _removeFromHistory(MasterRemoveFromHistory event, emit) {
    final history = List<YouTubeVideo>.from(state.history);
    history.removeAt(event.index);
    emit(state.copyWith(history: history));
  }
}
