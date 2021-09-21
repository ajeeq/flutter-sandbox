import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'Clock.dart';


final valueProvider = Provider<int>((ref) {
  return 36;
}); // Provider

final counterStateProvider = StateProvider<int>((ref) {
  return 0;
}); // StateProvider

// StateNotifierProvider
final clockProvider = StateNotifierProvider<Clock, DateTime>((ref) {
  return Clock();
});

final streamProvider = StreamProvider.autoDispose<int>((ref) {
  return Stream.fromIterable([36, 72]);
});

final futureProvider = FutureProvider<int>((ref) {
  return Future.value(36);
});

//===============//
// ref.onDispose //
//===============//
// final myProvider = FutureProvider.autoDispose((ref) async {
//   // An object from package:dio that allows cancelling http requests
//   final cancelToken = CancelToken();
//   // When the provider is destroyed, cancel the http request
//   ref.onDispose(() => cancelToken.cancel());

//   // Fetch our data and pass our `cancelToken` for cancellation to work
//   final response = await dio.get('path', cancelToken: cancelToken);
//   // If the request completed successfully, keep the state
//   ref.maintainState = true;
//   return response;
// });

//=================//
// family modifier //
//=================//
final streamProviderTwo = StreamProvider.autoDispose.family<int, int>((ref, offset) {
  return Stream.fromIterable([36 + offset, 72 + offset]);
});

class BasicHome extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(valueProvider); // Provider
    final counter = ref.watch(counterStateProvider); // StateProvider
    final currentTime = ref.watch(clockProvider); // StateNotifierProvider
    final streamAsyncValue = ref.watch(streamProvider); // StreamProvider
    // final futureAsyncValue = ref.watch(futureProvider); // FutureProvider
    // final streamAsyncValueTwo = ref.watch(streamProviderTwo(10)); // StreamProvider + family modifier

    // format the time as `hh:mm:ss`
    final timeFormatted = DateFormat.Hms().format(currentTime);

    // Listening to Provider State Changes
    ref.listen(counterStateProvider, (StateController<int> counterState) {
      // note: this callback executes when the provider value changes,
      // not when the build method is called
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Value is ${counterState.state}')),
      );
    });
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Sandbox - Riverpod"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              'Provider value: $value',
              style: Theme.of(context).textTheme.headline4,
            ),
            Divider(),
            Text(
              'StateProvider value: ${counter.state}',
              style: Theme.of(context).textTheme.headline4,
            ),
            Divider(),
            Text(
              'StateNotifierProvider value: ' + timeFormatted,
              style: Theme.of(context).textTheme.headline4,
            ),
            Divider(),
            streamAsyncValue.when(
              data: (data) => Text('StreamProvider value: $data'),
              loading: () => CircularProgressIndicator(),
              error: (e, st) => Text('Error: $e'),
            ),
            Divider(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // access the provider via ref.read(), then increment its state.
        onPressed: () => ref.read(counterStateProvider).state++,
        child: Icon(Icons.add),
      ),
    );
  }
  
}