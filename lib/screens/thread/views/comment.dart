import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:voz/screens/webview/webview.dart';

import '../../../interfaces/comment.dart';

class Comment {
  static Widget normal(CommentInterface? comment) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(Get.context!).colorScheme.onBackground,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Column(
        children: [
          ListTile(
            dense: true,
            title: Builder(
              builder: (_) {
                if (comment != null) {
                  return Text(
                    comment.memberName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  );
                }

                return Container(
                  decoration: BoxDecoration(
                    color: Theme.of(Get.context!).colorScheme.background,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Text(''),
                );
              },
            ),
            subtitle: Builder(
              builder: (_) {
                if (comment != null) {
                  return Text(
                    comment.memberTitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  );
                }

                return Container(
                  decoration: BoxDecoration(
                    color: Theme.of(Get.context!).colorScheme.background,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Text(''),
                );
              },
            ),
            leading: CircleAvatar(
              backgroundColor: Theme.of(Get.context!).colorScheme.background,
              child: Builder(
                builder: (_) {
                  if (comment != null && comment.memberAvatar != '') {
                    return Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: CachedNetworkImage(
                            imageUrl: comment.memberAvatar,
                          ),
                        ),
                        comment.memberIsOnline
                            ? Positioned(
                                right: 0,
                                bottom: 0,
                                child: Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    );
                  }
                  return Container();
                },
              ),
            ),
            trailing: comment != null && comment.newIndicator
                ? Container(
                    child: Text('NEW'),
                  )
                : null,
          ),
          Container(
            height: 1,
            color: Colors.grey.withOpacity(.15),
          ),
          Builder(
            builder: (_) {
              if (comment != null) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: comment.contents.length,
                  itemBuilder: (_, index) {
                    return Html(
                      data: comment.contents[index],
                      onLinkTap: (url, context, attributes, element) {
                        Get.to(
                          () => WebviewScreen(url: url!),
                        );
                      },
                    );
                  },
                );
              }

              return Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Theme.of(Get.context!).colorScheme.background,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Text(''),
                      ),
                    );
                  },
                ),
              );
            },
          ),
          // Builder(
          //   builder: (_) {
          //     print(comment!.memberSignature);
          //     return Container();
          //   },
          // ),
        ],
      ),
    );
  }
}
