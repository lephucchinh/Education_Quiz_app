import 'package:flutter/material.dart';

class UserListTile extends StatelessWidget {
  const UserListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(
                        "https://www.google.com/url?sa=i&url=https%3A%2F%2Frdsic.edu.vn%2Fblog%2Ftoan%2Fnhung-hinh-nen-dep-avatar-tuyet-voi-ban-khong-the-bo-qua-vi-cb.html&psig=AOvVaw0BcTXy4gNR8rfkWGPr0hAD&ust=1710172938230000&source=images&cd=vfe&opi=89978449&ved=0CBMQjRxqFwoTCNjK-OWI6oQDFQAAAAAdAAAAABAa"),
                    fit: BoxFit.fill),
              ),
            ),
            title: Text('name'),
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
    );
    ;
  }
}
