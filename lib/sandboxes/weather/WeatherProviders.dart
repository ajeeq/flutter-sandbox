import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandbox_riverpod/sandboxes/weather/WeatherNotifier.dart';
import 'package:sandbox_riverpod/sandboxes/weather/WeatherRepository.dart';

final weatherRepositoryProvider = Provider<WeatherRepository>(
  (ref) => FakeWeatherRepository(),
);

final weatherNotifierProvider = StateNotifierProvider(
  (ref) => WeatherNotifier(ref.watch(weatherRepositoryProvider)),
);
