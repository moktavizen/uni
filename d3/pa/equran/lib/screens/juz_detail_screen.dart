import 'package:equran/databases/database.dart';
import 'package:equran/providers/ayahs_in_juz_provider.dart';
import 'package:equran/widgets/ayah_list_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JuzDetailScreen extends ConsumerWidget {
  const JuzDetailScreen({
    super.key,
    required this.juz,
    required this.juzId,
  });

  final Juz juz;
  final String? juzId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final parsedJuzId = int.parse(juzId!);
    final ayahList = ref.watch(ayahsInJuzProvider(parsedJuzId));

    return AyahListScaffold(
      screenId: parsedJuzId,
      headerTitle: 'Juz ${juz.id}',
      headerSubtitle: '${juz.ayahCount} Ayat',
      headerCaption:
          'MULAI • ${juz.surahStart.toUpperCase()} AYAT ${juz.ayahStart}',
      ayahList: ayahList,
    );
  }
}
