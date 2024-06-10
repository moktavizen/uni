import 'package:equran/databases/database.dart';
import 'package:equran/providers/ayahs_in_surah_provider.dart';
import 'package:equran/widgets/ayah_list_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SurahDetailScreen extends ConsumerWidget {
  const SurahDetailScreen({
    super.key,
    required this.surah,
    required this.surahId,
  });

  final Surah surah;
  final String? surahId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int parsedSurahId = int.parse(surahId!);
    final ayahList = ref.watch(ayahsInSurahProvider(parsedSurahId));

    return AyahListScaffold(
      screenId: parsedSurahId,
      headerTitle: surah.latin,
      headerSubtitle: surah.translation,
      headerCaption:
          '${surah.location.toUpperCase()} • ${surah.ayahCount} AYAT',
      ayahList: ayahList,
    );
  }
}
