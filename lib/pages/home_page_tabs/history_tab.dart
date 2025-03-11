import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_bloc/blocs/bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_login_bloc/models/youtube_video.dart';
import 'package:flutter_login_bloc/widgets/youtube_video_item.dart';

class HistoryTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<MasterBloc>(context);

    return BlocBuilder<MasterBloc, MasterState>(
      builder: (_, state) {
        if (state.history.length == 0) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SvgPicture.asset('assets/icons/box.svg', width: 80),
                SizedBox(height: 10),
                Text("No hay datos para mostrar"),
              ],
            ),
          );
        }
        return ListView.builder(
          itemBuilder: (_, index) {
            final YouTubeVideo item = state.history[index];
            return YouTubeVideoItem(
              item: item,
              onDismissed: () {
                bloc.add(MasterRemoveFromHistory(index));
              },
            );
          },
          itemCount: state.history.length,
        );
      },
      buildWhen: (prevState, newState) =>
          prevState.history.length != newState.history.length,
    );
  }
}
