import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final _formKey = GlobalKey<_MyHomePageState>();
  final _mailFormKey = GlobalKey<FormFieldState<String>>();
  final _passwordFormKey = GlobalKey<FormFieldState<String>>();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            const Text("メールアドレス"),
            _buildMailForm(),
            const SizedBox(height: 8),
            const Text("パスワード"),
            _buildPasswordForm(),
          ],
        ),
      ),
    );
  }

  Widget _buildMailForm() {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        TextFormField(
          key: _mailFormKey,
          keyboardType: TextInputType.emailAddress,
          autofocus: true,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.only(left: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            suffixIcon: Icon(Icons.close),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordForm() {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        TextFormField(
          key: _passwordFormKey,
          keyboardType: TextInputType.visiblePassword,
          autofocus: true,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.only(left: 16, right: 32),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            suffixIcon: Icon(Icons.visibility),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 32),
          child: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
