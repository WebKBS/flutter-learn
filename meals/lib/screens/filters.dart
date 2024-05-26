import 'package:flutter/material.dart';
import 'package:meals/providers/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget _buildSwitchListTile(BuildContext context, String title,
      String description, bool currentValue, void Function(bool)? updateValue) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
      ),
      subtitle: Text(
        description,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('필터'),
      ),
      body: Column(
        children: [
          Center(
            child: Column(
              children: [
                const SizedBox(height: 20),
                _buildSwitchListTile(
                  context,
                  '글루텐 프리',
                  '글루텐이 포함된 음식을 필터링합니다.',
                  activeFilters[Filter.glutenFree]!,
                  (newValue) {
                    ref
                        .read(filtersProvider.notifier)
                        .setFilter(Filter.glutenFree, newValue);
                  },
                ),
                _buildSwitchListTile(
                  context,
                  '락토스 프리',
                  '락토스가 포함된 음식을 필터링합니다.',
                  activeFilters[Filter.lactoseFree]!,
                  (newValue) {
                    ref
                        .read(filtersProvider.notifier)
                        .setFilter(Filter.lactoseFree, newValue);
                  },
                ),
                _buildSwitchListTile(
                  context,
                  '베지테리언',
                  '육류를 제외한 음식을 필터링합니다.',
                  activeFilters[Filter.vegetarian]!,
                  (newValue) {
                    ref
                        .read(filtersProvider.notifier)
                        .setFilter(Filter.vegetarian, newValue);
                  },
                ),
                _buildSwitchListTile(
                  context,
                  '비건',
                  '동물성 제품을 제외한 음식을 필터링합니다.',
                  activeFilters[Filter.vegan]!,
                  (newValue) {
                    ref
                        .read(filtersProvider.notifier)
                        .setFilter(Filter.vegan, newValue);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
