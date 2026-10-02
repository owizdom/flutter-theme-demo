import 'package:flutter/material.dart';

void main() => runApp(const ThemeDemoApp());

class ThemeDemoApp extends StatefulWidget {
  const ThemeDemoApp({super.key});
  @override
  State<ThemeDemoApp> createState() => _ThemeDemoAppState();
}

class _ThemeDemoAppState extends State<ThemeDemoApp> {
  bool _dark = false;
  Color _seed = Colors.indigo;
  final _colors = [Colors.indigo, Colors.teal, Colors.deepOrange, Colors.pink];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: _seed)),
      darkTheme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: _seed, brightness: Brightness.dark)),
      themeMode: _dark ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(
        appBar: AppBar(title: const Text('Theme Demo')),
        body: Column(children: [
          SwitchListTile(title: const Text('Dark mode'), value: _dark, onChanged: (v) => setState(() => _dark = v)),
          Wrap(spacing: 12, children: [
            for (final c in _colors)
              GestureDetector(
                onTap: () => setState(() => _seed = c),
                child: CircleAvatar(backgroundColor: c, child: _seed == c ? const Icon(Icons.check, color: Colors.white) : null),
              ),
          ]),
          const SizedBox(height: 24),
          FilledButton.icon(onPressed: () {}, icon: const Icon(Icons.send), label: const Text('Send')),
        ]),
      ),
    );
  }
}
