import 'package:flutter/material.dart';

class CommentsUser extends StatefulWidget {
  const CommentsUser({super.key});

  @override
  State<CommentsUser> createState() => _CommentsUserState();
}

class _CommentsUserState extends State<CommentsUser> {
  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.vietnamworks.com%2Fhrinsider%2Fanh-dai-dien-facebook-y-nghia.html&psig=AOvVaw1cNGSb2TC98SSx2JW_ZE4R&ust=1710485719130000&source=images&cd=vfe&opi=89978449&ved=0CBMQjRxqFwoTCJjCp_-V84QDFQAAAAAdAAAAABAE"),
                        fit: BoxFit.fill),
                  ),
                ),
                title: Row(
                  children: [
                    Text(
                      "name",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text("date"),
                  ],
                ),
                trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      favorite = !favorite;
                    });
                  },
                  icon: favorite == true
                      ? const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      : const Icon(Icons.favorite_border),
                ),
                subtitle: Text('comments')),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
