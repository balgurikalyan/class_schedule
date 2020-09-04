import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:url_launcher/url_launcher.dart';

part 'launchzoom_state.dart';

class LaunchzoomCubit extends Cubit<LaunchzoomState> {
  LaunchzoomCubit() : super(LaunchzoomInitial());

  void launchZoom(String url)async{
    if (await canLaunch(url)) {
    await launch(url);
    
    emit(LaunchzoomInitial());

  } else {
    emit(LaunchzoomFailed());
  }
  }

  void restoreStates(){
    emit(LaunchzoomInitial());
  }
}
