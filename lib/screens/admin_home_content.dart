import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
// import 'package:seat_sense_flutter/screens/occupancy.dart';


class AdminHomeContent extends StatelessWidget {
  const AdminHomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          // View Occupancy Image Card
          GestureDetector(
            onTap: () {
              // Navigator.push(context,
              //   MaterialPageRoute(builder: (_) => const OccupancyScreen()));
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'lib/assets/audi.jpeg',
                      height: 180,
                      width: screenWidth,
                      fit: BoxFit.cover,
                    ),
                  ),

                  Container(
                    height: 180,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.black.withOpacity(0.5), // you can also try Colors.grey.withOpacity(0.3)
                    ),
                  ),
                  const Text(
                    'View Occupancy',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 6,
                          color: Colors.black,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // View Attendance Image Card
          GestureDetector(
            onTap: () {
              // TODO: Navigate to attendance screen
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('View Attendance tapped')),
              );
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'lib/assets/audi_filled.jpeg', 
                      height: 180,
                      width: screenWidth,
                      fit: BoxFit.cover,
                    ),
                  ),

                  Container(
                    height: 180,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.black.withOpacity(0.5), // you can also try Colors.grey.withOpacity(0.3)
                    ),
                  ),
                  const Text(
                    'View Attendance',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 6,
                          color: Colors.black,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // View Events Button (Shad-style)
          ShadButton(
            child: const Text('View Events'),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('View Events tapped')),
              );
            },
          ),
        ],
      ),
    );
  }
}
