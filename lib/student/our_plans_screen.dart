import 'package:flutter/material.dart';

class OurPlansScreen extends StatelessWidget {
  const OurPlansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Pick your Premium'),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFF5B75FF),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'TEJAS LEARNING',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildPlanCard(
              context,
              title: 'Mini',
              price: '₹79/month',
              features: const ['Limited Access'],
              color: Colors.green,
              tagColor: Colors.greenAccent,
            ),
            const SizedBox(height: 16),
            _buildPlanCard(
              context,
              title: 'Duo',
              price: '₹149/month',
              features: const ['Group Session'],
              color: Colors.orange,
              tagColor: Colors.orangeAccent,
            ),
            const SizedBox(height: 16),
            _buildPlanCard(
              context,
              title: 'Individual',
              price: '₹119/month',
              features: const ['Ad-free Class'],
              color: Colors.blue,
              tagColor: Colors.blueAccent,
            ),
            const SizedBox(height: 16),
            _buildPlanCard(
              context,
              title: 'Family',
              price: '₹199/month',
              features: const ['Access for 4 Members'],
              color: Colors.purple,
              tagColor: Colors.purpleAccent,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanCard(
    BuildContext context, {
    required String title,
    required String price,
    required List<String> features,
    required Color color,
    required Color tagColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _tag("1 month free", tagColor),
              const SizedBox(width: 8),
              _tag("One-time plans available", tagColor.withOpacity(0.6)),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            "$price after offer period",
            style: const TextStyle(fontSize: 14, color: Colors.black54),
          ),
          const SizedBox(height: 12),
          for (var feature in features)
            Row(
              children: [
                const Icon(Icons.check, color: Colors.black54),
                const SizedBox(width: 8),
                Text(feature, style: const TextStyle(fontSize: 14)),
              ],
            ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // TODO: Handle View Plans action
              showDialog(
                context: context,
                builder:
                    (context) => AlertDialog(
                      title: const Text("Plan Selected"),
                      content: Text("You selected the $title plan."),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("OK"),
                        ),
                      ],
                    ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              minimumSize: const Size(double.infinity, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            child: const Text(
              'VIEW PLANS',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Terms and conditions apply. 1 month free not available for users who have already tried Premium.",
            style: TextStyle(fontSize: 11, color: Colors.black54),
          ),
        ],
      ),
    );
  }

  Widget _tag(String text, Color bgColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
