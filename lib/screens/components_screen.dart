import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class ComponentsScreen extends StatelessWidget {
  const ComponentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('组件展示'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              context,
              '按钮组件',
              [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('ElevatedButton'),
                ),
                const SizedBox(height: AppConstants.smallPadding),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('OutlinedButton'),
                ),
                const SizedBox(height: AppConstants.smallPadding),
                TextButton(
                  onPressed: () {},
                  child: const Text('TextButton'),
                ),
                const SizedBox(height: AppConstants.smallPadding),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite),
                ),
                const SizedBox(height: AppConstants.smallPadding),
                FloatingActionButton(
                  onPressed: () {},
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: AppConstants.largePadding),
            _buildSection(
              context,
              '输入组件',
              [
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'TextField',
                    hintText: '请输入内容',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: AppConstants.smallPadding),
                Switch(
                  value: true,
                  onChanged: (value) {},
                ),
                const SizedBox(height: AppConstants.smallPadding),
                Checkbox(
                  value: true,
                  onChanged: (value) {},
                ),
                const SizedBox(height: AppConstants.smallPadding),
                Radio<bool>(
                  value: true,
                  groupValue: true,
                  onChanged: (value) {},
                ),
                const SizedBox(height: AppConstants.smallPadding),
                Slider(
                  value: 0.5,
                  onChanged: (value) {},
                ),
              ],
            ),
            const SizedBox(height: AppConstants.largePadding),
            _buildSection(
              context,
              '容器组件',
              [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(AppConstants.defaultPadding),
                    child: const Text('Card 组件'),
                  ),
                ),
                const SizedBox(height: AppConstants.smallPadding),
                Container(
                  padding: const EdgeInsets.all(AppConstants.defaultPadding),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceVariant,
                    borderRadius:
                        BorderRadius.circular(AppConstants.defaultRadius),
                  ),
                  child: const Text('Container 组件'),
                ),
                const SizedBox(height: AppConstants.smallPadding),
                Chip(
                  label: const Text('Chip 组件'),
                  avatar: const Icon(Icons.tag, size: 18),
                ),
              ],
            ),
            const SizedBox(height: AppConstants.largePadding),
            _buildSection(
              context,
              '列表组件',
              [
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('ListTile 标题'),
                  subtitle: const Text('ListTile 副标题'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {},
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('设置'),
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
      BuildContext context, String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: AppConstants.defaultPadding),
        ...children,
      ],
    );
  }
}
