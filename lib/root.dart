import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uniqcast/components/responsive_widgets/resposive_size.dart';
import 'package:uniqcast/modules/channels/channels_list_view.dart';
import 'package:uniqcast/resources/text_style.dart';
import 'package:uniqcast/routing/router_provider.dart';
import 'package:uniqcast/utils/providers/storage_provider.dart';

class Root extends HookConsumerWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: t.surface,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              StorageProvider.logOut();
              ref.invalidate(routerProvider);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Welcome to Uniqcast!',
              style: TextStyle(
                  fontSize: responsiveSize(
                    context,
                    largeSize: sh1,
                    mediumSize: sh3,
                    smallSize: sh4,
                  ),
                  color: t.onSurface),
            ),
            const Expanded(child: ChannelsListView()),
          ],
        ),
      ),
    );
  }
}
