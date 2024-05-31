import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ListTileSkeleton extends StatelessWidget {
  const ListTileSkeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (context, index) {
        return const Skeletonizer.zone(
          child: ListTile(
            contentPadding: EdgeInsets.all(0),
            horizontalTitleGap: 16,
            minVerticalPadding: 16,
            leading: Bone.icon(size: 36),
            title: Bone.text(width: 92, fontSize: 16),
            subtitle: Bone.text(width: 136, fontSize: 12),
            trailing: Bone.text(
              width: 64,
              fontSize: 20,
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 16);
      },
      itemCount: 7,
    );
  }
}
