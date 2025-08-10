import 'package:flutter/material.dart';

void main() => runApp(SkyResumeApp());

class SkyResumeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SkyResume',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> data = {
    'name': '',
    'email': '',
    'phone': '',
    'summary': '',
    'skills': '',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SkyResume'),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {
              showAboutDialog(context: context, applicationName: 'SkyResume', children: [Text('Starter app — upload to GitHub to build APK via Actions')]);
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text('Create ATS-friendly resumes', style: Theme.of(context).textTheme.headline6),
              SizedBox(height: 12),
              TextFormField(
                decoration: InputDecoration(labelText: 'Full name'),
                onSaved: (v) => data['name'] = v ?? '',
              ),
              SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                onSaved: (v) => data['email'] = v ?? '',
              ),
              SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(labelText: 'Phone'),
                onSaved: (v) => data['phone'] = v ?? '',
              ),
              SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(labelText: 'Professional summary'),
                maxLines: 4,
                onSaved: (v) => data['summary'] = v ?? '',
              ),
              SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(labelText: 'Skills (comma separated)'),
                onSaved: (v) => data['skills'] = v ?? '',
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _formKey.currentState?.save();
                      showDialog(context: context, builder: (_) => AlertDialog(
                        title: Text('Preview'),
                        content: SingleChildScrollView(child: Text('Name: ${data['name']}\nEmail: ${data['email']}\nPhone: ${data['phone']}\nSummary: ${data['summary']}\nSkills: ${data['skills']}')),
                        actions: [TextButton(onPressed: ()=>Navigator.pop(context), child: Text('Close'))],
                      ));
                    },
                    child: Text('Preview'),
                  ),
                  SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('PDF export and cloud features can be enabled later')));
                    },
                    child: Text('Export PDF (coming)'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
