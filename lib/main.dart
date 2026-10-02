import 'package:flutter/material.dart';
// Entry point: runApp puts the root widget on screen.
void main() => runApp(const ThemeDemoApp());
// Stateful because dark mode and the chosen colour change while the app runs.
class ThemeDemoApp extends StatefulWidget {
  const ThemeDemoApp({super.key});
  @override
  State<ThemeDemoApp> createState() => _ThemeDemoAppState();
}
// The State object holds the two values the whole look depends on.
class _ThemeDemoAppState extends State<ThemeDemoApp> {
  bool _dark = false; // dark mode flag, off at start
  Color _seed = Colors.indigo; // seed colour the palette is generated from
  final _colors = [Colors.indigo, Colors.teal, Colors.deepOrange, Colors.pink]; // the four circles
  // build runs again after every setState and turns the state into widgets.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: _seed)), // light theme. Default: null (baseline purple)
      darkTheme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: _seed, brightness: Brightness.dark)), // Default: null (no dark look)
      themeMode: _dark ? ThemeMode.dark : ThemeMode.light, // which theme is active. Default: ThemeMode.system
      home: Scaffold(
        appBar: AppBar(title: const Text('Theme Demo')),
        body: Column(children: [
          SwitchListTile(title: const Text('Dark mode'), value: _dark, onChanged: (v) => setState(() => _dark = v)), // flips themeMode
          Wrap(spacing: 12, children: [
            for (final c in _colors) // one tappable circle per colour
              GestureDetector(
                onTap: () => setState(() => _seed = c), // new seed, so a new palette
                child: CircleAvatar(backgroundColor: c, child: _seed == c ? const Icon(Icons.check, color: Colors.white) : null), // check marks the selected one
              ),
          ]),
          const SizedBox(height: 24),
          FilledButton.icon(onPressed: () {}, icon: const Icon(Icons.send), label: const Text('Send')), // no colour given: it reads the theme
        ]),
      ),
    );
  }
}
