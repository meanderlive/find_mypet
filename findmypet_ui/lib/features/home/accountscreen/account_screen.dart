import 'package:findmypet/controllers/user_controller.dart';
import 'package:findmypet/core/appcolor/app_colors.dart';
import 'package:findmypet/domain/pet_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  List pets = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchPets();
  }

  Future<void> fetchPets() async {
    setState(() {
      isLoading = true;
    });
    try {
      final response = await PetServices.mylostpet();
      pets = response;
      setState(() {});
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final user = Get.find<UserController>();
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: size.height * 0.3,
            decoration: BoxDecoration(
              color: CAppColors.accent4Color,
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(30)),
            ),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(
                    children: [
                      Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: size.width * 0.1,
                          child: Text(
                            user.user?.email != null
                                ? user.user!.email[0].toUpperCase()
                                : 'ID',
                            style: TextStyle(
                              fontSize: size.width * 0.1,
                              color: CAppColors.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "User Id :",
                        style: TextStyle(
                          fontSize: size.width * 0.05,
                          color: CAppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        " ${user.user?.email ?? 'Guest'}",
                        style: TextStyle(
                          fontSize: size.width * 0.06,
                          color: CAppColors.buttonColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: "almendra",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: size.height * 0.01),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "My Lost pet",
                style: TextStyle(
                  fontSize: size.width * 0.05,
                  color: CAppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          ListView.builder(
            itemCount: pets.length,
            itemBuilder: (context, index) {
              final pet = pets[index];
              return Card(
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(pet.photoUrl),
                    child: Text(pet.name[0]),
                  ),
                  title: Text("${pet.name}"),
                  subtitle: Text("${pet.breed} • ${pet.lastSeenLocation}"),
                  trailing: Text("last seen:\n${pet.lastSeenDate}"),
                ),
              );
            },
            shrinkWrap: true,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          user.logout();
        },
        child: Icon(Icons.logout, color: Colors.white),
        backgroundColor: Colors.black,
      ),
    );
  }
}
