import 'dart:async';
import 'dart:developer';
import 'dart:isolate';

void main() => Future<void>(() async {
  final isolate = await IsolateController.spawn<int, String>(
    (payload, send) {
      for (var i = 1, r = 1; i <= payload; i++, r *= i) {
        send('$i! = $r');
      }
    },
    7,
  )..stream.listen((event) {
    print("Main Isolate: Received: $event");
  });

  await Future<void>.delayed(const Duration(seconds: 1));
  isolate.close();
  log("Main Isolate: End");
});

typedef IsolateHandler<Payload, Out> = FutureOr<void> Function(
  Payload payload,
  void Function(Out out) send,
);

class IsolateController<Out> {
  IsolateController._({
    required this.stream,
    required this.close,
  });

  static Future<void> _$entryPoint<Payload, Out>(
      _IsolateArgument<Payload, Out> argument) async {
    try {
      log("Isolate Entry Point: Start");
      await argument();
    } finally {
      argument.sendPort.send(#exit);
      log("Isolate Entry Point: End");
    }
  }

  static Future<IsolateController<Out>> spawn<Payload, Out>(
    IsolateHandler<Payload, Out> handler,
    Payload payload,
  ) async {
    final receivePort = ReceivePort();
    final argument = _IsolateArgument<Payload, Out>(
      handler: handler,
      payload: payload,
      sendPort: receivePort.sendPort,
    );
    final isolate = await Isolate.spawn<_IsolateArgument<Payload, Out>>(
      _$entryPoint<Payload, Out>,
      argument,
      errorsAreFatal: true,
      debugName: 'MyIsolate',
    );

    final outputController = StreamController<Out>.broadcast();
    late final StreamSubscription<Object?> rcvSubscription;

    void close() {
      receivePort.close();
      rcvSubscription.cancel().ignore();
      outputController.close().ignore();
      isolate.kill();
      log("Isolate Closed");
    }

    rcvSubscription = receivePort.listen(
      (message) {
        if (message is Out) {
          outputController.add(message);
        } else if (message == #exit) {
          close();
        }
      },
      onError: outputController.addError,
      cancelOnError: false,
    );

    log("Isolate Spawned"); // PART_2
    return IsolateController<Out>._(
      stream: outputController.stream,
      close: close,
    );
  }

  final Stream<Out> stream;
  final void Function() close;
}

class _IsolateArgument<Payload, Out> {
  _IsolateArgument({
    required this.handler,
    required this.payload,
    required this.sendPort,
  });

  final IsolateHandler<Payload, Out> handler;
  final Payload payload;
  final SendPort sendPort;

  FutureOr<void> call() => handler(
        payload,
        (Out data) => sendPort.send(data),
      );
}
