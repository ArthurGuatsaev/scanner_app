import 'package:bloc/bloc.dart';

import '../setting_repository/setting_repository.dart';

part 'setting_event.dart';
part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  final SettingRepository repo;
  SettingBloc({required this.repo})
      : super(SettingState(sound: repo.sound, music: repo.music)) {
    on<ChangeModSoundEvent>(modSound);
    on<ChangeModMusicEvent>(modMusic);
  }

  modSound(ChangeModSoundEvent event, Emitter<SettingState> emit) {
    repo.sound = !state.sound;
    emit(state.copyWith(sound: !state.sound));
  }

  modMusic(ChangeModMusicEvent event, Emitter<SettingState> emit) {
    repo.music = !state.music;
    emit(state.copyWith(music: !state.music));
  }
}
