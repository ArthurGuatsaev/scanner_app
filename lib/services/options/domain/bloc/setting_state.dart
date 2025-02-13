// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'setting_bloc.dart';

class SettingState {
  final bool sound;
  final bool music;
  SettingState({this.sound = true, this.music = true});

  SettingState copyWith({
    bool? sound,
    bool? music,
  }) {
    return SettingState(
      sound: sound ?? this.sound,
      music: music ?? this.music,
    );
  }
}
