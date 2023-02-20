import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:voz/config/api.dart';

import '../forum/index.dart';

class WebviewScreen extends StatefulWidget {
  final String url;
  const WebviewScreen({super.key, required this.url});

  @override
  State<WebviewScreen> createState() => WebviewScreenState();
}

class WebviewScreenState extends State<WebviewScreen> {
  String _title = 'about:blank';
  double _progress = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _title,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        bottom: _progress >= 1
            ? null
            : PreferredSize(
                preferredSize: const Size.fromHeight(6.0),
                child: LinearProgressIndicator(
                  value: _progress,
                ),
              ),
      ),
      body: InAppWebView(
        onTitleChanged: (controller, title) {
          _title = title ?? 'about:blank';
          setState(() {});
        },
        onProgressChanged: (controller, progress) {
          _progress = (progress / 100).toDouble();
          setState(() {});
        },
        initialUrlRequest: URLRequest(
          url: WebUri.uri(
            Uri.parse(widget.url),
          ),
        ),
      ),
    );
  }
}
