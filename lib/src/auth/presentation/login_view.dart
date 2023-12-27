import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final Completer<WebViewController> _webViewController =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.waves_rounded),
          const SizedBox(height: 16),
          const Text(
            "Millions of songs.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              decoration: TextDecoration.none,
            ),
          ),
          const Text(
            "Free on Spotify.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              decoration: TextDecoration.none,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => _openWebView(context),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green),
            ),
            child: const Text(
              "Log in",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _openWebView(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => WebView(
          initialUrl:
              'http://10.0.2.2:3001/auth/login', // Replace with your actual URL
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (controller) {
            if (!_webViewController.isCompleted) {
              _webViewController.complete(controller);
            }
          },
          navigationDelegate: (NavigationRequest request) {
            // Handle redirects here
            if (request.url.startsWith('http://10.0.2.2:3001')) {
              // Do something when the redirect is detected
              Navigator.pop(
                  context); // Close the WebView when redirect is detected
              return NavigationDecision
                  .prevent; // Prevent the WebView from loading the URL
            }
            return NavigationDecision.navigate;
          },
        ),
      ),
    );
  }
}
