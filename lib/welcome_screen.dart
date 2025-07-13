import 'package:flutter/material.dart';
import 'package:kharedi/app_home_screen.dart';
import 'package:kharedi/app_main_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late AnimationController _runnerController;
  late Animation<Offset> _runnerAnimation;

  bool _showLogo = false;
  bool _showText = false;
  bool _showButton = false;

  @override
  void initState() {
    super.initState();

    _runnerController = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    );

    _runnerAnimation = Tween<Offset>(
      begin: const Offset(-0.90, 0),
      end: const Offset(2, 0),
    ).animate(CurvedAnimation(
      parent: _runnerController,
      curve: Curves.easeInOut,
    ));

    _runnerController.forward();

    Future.delayed(const Duration(milliseconds: 400), () {
      setState(() => _showLogo = true);
    });

    Future.delayed(const Duration(milliseconds: 800), () {
      setState(() => _showText = true);
    });

    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() => _showButton = true);
    });
  }

  @override
  void dispose() {
    _runnerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFAD0C4), Color(0xFFFFD1FF)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: size.height * 0.07,
                left: 0,
                right: 0,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 800),
                  opacity: _showLogo ? 1 : 0,
                  child: AnimatedScale(
                    duration: const Duration(milliseconds: 800),
                    scale: _showLogo ? 1 : 0.8,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                      
                        height: size.height * 0.50,
                        width: size.height * 0.20,
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.deepOrangeAccent,width: 1),
                          boxShadow: [
                            BoxShadow(
                              color:Colors.deepOrange.withOpacity(0.2),
                              blurRadius: 8,
                              offset: const Offset(0,4),
                            ),
                          ],
                          image: const DecorationImage(
                        image: AssetImage(
                        "assets/klogo.png"),
                        fit: BoxFit.cover,
                      ),
                                        ),
                      ),
                    ),
                  ),
                ),
              ),
              
              Positioned(
                top: size.height * 0.60,
                left: 0,
                right: 0,
                child: SlideTransition(
                  position: _runnerAnimation,
                  
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: Colors.deepOrangeAccent,width: 1),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.deepOrange.withOpacity(0.2),
                            blurRadius: 6,
                            offset: const Offset(0,3),
                          ),
                        ],

                      image: const DecorationImage(
                        image: AssetImage("assets/run.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (_showText)
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 1000),
                          opacity: 1,
                          child: const Text(
                            "Are you ready to shopping?",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange,
                              letterSpacing: 0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      const SizedBox(height: 30),
                      if (_showButton)
                        SizedBox(
                          width: 400,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const AppMainScreen(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepOrangeAccent,
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              shadowColor: Colors.deepOrange.withOpacity(0.5),
                            ),
                            child: const Text(
                              "Let's Shopping",
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
