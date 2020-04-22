import 'dart:convert';
import 'package:apiJsonListview/API.dart';
import 'package:apiJsonListview/models/User.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Http App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyListScreen(),
    );
        
  }
}

class MyListScreen extends StatefulWidget {
  @override
  createState() => _MyListScreenState();
}

class _MyListScreenState extends State {
  var users = new List<User>();

  _getUsers() {
    API.getUsers().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        users = list.map((model) => User.fromJson(model)).toList();
      });
    });
  }

  initState() {
    super.initState();
    _getUsers();
  }

  dispose() {
    super.dispose();
  }

  @override
  build(context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("User List"),
        ),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return ListTile(title: Text(users[index].name));
              onTap: () {
              Navigator.push(
                context,
                materialPageRoute(
                  builder: (context) => DetailScreen(
                    users: users[index]
                  )
                )
              );
            };
            child: Card(
              elevation:4
              child: Padding(
                padding:
                  EdgeInsets.all(16.0)
                child: column(
                  children: <Widget>{
                    ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          'https://ui-avatars.com/api/?name=' + snapshot.data[index].name)
                        )
                      ),
                      title: Text('Full Name: ' + users[index].name),
                      subtitle: Text('Email: ' + users.data[index].email),
                    
            
                  }
                )
              )
            );
            
        
              
          },
        ));
  }
}