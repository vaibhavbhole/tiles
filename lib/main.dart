import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiles/data/remote/network/NetworkApiService.dart';
import 'package:tiles/models/User.dart';
import 'package:tiles/repositories/UserRepository.dart';
import 'package:tiles/viewmodels/ProductVM.dart';
import 'package:tiles/viewmodels/UserVM.dart';
import 'package:tiles/views/home/home_view.dart';
import 'package:tiles/views/login_view.dart';
import 'package:tiles/views/profile_view.dart';
import 'package:tiles/views/splash_view.dart';

void main() async {
  
  // NetworkApiService api=NetworkApiService();
  // Map<String,dynamic> content={"Product_iD":null,"PageNo":1,"PageSize":10,"Search":null};
  //
  // String token= "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJDdXN0b21lcklEIjoiMTMwMjI1IiwiVXNlclR5cGUiOiJDIiwiRW1haWwiOiJzYW5rZXR0ZXN0QHlvcG1haWwuY29tIiwiQ29udGFjdE5vIjoiKzk2NjEyMzQxMjM0NSIsIkN1c3RvbWVyTmFtZSI6InNhbmtldCB0ZXN0IiwibmJmIjoxNjQ1NzkyNzUzLCJleHAiOjE2NDU3OTk5NTMsImlhdCI6MTY0NTc5Mjc1M30.zaeslbEcWHOG_dvdJeSoPoB48XP-QzqeWmv2uZQ7m6g";
  //
  // dynamic response = await api.postResponse("commonAPI/productMst_list", token, content);
  //
  // print(response);
  


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> UserVm()),
        ChangeNotifierProvider(create: (context) => ProductVm()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/' : (context) => SplashView(),
          '/login': (context) => LoginView(),
          '/home' : (context) => HomeView(),
          '/profile': (context) => ProfileView(),
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     //UserRepository userRepository=UserRepository();
     //userRepository.postLogin("sankettest@yopmail.com", "1234").then((user) => print(user.email));

    // userRepository.logOut().then((value) {
    //   userRepository.isLoggedIn().then((value) => print("Login Info: $value"));
    //
    // });
    //userRepository.getProducts(1, 10).then((value) => print(value[0].productId));
  }

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

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
