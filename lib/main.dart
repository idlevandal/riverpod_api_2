import 'package:firebase_cloud/person.dart';
import 'package:firebase_cloud/person_service.dart';
import 'package:firebase_cloud/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

final personProvider = FutureProvider<List<User>>((ref) {
  return getUsers();
});

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECF1F9),
      appBar: AppBar(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFFDDDDDD), Color(0xFFC8C8C8)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Center(
              child: Results()
          ),
        ),
      ),
    );
  }
}

class Results extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final user = watch(personProvider);
    return user.when(
      loading: () => CircularProgressIndicator(),
      error: (err, stack) => Text(err.toString()),
      data: (data) => ListView.separated(
        separatorBuilder: (context, index) {
          return SizedBox(height: 5.0,);
        },
        itemCount: data.length,
          itemBuilder: (context, index) {
            return Card(
              clipBehavior: Clip.antiAlias,
              shadowColor: Color(0xFFDDDDDD),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFFEEEEEE), Color(0xFFDDDDDD)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight
                    )
                ),
                child: ListTile(
                  leading: Icon(Icons.info_outline_rounded, color: Colors.blue.shade400,),
                  trailing: Icon(Icons.account_circle_outlined, color: Colors.blue.shade600,),
                  title: Text(data[index].name ?? 'huh????'),
                ),
              ),
            );
          }
      )
    );
  }
}


