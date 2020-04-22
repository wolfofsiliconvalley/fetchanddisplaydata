import 'dart:html';
import 'dart:io';

class DetailScreen extends StatelessWidget {
  final User user;

  DetailScreen({Key key, @required this.user}) : super(key: key);

  @override
  Widget buid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
        backgroundColor: Colors.deepPurple,
      ),
      body: Card(
       margin: EdgeInsets.all(14.0),
       elevation: 4,
       child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image(
              image: NetworkImage(
                'https://ui-avatars.com/api/?name=' + user.name
              ),
              Text(
                'Full name: ' + user.name,
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              Text(
                'Username: ' + user.username,
                style: TextStyle(
                  fontSize: 18.0,
                ),
                
            ),
            Text(
              'Email: ' + user.email,
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Id: ' + user.id,
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),

          ]
        ),

      ),
    );
  }
}