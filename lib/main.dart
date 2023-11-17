import 'package:flutter/material.dart';
import 'package:webf/webf.dart';
import 'package:webf/devtools.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      debugDumpLayerTree();
    });
    // Kraken kraken = Kraken(bundle: KrakenBundle.fromUrl('http://kraken.oss-cn-hangzhou.aliyuncs.com/demo/guide-styles.js'));
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: const HelloWorldPage(),
    );
  }
}

class HelloWorldPage extends StatelessWidget {
  const HelloWorldPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Hello World", style: TextStyle(color: Colors.blue)),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  // @override
  // Widget build(BuildContext context) {
  //   final MediaQueryData queryData = MediaQuery.of(context);
  //   final Size viewportSize = queryData.size;

  //   return Scaffold(
  //     // appBar: AppBar(
  //     //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
  //     //   title: Text(widget.title),
  //     // ),
  //     body: Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: <Widget>[
  //           // const Text(
  //           //   'You have pushed the button this many times:',
  //           // ),
  //           // Text(
  //           //   '$_counter',
  //           //   style: Theme.of(context).textTheme.headlineMedium,
  //           // ),
  //           // Text("hello vue", style: Theme.of(context).textTheme.headlineSmall),
  //           WebF(
  //             devToolsService: ChromeDevToolsService(), // Enable Chrome DevTools Services
  //             viewportWidth: viewportSize.width - queryData.padding.horizontal, // Adjust the viewportWidth
  //             viewportHeight: viewportSize.height - queryData.padding.vertical, // Adjust the viewportHeight
  //             // bundle: WebFBundle.fromContent('http://kraken.oss-cn-hangzhou.aliyuncs.com/demo/guide-styles.js'), // The page entry point
  //             // bundle: WebFBundle.fromUrl('http://10.253.64.135:8081'), // The page entry point
  //             bundle: WebFBundle.fromUrl('assets:assets/index.html'), // The page entry point
  //           ),
  //         ],
  //       ),
  //     ),
  //     floatingActionButton: FloatingActionButton(
  //       onPressed: _incrementCounter,
  //       tooltip: 'Increment',
  //       child: const Icon(Icons.add),
  //     ), // This trailing comma makes auto-formatting nicer for build methods.
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData queryData = MediaQuery.of(context);
    final Size viewportSize = queryData.size;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            WebF(
              devToolsService: ChromeDevToolsService(), // Enable Chrome DevTools Services
              viewportWidth: viewportSize.width - queryData.padding.horizontal, // Adjust the viewportWidth
              viewportHeight: viewportSize.height - queryData.padding.vertical, // Adjust the viewportHeight
              bundle: WebFBundle.fromUrl('http://localhost:8081/'), // The page entry point
            ),
          ],
        ),
      ));
  }
}
