import 'package:findmypet/controllers/pet_controller.dart';
import 'package:findmypet/domain/pet_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var pets = [];

  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchLostPets();
  }

  Future<void> fetchLostPets() async {
    setState(() {
      isLoading = true;
    });
    try {
      final response = await PetServices.getAllPet();
      pets = response;
      setState(() {});
    } catch (e) {
      print(e);
      Get.snackbar("Error", "Failed to load pets");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: const Text('FindmyPet')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : pets.isEmpty
          ? const Center(child: Text("No pets found"))
          : LayoutBuilder(
              builder: (context, constraints) {
                // Decide how many cards per row based on screen width
                int crossAxisCount = 1; // default for mobile
                if (constraints.maxWidth > 600 &&
                    constraints.maxWidth <= 1000) {
                  crossAxisCount = 2; // tablet
                } else if (constraints.maxWidth > 1000) {
                  crossAxisCount = 3; // desktop
                }

                return GridView.builder(
                  padding: const EdgeInsets.all(12),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 3 / 2, // adjust height vs width ratio
                  ),
                  itemCount: pets.length,
                  itemBuilder: (context, index) {
                    final pet = pets[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Pet image
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child:
                                    pet.photoUrl != null &&
                                        pet.photoUrl.isNotEmpty
                                    ?
                                      // ? Image.network(
                                      //     pet.photoUrl,
                                      //   //   width: double.infinity,
                                      //   //   fit: BoxFit.cover,
                                      //   // )
                                      Icon(
                                        Icons.image_sharp,
                                        color: Colors.grey,
                                      )
                                    : Container(
                                        color: Colors.grey[300],
                                        child: const Icon(
                                          Icons.pets,
                                          size: 40,
                                          color: Colors.black54,
                                        ),
                                      ),
                              ),
                            ),
                            const SizedBox(height: 8),

                            // Pet details
                            Text(
                              pet.name ?? "Unknown",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text("Species: ${pet.species}"),
                            Text("Breed: ${pet.breed}"),
                            Text("Color: ${pet.color}"),
                            Text("Gender: ${pet.gender}"),
                            Text("Last Seen: ${pet.lastSeenLocation}"),
                            Text("Date: ${pet.lastSeenDate}"),
                            Text("Owner ID: ${pet.ownerId}"),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
