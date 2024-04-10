
import 'package:flutter/material.dart';
import 'package:user_repository/user_repository.dart';

import '../chat_private_screen/chat_private_screen.dart';

class UserListTile extends StatelessWidget {
  final MyUser myUser;

  const UserListTile({super.key, required this.myUser, });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => ChatPrivateScreen()));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              width: double.infinity,
              child: ListTile(
                leading:  myUser.picture!.isNotEmpty
                    ? Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(myUser.picture!), // Sử dụng myUser.picture! để tránh lỗi khi giá trị là null
                      fit: BoxFit.fill,
                    ),
                  ),
                )
                    : Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
                title: Text(myUser.name),
                subtitle: Text('new chat'),
                trailing: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ),
        ),
        Divider(color: Colors.grey,),
      ],
    );
  }
}
