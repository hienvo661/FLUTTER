import 'package:facebook_clone_app/Model/Model.dart';
import 'package:flutter/material.dart';

class CreatePost extends StatelessWidget {
  final User currentUser;

  CreatePost({required this.currentUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 3.8,
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.amber,
                  backgroundImage: NetworkImage(currentUser.imageUrl),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration.collapsed(
                        hintText: 'What\'s on your mind?'),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 6,
            decoration: BoxDecoration(
              color: Colors.grey,
              boxShadow: [
                BoxShadow(
                    blurRadius: 3, offset: Offset(0, 1), color: Colors.black12)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
