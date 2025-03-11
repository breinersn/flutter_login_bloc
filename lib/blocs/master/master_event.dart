part of 'master_bloc.dart';

abstract class MasterEvent {}

class MasterSetTab extends MasterEvent {
  final int tab;
  MasterSetTab(this.tab);
}

class MasterAddToHistory extends MasterEvent {
  final YouTubeVideo youTubeVideo;
  MasterAddToHistory(this.youTubeVideo);
}

class MasterAddToFavorites extends MasterEvent {
  final YouTubeVideo youTubeVideo;
  MasterAddToFavorites(this.youTubeVideo);
}

class MasterRemoveFromHistory extends MasterEvent {
  final int index;
  MasterRemoveFromHistory(this.index);
}

class MasterLogOut extends MasterEvent {}
