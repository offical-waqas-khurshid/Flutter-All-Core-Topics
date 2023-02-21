import 'dart:async';
import 'dart:developer';

import 'Events.dart';
class CounterBloc {
  StreamController<CounterEvent> _eventStreamController = StreamController();
  StreamController<Counter> _stateStreamController = StreamController();
  late Counter counter;
  CounterBloc() {
    counter = const Counter(0);
    _eventStreamController.stream.listen(mapEventToState);
  }
  StreamSink<CounterEvent> get eventSink => _eventStreamController.sink;
  Stream<Counter> get stateStream => _stateStreamController.stream;

  void mapEventToState(CounterEvent event) {
    if (event is IncrementCounterEvent) {
      counter = Counter(counter.count + 1);
      _stateStreamController.sink.add(counter);
    } else if (event is DecrementCounterEvent) {
      counter = Counter(counter.count - 1);
      _stateStreamController.sink.add(counter);
    }
  }
}