part of 'launchzoom_cubit.dart';

@immutable
abstract class LaunchzoomState {}

class LaunchzoomInitial extends LaunchzoomState {}

class LaunchzoomSuccess extends LaunchzoomState {}

class LaunchzoomFailed extends LaunchzoomState {}
