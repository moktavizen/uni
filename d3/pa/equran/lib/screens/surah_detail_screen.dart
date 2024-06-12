import 'package:equran/databases/database.dart';
import 'package:equran/providers/ayahs_in_surah_provider.dart';
import 'package:equran/widgets/ayah_list_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SurahDetailScreen extends ConsumerWidget {
  const SurahDetailScreen({
    super.key,
    this.surahId,
    this.surah,
    this.lastRead,
  });

  final String? surahId;
  final Surah? surah;
  final LastRead? lastRead;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int parsedSurahId = int.parse(surahId!);
    final ayahList = ref.watch(ayahsInSurahProvider(parsedSurahId));

    return AyahListScaffold(
      screenId: parsedSurahId,
      headerTitle: lastRead?.screenTitle ?? surah!.latin,
      headerSubtitle: lastRead?.screenSubtitle ?? surah!.translation,
      headerCaption: lastRead?.screenCaption ??
          '${surah!.location.toUpperCase()} • ${surah!.ayahCount} AYAT',
      ayahList: ayahList,
      ayahIndex: lastRead?.ayahIndex,
    );
  }
}
