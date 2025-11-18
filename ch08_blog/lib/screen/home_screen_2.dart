import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key});

  @override
  State<HomeScreen2> createState() => HomeScreen2State();
}

class HomeScreen2State extends State<HomeScreen2> {
  late final WebViewController _controller;
  final TextEditingController _urlController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse("https://www.chatgpt.com"));
  }

  /// URL 입력 후 로드
  void loadUrl() {
    final text = _urlController.text.trim();
    if (text.isNotEmpty) {
      final formattedUrl = text.startsWith('http') ? text : 'https://$text';
      _controller.loadRequest(Uri.parse(formattedUrl));
      _urlController.clear();
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  // 뒤로 가기
  Future<void> goBack() async {
    if (await _controller.canGoBack()) {
      await _controller.goBack();
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("뒤로 갈 페이지가 없습니다.")));
    }
  }

  // 앞으로 가기
  Future<void> goForward() async {
    if (await _controller.canGoForward()) {
      await _controller.goForward();
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("앞으로 갈 페이지가 없습니다.")));
    }
  }

  // 새로 고침
  Future<void> reload() async {
    await _controller.reload();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _urlController,
                  decoration: const InputDecoration(
                    hintText: "Enter URL",
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 8),
                  ),
                  onSubmitted: (_) => loadUrl(),
                ),
              ),
              IconButton(icon: const Icon(Icons.search), onPressed: loadUrl),
            ],
          ),
        ),
        Expanded(child: WebViewWidget(controller: _controller)),
      ],
    );
  }
}
