import 'package:denta/core/l10n/app_localizations.dart';
import 'package:denta/core/theme/app_colors.dart';
import 'package:denta/core/theme/app_typography.dart';
import 'package:denta/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class SelectionItem<T> {
  final T value;
  final String label;
  const SelectionItem({required this.value, required this.label});
}

/// Searchable single-choice sheet. Returns the chosen value or null.
Future<T?> showSelectionSheet<T>(
  BuildContext context, {
  required String title,
  required List<SelectionItem<T>> items,
  T? selected,
}) {
  return showModalBottomSheet<T>(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    sheetAnimationStyle: const AnimationStyle(
      curve: Curves.easeInOutCubicEmphasized,
      duration: Duration(milliseconds: 1200),
      reverseDuration: Duration(milliseconds: 800),
      reverseCurve: Curves.easeInOutCubicEmphasized,
    ),
    backgroundColor: context.appColors.background,
    builder: (_) =>
        _SelectionSheet<T>(title: title, items: items, selected: selected),
  );
}

class _SelectionSheet<T> extends StatefulWidget {
  const _SelectionSheet({
    required this.title,
    required this.items,
    this.selected,
  });

  final String title;
  final List<SelectionItem<T>> items;
  final T? selected;

  @override
  State<_SelectionSheet<T>> createState() => _SelectionSheetState<T>();
}

class _SelectionSheetState<T> extends State<_SelectionSheet<T>> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colors = context.appColors;
    final filtered = widget.items
        .where((e) => e.label.toLowerCase().contains(_query.toLowerCase()))
        .toList();

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.75,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(widget.title, style: context.text.heading3),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomTextField(
                hint: l10n.questionnaireSearchHint,
                onChange: (value) => setState(() => _query = value),
                prefixIcon: Icons.search,
              ),
            ),
            const SizedBox(height: 8),
            Flexible(
              child: filtered.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(24),
                      child: Center(
                        child: Text(
                          l10n.questionnaireNoResults,
                          style: context.text.captionDefault,
                        ),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: filtered.length,
                      itemBuilder: (context, index) {
                        final item = filtered[index];
                        final isSelected = item.value == widget.selected;
                        return ListTile(
                          selected: isSelected,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          title: Text(
                            item.label,
                            style: context.text.bodyDefault.copyWith(
                              color: isSelected ? colors.primary : null,
                            ),
                          ),
                          trailing: isSelected
                              ? Icon(Icons.check_rounded, color: colors.primary)
                              : null,
                          onTap: () => Navigator.of(context).pop(item.value),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
