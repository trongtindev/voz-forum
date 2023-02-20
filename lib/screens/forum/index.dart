import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voz/helpers/api.dart';
import 'package:voz/interfaces/thread.dart';
import 'package:voz/screens/thread/index.dart';
import 'package:voz/widgets/section.dart';

class ForumScreen extends StatefulWidget {
  const ForumScreen({super.key});

  @override
  State<ForumScreen> createState() => ForumScreenState();
}

class ForumScreenState extends State<ForumScreen> {
  List<ThreadInterface> whatsNew = [];

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 250), onload);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VOZ'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const CircleAvatar(
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Icon(Icons.person_2_outlined),
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(),
      body: RefreshIndicator(
        onRefresh: () async {
          return await onload();
        },
        child: ListView(
          children: [
            buildWhatsNew(),
          ],
        ),
      ),
    );
  }

  buildWhatsNew() {
    return Section.normal(
      ListView.builder(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: whatsNew.isEmpty ? 10 : whatsNew.length,
        itemBuilder: (_, index) {
          var thread = whatsNew.isEmpty ? null : whatsNew[index];

          return ListTile(
            dense: true,
            onTap: thread == null
                ? null
                : () {
                    Get.to(() => ThreadScreen(thread: thread));
                  },
            title: Builder(
              builder: (_) {
                if (thread != null) {
                  return Text(
                    thread.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  );
                }

                return Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Text(''),
                );
              },
            ),
            subtitle: Builder(
              builder: (_) {
                if (thread != null) {
                  return Text(
                    '${thread.memberName} · ${thread.updatedAt} · ${thread.replies} replies',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  );
                }

                return Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Text(''),
                );
              },
            ),
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.background,
              child: Builder(
                builder: (_) {
                  if (thread != null && thread.memberAvatar != '') {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CachedNetworkImage(
                        imageUrl: thread.memberAvatar,
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ),
          );
        },
      ),
    );
  }

  onload() async {
    whatsNew = [];
    setState(() {});

    whatsNew = await ApiHelper.getThreads('https://voz.vn/whats-new');
    setState(() {});
  }
}
