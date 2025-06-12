import 'package:flutter/material.dart';
import 'our_plans_screen.dart';
import 'feedback_page.dart';
import 'chat_screen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Close icon
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.close, size: 28, color: Colors.grey),
                ),
              ),
              SizedBox(height: 16),

              // My Profile title
              Text(
                "My Profile",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0xFF1B1B1B),
                ),
              ),
              SizedBox(height: 20),

              // Profile Info
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.grey.shade200,
                      child: Icon(
                        Icons.person,
                        size: 32,
                        color: Color(0xFF2F3C88),
                      ),
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hi, Full Name",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Color(0xFF1B1B1B),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Mention Class/Education",
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),

              // Menu Items
              _buildMenuItem(context, Icons.edit_document, "Edit Profile"),
              _buildMenuItem(context, Icons.workspace_premium, "Premium Plan"),
              _buildMenuItem(context, Icons.feedback, "Feed Back"),
              _buildMenuItem(context, Icons.person_outline, "My Teacher"),
              _buildMenuItem(context, Icons.access_time, "Contact Us"),
              _buildMenuItem(context, Icons.help_outline, "FAQ"),
              _buildMenuItem(context, Icons.logout, "Logout"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, IconData icon, String label) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(icon, color: Color(0xFF2F3C88)),
          title: Text(
            label,
            style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Colors.grey.shade400,
          ),
          onTap: () {
            if (label == "Premium Plan") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => OurPlansScreen()),
              );
            } else if (label == "Feed Back") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => FeedbackPage()),
              );
            } else if (label == "My Teacher") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ChatScreen()),
              );
            }
          },
        ),
        Divider(thickness: 0.5, color: Colors.grey.shade300),
      ],
    );
  }
}
