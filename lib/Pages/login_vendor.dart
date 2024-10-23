// ignore_for_file: unused_import, sized_box_for_whitespace

import 'package:AAG/Pages/login_vendor_2.dart';
import 'package:AAG/Pages/loginsignup.dart';
import 'package:AAG/Pages/otp_veri.dart';
import 'package:AAG/Pages/signup.dart';
import 'package:AAG/tobeadded/gradient_button.dart';
import 'package:AAG/tobeadded/promo_slider.dart';
import 'package:flutter/material.dart';

class LoginVendor extends StatefulWidget {
  final String selectedPlan;

  const LoginVendor({super.key, required this.selectedPlan});

  @override
  _LoginVendorState createState() => _LoginVendorState();
}

class _LoginVendorState extends State<LoginVendor> {
  final TextEditingController _phoneController = TextEditingController();
  final FocusNode _phoneFocusNode = FocusNode();
  double _initialChildSize = 0.5;

  @override
  void initState() {
    super.initState();
    _phoneFocusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _phoneFocusNode.removeListener(_onFocusChange);
    _phoneFocusNode.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _initialChildSize = _phoneFocusNode.hasFocus ? 0.8 : 0.5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent, // Make background transparent
      //   elevation: 0, // Remove shadow/elevation
      //   centerTitle: true, // Center the title (image in this case)
      //   title: Image.asset(
      //     'lib/images/aag_white.png',
      //     height: 50, // Set the height of the image
      //   ),
      // ),
      body: Stack(
        children: [
          Positioned(
            top: 35,
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                'lib/images/aag_white.png',
                height: 30,
              ),
            ),
          ),
          // Background with the PromotionalSlider
          Column(
            children: [
              // First Expanded widget for the promotional banner (flex 3)

              // First Expanded widget for the promotional banner (flex 3)
              Expanded(
                flex: 4,
                child: Container(
                  width: double.infinity,
                  child: PromotionalsSlider(),
                ),
              ),
              // The second Expanded widget (flex 2) will be part of the DraggableScrollableSheet
              Expanded(
                flex: 3,
                child: Container(), // Empty for now, flex 2 will come later
              ),
            ],
          ),

          // The form in DraggableScrollableSheet will be stacked on top of the promotional slider
          DraggableScrollableSheet(
            initialChildSize:
                _initialChildSize, // Starts at 50% of the screen height
            minChildSize: 0.5, // Minimum size (40% of the screen)
            maxChildSize: 0.6, // Can expand to 60% of the screen
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/images/idkbg.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white30,
                      blurRadius: 10,
                      offset: Offset(0, -5),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        const Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 50),
                        Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.75,
                            height: 52,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: const LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color.fromRGBO(243, 21, 136, 0.945),
                                  Color.fromRGBO(169, 3, 210, 1)
                                ],
                                stops: [0.0, 1.0],
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(22, 13, 37, 1),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              margin: const EdgeInsets.only(bottom: 2),
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: const Text(
                                      '+91 |',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Expanded(
                                    child: TextField(
                                      controller: _phoneController,
                                      focusNode: _phoneFocusNode,
                                      style:
                                          const TextStyle(color: Colors.white),
                                      decoration: const InputDecoration(
                                        hintText: 'Enter phone number',
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Center(
                        //   child: Container(
                        //     width: MediaQuery.of(context).size.width * 0.75,
                        //     height: 52,
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(15),
                        //       gradient: const LinearGradient(
                        //         begin: Alignment.bottomLeft,
                        //         end: Alignment.bottomRight,
                        //         colors: [
                        //           Color.fromRGBO(243, 21, 136, 0.945),
                        //           Color.fromRGBO(169, 3, 210, 1)
                        //         ],
                        //         stops: [0.0, 1.0],
                        //       ),
                        //     ),
                        //     child: Container(
                        //       decoration: BoxDecoration(
                        //         color: const Color.fromRGBO(22, 13, 37, 1),
                        //         borderRadius: BorderRadius.circular(15),
                        //       ),
                        //       margin: const EdgeInsets.only(bottom: 2),
                        //       child: TextField(
                        //         controller: _passwordController,
                        //         obscureText: true,
                        //         style: const TextStyle(color: Colors.white),
                        //         decoration: const InputDecoration(
                        //           hintText: 'Enter password',
                        //           hintStyle: TextStyle(color: Colors.grey),
                        //           border: InputBorder.none,
                        //           contentPadding:
                        //               EdgeInsets.symmetric(horizontal: 15),
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // const SizedBox(height: 40),

                        const SizedBox(height: 20),
                        Center(
                          child: CustomButton(
                            onTap: () {
                              // Implement login logic here
                              Navigator.of(context).pushReplacement(
                                PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      LoginVendor2(
                                    phoneNumber: _phoneController.text,
                                    selectedPlan: widget.selectedPlan,
                                  ),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    var begin = const Offset(1.0, 0.0);
                                    var end = Offset.zero;
                                    var curve = Curves.easeInOut;
                                    var tween = Tween(begin: begin, end: end)
                                        .chain(CurveTween(curve: curve));
                                    var offsetAnimation =
                                        animation.drive(tween);
                                    return SlideTransition(
                                        position: offsetAnimation,
                                        child: child);
                                  },
                                  transitionDuration:
                                      const Duration(milliseconds: 800),
                                ),
                              );
                            },
                            text: 'Login',
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don\'t have an Account?',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                            TextButton(
                              onPressed: () =>
                                  Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => SignUpPage(
                                    selectedPlan: widget.selectedPlan,
                                  ),
                                ),
                              ),
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(color: Colors.orange),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                'lib/images/aag_white.png', // Replace with your image path
                height: 30,
                width: 80, // Adjust the height as needed
              ),
            ),
          ),
          Positioned(
              top: 50, // 15 pixels from the top
              left: -(MediaQuery.of(context).size.width * 0.84),
              right: 0,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                child: const Icon(
                  Icons.arrow_back_outlined,
                  color: Colors.white,
                ),
              ) // Adjust the height as needed
              ),
        ],
      ),
    );
  }
}
