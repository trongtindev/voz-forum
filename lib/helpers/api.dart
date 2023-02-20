/*
 * Nguyen Trong Tin | trongtin.dev@gmail.com
 */

import 'package:dio/dio.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart' show parse;
import 'package:voz/config/api.dart';
import 'package:voz/interfaces/comment.dart';

import '../interfaces/thread.dart';

class ApiHelper {
  static Future<Response> get(String url) async {
    var dio = Dio();

    dio.options.baseUrl = ApiConfig.baseUrl;
    dio.options.headers = {
      'Referer': 'https://voz.vn',
      'sec-ch-ua-mobile': '?1',
      'sec-ch-ua-platform': 'Android',
      'user-agent': 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36 Edg/110.0.0.0'
    };
    dio.options.sendTimeout = const Duration(seconds: 10);
    return await dio.get(url);
  }

  //static Future<String> post(String url) async {}

  static Future<List<ThreadInterface>> getThreads(String url) async {
    var response = await get(url);
    var document = parse(response.data.toString());

    var structItems = document.querySelectorAll('.structItemContainer .structItem');
    List<ThreadInterface> output = [];

    for (var element in structItems) {
      var memberAvatar = element.querySelector('img');

      output.add(ThreadInterface(
        element.querySelector('a[data-tp-primary="on"]')!.attributes['href']!, // url
        element.querySelector('a[data-tp-primary="on"]')!.text, // name
        element.querySelector('time[data-time-string]')!.text, // createdAt
        element.querySelector('.structItem-cell--meta dd')!.text, // replies
        element.querySelector('.structItem-cell--latest time')!.text, // createdAt
        element.querySelector('.structItem-parts .username')!.text, // memberName
        memberAvatar != null ? memberAvatar.attributes['src']! : '', // memberAvatar
      ));
    }

    return output;
  }

  static Future<List<CommentInterface>> getComments(String url) async {
    var response = await get(url);
    var document = parse(response.data.toString());

    var listArticles = document.querySelectorAll('.block-body article.js-inlineModContainer');
    List<CommentInterface> output = [];

    for (var article in listArticles) {
      List<String> contents = [];
      List<Element> elements = [];
      var content = article.querySelector('.bbWrapper');
      if (content != null) {
        for (var element in article.querySelectorAll('.bbWrapper *')) {
          if (element.outerHtml.startsWith('<img')) {
            if (element.attributes['src'] == null) {
              continue;
            }

            if (element.attributes['src']!.startsWith('/cdn-cgi') && element.attributes['src']!.contains('https://')) {
              element.attributes['src'] = 'https://${element.attributes['src']!.split('https://')[1]}';
            }
          } else if (element.outerHtml.startsWith('<script')) {
            element.remove();
            continue;
          }

          elements.add(element);
        }

        contents = [
          content.outerHtml,
        ];
      }

      var newIndicator = article.querySelector('.message-newIndicator');

      var memberName = article.querySelector('h4.message-name');
      var memberTitle = article.querySelector('h5.userTitle');
      var memberAvatar = article.querySelector('.avatar img');
      var memberSignature = article.querySelector('.message-signature .bbWrapper');

      // renderder
      var commentInterface = CommentInterface(
        contents, // content
        'N/A', // createdAt
        newIndicator != null,
        memberName == null ? 'N/A' : memberName.text, // memberName
        memberTitle == null ? 'N/A' : memberTitle.text, // memberTitle
        memberAvatar == null ? '' : memberAvatar.attributes['src']!, // memberAvatar
        article.querySelector('.message-avatar-online') != null, // memberIsOnline
        memberSignature?.text, // memberSignature
      );
      if (commentInterface.memberAvatar.contains('/cdn-cgi/') && commentInterface.memberAvatar.contains('https')) {
        commentInterface.memberAvatar = 'https://${commentInterface.memberAvatar.split('https://')[1]}';
        print(commentInterface.memberAvatar);
      }
      output.add(commentInterface);
    }

    return output;
  }

  static Future<dynamic> getCategories() async {}
}
