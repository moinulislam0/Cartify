import 'package:flutter/material.dart';
import 'package:practice_method/view/onButtonTap.dart';

class PaymentScreen extends StatefulWidget {
  final String price;
   PaymentScreen({super.key, required this.price});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String? Selected;
  List<Map<String, dynamic>> gateways = [
    {
      'name': "bkash",
      'logo': 'assets/images/bkash.png',
    },
    {
      'name': "SslCommerz",
      'logo': 'assets/images/Nagad-Logo.png',
    },
    {
      'name': "Rocket",
      'logo': 'assets/images/rocket.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.pink,
        title: const Text(
          "Payment Method",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Select a payment Method",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: gateways.length,
                itemBuilder: (context, index) {
                  final gateway = gateways[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),
                    child: ListTile(
                      leading: Image.asset(
                        gateway['logo'],
                        height: 40,
                        width: 40,
                      ),
                      title: Text(gateway['name']),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        setState(() {
                          Selected = gateway['name'];
                        });
                        onButtonTap(
                          gateway['name'],widget.price
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
