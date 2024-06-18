import 'package:equran/widgets/tab_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ListTileSkeleton extends StatelessWidget {
  const ListTileSkeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (context, index) {
        return const Skeletonizer.zone(
          child: TabListTile(
            leading: Bone.icon(size: 36),
            title: Bone.text(width: 92, fontSize: 16),
            subtitle: Bone.text(width: 136, fontSize: 12),
            trailing: Bone.text(width: 64, fontSize: 20),
          ),
        );
      },
      itemCount: 7,
    );
  }
}