import 'package:flutter/material.dart';

class AccountClosureScreen extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final List<Account> accounts;


  const AccountClosureScreen({super.key, 
    required this.name,
    required this.email,
    required this.phone,
    required this.accounts
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: const Text('Account Closure'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Personal Details',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Name: $name',
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Email: $email',
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Phone: $phone',
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Accounts',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: accounts.length,
                itemBuilder: (context, index) {
                  return Card(
                    shadowColor: Colors.black,
                    elevation: 10,
                    color: accounts[index].color,
                    child: ListTile(
                      leading: Icon(accounts[index].icon),
                      title: Text(
                        '${accounts[index].type} Account',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8.0),
                          Text(
                            'Account Number: ${accounts[index].number}',
                            style: TextStyle(
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            accounts[index].description,
                            style: TextStyle(
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            'Balance',
                            style: TextStyle(
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            '\$${accounts[index].balance}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          // Add delete account functionality here
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}

class Account {
  final String number;
  final String type;
  final String description;
  final double balance;
  final IconData icon;
  final Color color;

  Account({
    required this.number,
    required this.type,
    required this.description,
    required this.balance,
    required this.icon,
    required this.color,
  });
}
