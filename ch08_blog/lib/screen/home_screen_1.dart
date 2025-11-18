import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({Key? key}) : super(key: key);

  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  late final WebViewController _webViewController;
  final TextEditingController _urlController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse("https://www.chatgpt.com"));
  }

  void _loadUrl() {
    final text = _urlController.text.trim();
    if (text.isNotEmpty) {
      final formattedUrl = text.startsWith('https') ? 'https://$text' : text;
      _webViewController.loadRequest(Uri.parse(formattedUrl));
      _urlController.clear();
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  Future<void> _goBack() async {
    if (await _webViewController.canGoBack()) {
      _webViewController.goBack();
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("뒤로 갈 페이지가 없습니다.")));
    }
  }

  Future<void> _goForward() async {
    if (await _webViewController.canGoForward()) {
      _webViewController.goForward();
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("앞으로 갈 페이지가 없습니다.")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebView Browser'),
        centerTitle: true,
        backgroundColor: Colors.yellow,
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: _goBack,
            tooltip: '뒤로 가기',
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: _goForward,
            tooltip: '앞으로 가기',
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 4.0,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _urlController,
                      decoration: const InputDecoration(
                        hintText: "Enter URL",
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                      ),
                      onSubmitted: (_) => _loadUrl(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: _loadUrl,
                  ),
                ],

              ),
            ),
            Expanded(child: WebViewWidget(controller: _webViewController)),
          ],
        ),
      ),
    );
  }
}
