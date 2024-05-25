import 'package:flutter/material.dart';

// import 'package:meals/screens/taps.dart';
// import 'package:meals/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFreeFilterSet = false;
  var _veganFreeFilterSet = false;

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, void Function(bool)? updateValue) {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('필터'),
      ),
      // drawer: MainDrawer(
      //   onSelectScreen: (identifier) {
      //     Navigator.of(context).pop();
      //     if (identifier == 'meals') {
      //       Navigator.of(context).pushReplacement(
      //         MaterialPageRoute(
      //           builder: (context) => const TabsScreen(),
      //         ),
      //       );
      //     }
      //   },
      // ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildSwitchListTile(
              '글루텐 프리',
              '글루텐이 포함된 음식을 필터링합니다.',
              _glutenFreeFilterSet,
              (newValue) {
                setState(() {
                  _glutenFreeFilterSet = newValue;
                });
              },
            ),
            _buildSwitchListTile(
              '락토스 프리',
              '락토스가 포함된 음식을 필터링합니다.',
              _lactoseFreeFilterSet,
              (newValue) {
                setState(() {
                  _lactoseFreeFilterSet = newValue;
                });
              },
            ),
            _buildSwitchListTile(
              '베지테리언',
              '육류를 제외한 음식을 필터링합니다.',
              _vegetarianFreeFilterSet,
              (newValue) {
                setState(() {
                  _vegetarianFreeFilterSet = newValue;
                });
              },
            ),
            _buildSwitchListTile(
              '비건',
              '동물성 제품을 제외한 음식을 필터링합니다.',
              _veganFreeFilterSet,
              (newValue) {
                setState(() {
                  _veganFreeFilterSet = newValue;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
