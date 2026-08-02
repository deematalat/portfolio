// ignore_for_file: avoid_web_libraries_in_flutter
// This project targets Flutter Web only, so the web-only dart:html/dart:ui_web
// APIs used here to embed a live iframe are always available at runtime.
import 'dart:html' as html;
import 'dart:ui_web' as ui_web;
import 'package:flutter/material.dart';

/// Embeds a live HTML iframe into the Flutter web page via a registered
/// platform view. One view factory is registered per unique [url].
class WebIframe extends StatefulWidget {
  final String url;
  const WebIframe({super.key, required this.url});

  @override
  State<WebIframe> createState() => _WebIframeState();
}

class _WebIframeState extends State<WebIframe> {
  static final Set<String> _registeredViewTypes = {};

  late final String _viewType;

  @override
  void initState() {
    super.initState();
    _viewType = 'iframe-${widget.url.hashCode}';
    if (_registeredViewTypes.add(_viewType)) {
      ui_web.platformViewRegistry.registerViewFactory(_viewType, (int viewId) {
        final iframe = html.IFrameElement()
          ..src = widget.url
          ..style.border = 'none'
          ..style.width = '100%'
          ..style.height = '100%'
          ..allowFullscreen = true;
        return iframe;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return HtmlElementView(viewType: _viewType);
  }
}
