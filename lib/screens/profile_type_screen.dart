import 'package:flutter/material.dart';
import 'package:liveasy_logistics_assignment_app/screens/home_screen.dart';

class ProfileTypeScreen extends StatefulWidget {
  const ProfileTypeScreen({Key? key});

  @override
  _ProfileTypeScreenState createState() => _ProfileTypeScreenState();
}

class _ProfileTypeScreenState extends State<ProfileTypeScreen> {
  int? _selectedProfile;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Please select your Profile",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Column(
                  children: [
                    RadioListTile(
                      title: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset('assets/images/shipper_icon.png',
                              width: 40, height: 40),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Shipper', style: TextStyle(fontSize: 20)),
                                SizedBox(height: 5),
                                Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      value: 1,
                      activeColor: Color.fromRGBO(46, 59, 98, 1),
                      groupValue: _selectedProfile,
                      onChanged: (value) {
                        setState(() {
                          _selectedProfile = value as int?;
                        });
                      },
                      tileColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                        side: BorderSide(color: Colors.black),
                      ),
                    ),
                    SizedBox(height: 10),
                    RadioListTile(
                      title: Row(
                        children: [
                          Image.asset('assets/images/transporter_icon.png',
                              width: 40, height: 40),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Transporter', style: TextStyle(fontSize: 20)),
                                SizedBox(height: 5),
                                Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      value: 2,
                      activeColor: Color.fromRGBO(46, 59, 98, 1),
                      groupValue: _selectedProfile,
                      onChanged: (value) {
                        setState(() {
                          _selectedProfile = value as int?;
                        });
                      },
                      tileColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                        side: BorderSide(color: Colors.black),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromRGBO(46, 59, 98, 1),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      // Check if a profile is selected
                      if (_selectedProfile != null) {
                        // Navigate to home screen
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const HomeScreen()),
                          (route) => false,
                        );
                      } else {
                        // Show a message indicating that a profile should be selected
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please select a profile'),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
