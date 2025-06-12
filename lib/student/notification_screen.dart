import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  final List<Map<String, dynamic>> notifications = [
    {
      'type': 'request',
      'initials': 'AB',
      'title': 'Ashwin Bose is requesting access to Join the online session of Design File - Part 3.',
      'time': '2m',
      'actions': ['Accept', 'Decline'],
    },
    {
      'type': 'comment',
      'image': 'https://i.pravatar.cc/150?img=3',
      'name': 'Patrick',
      'title': 'added Suggestion of Design Assets - Smart Tags file:',
      'comment': '“Great listening , Be focus on every sessions!”',
      'time': '8h',
    },
    {
      'type': 'feature',
      'icon': Icons.star,
      'title': 'New Feature Alert!',
      'subtitle': 'We\'re pleased to introduce the latest enhancements in our templating experience.',
      'button': 'Try now',
      'time': '14h',
    },
    {
      'type': 'file',
      'image': 'https://i.pravatar.cc/150?img=4',
      'name': 'Tutor',
      'file': 'Demo File.pdf',
      'size': '2.2 MB',
      'time': '14h',
    },
    {
      'type': 'group',
      'initials': 'SJ',
      'title': 'Steve and 8 others shared notes of Design Assets - Smart Tags file',
      'time': '15h',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black54),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Notifications',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final item = notifications[index];
          return Container(
            margin: EdgeInsets.only(bottom: 16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: item['type'] == 'request' ? Color(0xFFEFF5FF) : Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: _buildNotificationItem(item),
          );
        },
      ),
    );
  }

  Widget _buildNotificationItem(Map<String, dynamic> item) {
    Widget leading;
    if (item['image'] != null) {
      leading = CircleAvatar(backgroundImage: NetworkImage(item['image']), radius: 20);
    } else {
      leading = CircleAvatar(
        backgroundColor: Colors.grey.shade300,
        child: Text(item['initials'] ?? '', style: TextStyle(color: Colors.black)),
        radius: 20,
      );
    }

    Widget trailing = Text(item['time'], style: TextStyle(color: Colors.grey, fontSize: 12));

    switch (item['type']) {
      case 'request':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [leading, trailing]),
            SizedBox(height: 8),
            Text(item['title'], style: TextStyle(fontWeight: FontWeight.w600)),
            SizedBox(height: 12),
            Row(
              children: item['actions']
                  .map<Widget>((label) => Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: label == 'Accept' ? Color(0xFF0052CC) : Colors.white,
                            foregroundColor: label == 'Accept' ? Colors.white : Colors.black,
                            side: BorderSide(color: Colors.grey.shade300),
                          ),
                          child: Text(label),
                        ),
                      ))
                  .toList(),
            ),
          ],
        );

      case 'comment':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [leading, trailing]),
            SizedBox(height: 8),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: '${item['name']} ', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                  TextSpan(text: item['title'], style: TextStyle(color: Colors.black)),
                ],
              ),
            ),
            SizedBox(height: 8),
            Text(item['comment'], style: TextStyle(color: Colors.black87)),
          ],
        );

      case 'feature':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Icon(item['icon'], size: 28, color: Colors.deepPurple),
              trailing,
            ]),
            SizedBox(height: 8),
            Text(item['title'], style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text(item['subtitle'] ?? '', style: TextStyle(color: Colors.black87)),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF0052CC)),
              child: Text(item['button']),
            ),
          ],
        );

      case 'file':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [leading, trailing]),
            SizedBox(height: 8),
            Text('${item['name']} has shared a file with you', style: TextStyle(fontWeight: FontWeight.w600)),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.insert_drive_file, size: 18, color: Colors.blue),
                SizedBox(width: 6),
                Text(item['file'], style: TextStyle(color: Colors.blue)),
                SizedBox(width: 6),
                Text(item['size'], style: TextStyle(color: Colors.grey)),
              ],
            )
          ],
        );

      case 'group':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [leading, trailing]),
            SizedBox(height: 8),
            Text(item['title'], style: TextStyle(color: Colors.black)),
          ],
        );

      default:
        return SizedBox.shrink();
    }
  }
}
