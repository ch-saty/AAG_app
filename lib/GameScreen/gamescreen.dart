import 'package:AAG/GameScreen/gamescreen2.dart';
import 'package:AAG/LeagueScreen/leaguescreen_one.dart';
import 'package:AAG/TournamentScreen/tournamentscreen_one.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

class AppGamesScreen extends StatefulWidget {
  const AppGamesScreen({super.key});

  @override
  State<AppGamesScreen> createState() => _AppGamesScreenState();
}

class _AppGamesScreenState extends State<AppGamesScreen> {
  int revealedCount = 1; // Initialize with 1 since first card is revealed

  void incrementCounter() {
    setState(() {
      if (revealedCount < 5) {
        revealedCount++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar:
          true, // This will extend the body behind the AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Transparent AppBar
        elevation: 0, // No shadow
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'GAMES',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/images/idkbg.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: ListView(
          children: [
            _buildDailyLimit(context),
            _buildSection(context, 'PUBLISH', 'lib/images/ic3.png', 'Games', 5),
            _buildSection(
                context, 'EVENTS', 'lib/images/ic3.png', 'Leagues', 2),
            _buildSection(context, '', '', 'Tournament', 2),
          ],
        ),
      ),
    );
  }

  Widget _buildDailyLimit(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height * 0.18,
      width: screenSize.width * 0.9,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.orange.withOpacity(0.5),
          width: 2,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF8A2BE2), // BlueViolet
                      Color(0xFF9370DB), // MediumPurple
                      Color(0xFFBA55D3), // MediumOrchid
                      Color(0xFFDDA0DD), // Plum
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // 'DAILY LIMIT' section centered
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'DAILY LIMIT',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            width: 2,
                            height: 20,
                            color: Colors.white,
                          ),
                          Text(
                            '$revealedCount/5', // Displaying the counter here
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // 'View All' at the rightmost
                    const Row(
                      children: [
                        Text(
                          'View All',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 12,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                    5,
                    (index) => FlipCard(
                      index: index,
                      isRevealed: index < revealedCount,
                      onFlip: incrementCounter,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Adding the View All button at the bottom right corner
          // Positioned(
          //   // bottom: 10,
          //   top: 10,
          //   right: 50,
          //   child: InkWell(
          //     onTap: () {
          //       // Handle the "View All" button click here
          //       if (kDebugMode) {
          //         print("View All button pressed");
          //       }
          //     },
          //     child: Container(
          //       height: 20,
          //       width: 30,
          //       // padding:
          //       //     const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          //       // decoration: BoxDecoration(
          //       //   gradient: const LinearGradient(
          //       //     colors: [
          //       //       Color(0xFFFF8C00), // DarkOrange
          //       //       Color(0xFFFFD700), // Gold
          //       //     ],
          //       //     begin: Alignment.topLeft,
          //       //     end: Alignment.bottomRight,
          //       //   ),
          //       //   borderRadius: BorderRadius.circular(20),
          //       //   boxShadow: [
          //       //     BoxShadow(
          //       //       color: Colors.black.withOpacity(0.3),
          //       //       blurRadius: 5,
          //       //       spreadRadius: 1,
          //       //       offset: const Offset(0, 2),
          //       //     ),
          //       //   ],
          //       // ),
          //       child: const Row(
          //         children: [
          //           Text(
          //             'View All',
          //             style: TextStyle(
          //               color: Colors.white,
          //               fontWeight: FontWeight.bold,
          //               fontSize: 16,
          //             ),
          //           ),
          //           SizedBox(width: 8),
          //           Icon(
          //             Icons.arrow_forward_ios,
          //             color: Colors.white,
          //             size: 16,
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

Widget _buildSection(BuildContext context, String title, String iconPath,
    String subtitle, int gameCount) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (title.isNotEmpty)
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Image.asset(iconPath, width: 24, height: 24),
              const SizedBox(width: 8),
              Text(title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(subtitle,
            style: const TextStyle(color: Colors.white, fontSize: 16)),
      ),
      GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        padding: const EdgeInsets.all(12),
        children: List.generate(
          gameCount,
          (index) => GestureDetector(
            onTap: () {
              // Updated navigation logic based on subtitle
              switch (subtitle) {
                case 'Games':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GamesScreen()),
                  );
                  break;
                case 'Leagues':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LeagueScreen()),
                  );
                  break;
                case 'Tournament':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Tournamentscreen()),
                  );
                  break;
              }
            },
            child: Container(
              height: 131,
              width: 140,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'lib/images/g1.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

class FlipCard extends StatefulWidget {
  final int index;
  final bool isRevealed;
  final VoidCallback onFlip;

  const FlipCard({
    super.key,
    required this.index,
    required this.isRevealed,
    required this.onFlip,
  });

  @override
  _FlipCardState createState() => _FlipCardState();
}

class _FlipCardState extends State<FlipCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isRevealed = false;
  late Timer _gradientTimer;
  double _gradientPosition = -1.0;

  @override
  void initState() {
    super.initState();
    _isRevealed = widget.isRevealed;
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    if (_isRevealed) {
      _controller.value = 1.0;
    }
    _gradientTimer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      setState(() {
        _gradientPosition += 0.02;
        if (_gradientPosition >= 2.0) _gradientPosition = -1.0;
      });
    });
  }

  @override
  void didUpdateWidget(FlipCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isRevealed != oldWidget.isRevealed) {
      setState(() {
        _isRevealed = widget.isRevealed;
        if (_isRevealed) {
          _controller.value = 1.0;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!_isRevealed) {
          setState(() {
            _isRevealed = true;
          });
          _controller.forward();
          widget.onFlip(); // Call the callback when card is flipped
        }
      },
      child: Container(
        width: 60,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.orange.withOpacity(0.5),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.orange.withOpacity(0.3),
              blurRadius: 2,
              spreadRadius: 1,
            ),
          ],
        ),
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            final angle = _animation.value * pi;
            return Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(angle),
              alignment: Alignment.center,
              child: angle >= pi / 2
                  ? Transform(
                      transform: Matrix4.identity()..rotateY(pi),
                      alignment: Alignment.center,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          height: 80,
                          width: 60,
                          'lib/images/g1.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          begin:
                              Alignment(_gradientPosition, _gradientPosition),
                          end: Alignment(
                              _gradientPosition + 1, _gradientPosition + 1),
                          colors: [
                            Colors.orange.shade800,
                            Colors.orange.shade400,
                            Colors.orange.shade800,
                          ],
                          stops: const [0.0, 0.5, 1.0],
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          '?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _gradientTimer.cancel();
    super.dispose();
  }
}
