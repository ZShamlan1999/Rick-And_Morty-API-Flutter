import 'package:freezed_annotation/freezed_annotation.dart';
part 'characters_state.freezed.dart';

@freezed
class CharactersState<T> with _$CharactersState<T> {
  const factory CharactersState.initial() = _Initial;
  const factory CharactersState.loading() = Loading;
  const factory CharactersState.success(T data) = Success<T>;
  const factory CharactersState.error({required String error}) = Error;
}
