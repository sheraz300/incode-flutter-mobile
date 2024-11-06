import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CustomWebviewScreen extends StatefulWidget {
  const CustomWebviewScreen({super.key, required this.url});

  final String url;

  @override
  State<CustomWebviewScreen> createState() => _CustomWebviewScreenState();
}

class _CustomWebviewScreenState extends State<CustomWebviewScreen> {
  late final WebViewController webController;
  double progress = 0.5;
  String str = '';
  final subSetState = GlobalKey();

  @override
  void initState() {
    webController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..loadRequest(Uri.parse(widget.url))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            this.progress = (progress / 100.0);
            debugPrint("Progress: $progress");
            subSetState.currentState?.setState(() {});
          },
          onPageStarted: (String url) {
            // CommonAlerts.showToast('Loading: $url');
          },
          onPageFinished: (String url) {
            // CommonAlerts.showToast('Loaded: $url');
          },
          onHttpError: (HttpResponseError error) {
            showDialog(
                context: context,
                builder: (c) {
                  return AlertDialog(
                    title: const Text('Error'),
                    content: Text(error.response.toString()),
                  );
                });
          },
          onWebResourceError: (WebResourceError error) {
            showDialog(
                context: context,
                builder: (c) {
                  return AlertDialog(
                    title: const Text('Error'),
                    content: Text(error.description.toString()),
                  );
                });
            str = error.description;
            subSetState.currentState?.setState(() {});
          },
        ),
      );
    debugPrint("Init state: ${widget.url}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Material(
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: const Text(
                "Fenix HUB",
                style: TextStyle(
                  color: Color(0xFFDD1527),
                  fontWeight: FontWeight.bold,
                ),
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(2),
                child: StatefulBuilder(
                  key: subSetState,
                  builder: (c, subState) {
                    if (str.isNotEmpty) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            str,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }

                    return Align(
                      alignment: Alignment.topCenter,
                      child: LinearProgressIndicator(
                        value: progress,
                        valueColor:
                            const AlwaysStoppedAnimation(Color(0xFF7D0C16)),
                        backgroundColor: Colors.grey,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              ),
            ),
            body: WebViewWidget(controller: webController),
          ),
        ),
      );
}
