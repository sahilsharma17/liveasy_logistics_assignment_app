import 'package:flutter/material.dart';
import 'package:liveasy_logistics_assignment_app/screens/register_screen.dart';

class AppLanguagePage extends StatefulWidget {
  AppLanguagePage({super.key});

  // This is a sample list of languages you can customize
  final List<Locale> supportedLocales = [
    const Locale('English'),
    const Locale('Hindi'),
    const Locale('Urdu'),
  ];

  @override
  _AppLanguagePageState createState() => _AppLanguagePageState();
}

class _AppLanguagePageState extends State<AppLanguagePage> {
  late Locale selectedLocale;
  bool isNextEnabled = false;

  @override
  void initState() {
    super.initState();
    selectedLocale = widget.supportedLocales.first; // Set default locale to English
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(selectedLocale == const Locale('English') ? 'assets/images/bg1.png' : 'assets/images/bg2.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/liveasyLogo.png',
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.4,
              ),
              const SizedBox(height: 10),
              const Text(
                'Please select your language:',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'You can change the language at any time.',
                style: TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 30),
              Container(
                width: 250, 
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey, 
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10), // Set border radius
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                  child: Align(
                    alignment: Alignment.center,
                    child: DropdownButton<Locale>(
                      isExpanded: true,
                      value: selectedLocale, // Use the selectedLocale state variable
                      onChanged: (Locale? newLocale) {
                        if (newLocale != null) {
                          setState(() {
                            selectedLocale = newLocale;
                            isNextEnabled = true; // Enable Next button
                          });
                        }
                      },
                      items: widget.supportedLocales
                          .map((locale) => _createItem(locale))
                          .toList(),
                      elevation: 2, // Set elevation for dropdown
                      icon: const Icon(Icons.arrow_drop_down), // Set dropdown icon
                      underline: Container(
                        height: 2, // Set underline height
                        // color: Colors.blue, // Set underline color
                      ),
                      borderRadius:
                          BorderRadius.circular(5.0), // Set border radius
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 250, // Set the desired width here
                height: 50, // Set the desired height here
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromRGBO(46, 59, 98, 1),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  onPressed: isNextEnabled ? () {
                    Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterScreen(),
                          ),
                        );
                  } : null, // Disable button if language is not selected
                  child: const Text('NEXT', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<Locale> _createItem(Locale locale) {
    String displayText =
        locale.toString(); // You can customize the display text
    return DropdownMenuItem<Locale>(
      value: locale,
      child: Text(displayText),
    );
  }
}
