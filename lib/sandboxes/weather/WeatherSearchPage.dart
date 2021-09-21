/// Resources:
/// - https://github.com/ResoCoder/flutter-statenotifier-riverpod-tutorial
/// - https://resocoder.com/2020/12/11/flutter-statenotifier-riverpod-tutorial-immutable-state-management/



import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:intl/date_symbols.dart';
import 'package:sandbox_riverpod/sandboxes/weather/WeatherNotifier.dart';
import 'package:sandbox_riverpod/sandboxes/weather/Weather.dart';
import 'package:sandbox_riverpod/sandboxes/weather/WeatherProviders.dart';

// class WeatherSearchPage extends StatefulWidget {
//   @override
//   _WeatherSearchPageState createState() => _WeatherSearchPageState();
// }

class WeatherSearchPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.listen(weatherNotifierProvider, (StateController<int> counterState) {
    //   // note: this callback executes when the provider value changes,
    //   // not when the build method is called
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(content: Text('Value is ${counterState.state}')),
    //   );
    // });

    

    return Scaffold(
      appBar: AppBar(
        title: Text("Weather Search"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        child: Consumer(
          builder: (_, WidgetRef ref, __) {
            final state = ref.watch(weatherNotifierProvider);
            
            ref.listen(weatherNotifierProvider, (count) {
              print('state: $count');
            });

            if (state is WeatherInitial) {
              return buildInitialInput();
            } else if (state is WeatherLoading) {
              return buildLoading();
            } else if (state is WeatherLoaded) {
              return buildColumnWithData(state.weather);
            } else {
              // (state is WeatherError)
              return buildInitialInput();
            }
          },
        ),
      ),
    );
  }

  Widget buildInitialInput() {
    return Center(
      child: CityInputField(),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Column buildColumnWithData(Weather weather) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          weather.cityName,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          // Display the temperature with 1 decimal place
          "${weather.temperatureCelsius.toStringAsFixed(1)} °C",
          style: TextStyle(fontSize: 80),
        ),
        CityInputField(),
      ],
    );
  }
}

class CityInputField extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        onSubmitted: (value) => submitCityName(context, value, ref),
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: "Enter a city",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }

  void submitCityName(BuildContext context, String cityName, WidgetRef ref) {
    ref.read(weatherNotifierProvider).getWeather(cityName);
  }
}
