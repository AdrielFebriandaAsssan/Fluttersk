import 'package:flutter/material.dart';
import 'package:pjsk/model/usermodel.dart';
import 'package:pjsk/util/user_service.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  List<UserModel> listUser = <UserModel>[];

  @override
  void initState() {
    super.initState();
    getDataUser();
  }

  // Fetch all users
  void getDataUser() async {
    try {
      final userService = UserService();
      final listUserTemp = await userService.fetchUsers();
      if (listUserTemp.isNotEmpty) {
        setState(() {
          listUser = listUserTemp;
        });
      }
    } catch (e) {
      debugPrint('Error fetching users: $e');
    }
  }

  // Fetch a single user's details and show in a dialog
  void getUserDetail(int id) async {
    try {
      final userService = UserService();
      final user = await userService.fetchUserById(id);

      // Display user details in a dialog
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('${user.firstName} ${user.lastName}'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipOval(
                child: Image.network(
                  user.avatar ?? '',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              Text('Email: ${user.email}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        ),
      );
    } catch (e) {
      debugPrint('Error fetching user details: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Users',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: listUser.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView.separated(
                itemCount: listUser.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                itemBuilder: (context, index) => ListTile(
                  leading: ClipOval(
                    child: Image.network(
                      listUser[index].avatar ?? '',
                      width: 52.0,
                      height: 52.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    '${listUser[index].firstName} ${listUser[index].lastName}',
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    listUser[index].email ?? '',
                    style: const TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                  onTap: () => getUserDetail(listUser[index].id!), // Fetch and display user details
                ),
                separatorBuilder: (context, index) => const Divider(height: 0.0),
              ),
      ),
    );
  }
}
