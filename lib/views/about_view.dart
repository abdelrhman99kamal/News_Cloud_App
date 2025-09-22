import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/components/social_media_button.dart';

class AboutView extends StatefulWidget {
  const AboutView({super.key});

  @override
  State<AboutView> createState() => _AboutViewState();

  static Widget featureItem(String text, {IconData icon = Icons.check_circle}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.orange, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}

class _AboutViewState extends State<AboutView> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.5,
        foregroundColor: Colors.black87,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // App Icon and Title
            Center(
              child: Column(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,

                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/logo.png'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "News ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Cloud",
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Version 1.0.0',
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),
            const Divider(thickness: 1, height: 1, color: Colors.orange),
            const SizedBox(height: 28),

            // About the App Section
            const Text(
              'About the App',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 16,
                  height: 1.6,
                  color: Colors.black87,
                ),
                children: [
                  TextSpan(
                    text: 'News Cloud',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text:
                        ' is a modern news application that brings you the latest updates from trusted sources with a simple and fast interface. ',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            AnimatedCrossFade(
              duration: const Duration(milliseconds: 300),
              crossFadeState:
                  _isExpanded
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
              firstChild: GestureDetector(
                onTap: () => setState(() => _isExpanded = true),
                child: Text(
                  'Read more...',
                  style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              secondChild: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Explore news in various categories such as Sports, Technology, Science, Health, Entertainment, and Business. "
                    "You can open articles directly inside the app using WebView, along with direct links "
                    "to major international sources like beIN Sports.",
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.6,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () => setState(() => _isExpanded = false),
                    child: Text(
                      'Read less',
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),
            const Divider(thickness: 1, height: 1, color: Colors.orange),
            const SizedBox(height: 28),

            // Features Section
            const Text(
              "Features",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            AboutView.featureItem(
              "Latest news from trusted sources",
              icon: Icons.new_releases,
            ),
            AboutView.featureItem(
              "Multiple categories: Sports, Tech, Health, etc.",
              icon: Icons.category,
            ),
            AboutView.featureItem(
              "Read articles via integrated WebView",
              icon: Icons.article,
            ),
            AboutView.featureItem(
              "Direct links to major news sources",
              icon: Icons.link,
            ),
            AboutView.featureItem(
              "Clean, modern user interface",
              icon: Icons.design_services,
            ),
            AboutView.featureItem(
              "Fast and responsive performance",
              icon: Icons.speed,
            ),

            const SizedBox(height: 28),
            const Divider(thickness: 1, height: 1, color: Colors.orange),
            const SizedBox(height: 28),

            // Developer Section
            const Text(
              "Developer",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.orange, width: 3.5),
                  ),
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage('assets/a.jpg'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Abdelrhman Kamal",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const Text(
                        "Mobile App Developer",
                        style: TextStyle(fontSize: 15),
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SocialMediaButton(
                  icon: Icon(FontAwesomeIcons.whatsapp, size: 30),
                  label: "whatsapp",
                  color: const Color(0xFF049A06),
                  url: "https://wa.me/201019974379",
                ),
                SocialMediaButton(
                  icon: Image.asset(
                    'assets/g.png',
                    width: 30,
                    height: 30,
                    fit: BoxFit.fill,
                    // color: Colors.white,
                  ),
                  // icon: FontAwesomeIcons.envelope,
                  label: "Email",
                  color: Colors.white,
                  url: "mailto:abdelrhman99kamal@gmail.com",
                ),
                SocialMediaButton(
                  icon: Icon(FontAwesomeIcons.linkedin, size: 30),
                  label: "LinkedIn",
                  color: Colors.blue[800]!,
                  url: "https://www.linkedin.com/in/abdelrhman99kamal/",
                ),
                SocialMediaButton(
                  icon: Icon(FontAwesomeIcons.github, size: 30),
                  label: "GitHub",
                  color: Colors.black,
                  url: "https://github.com/abdelrhman99kamal",
                ),
                SocialMediaButton(
                  icon: Icon(FontAwesomeIcons.facebook, size: 30),
                  label: "Facebook",
                  color: const Color(0xFF1877F2),
                  url: "https://www.facebook.com/abdelrhman.kamal.261503",
                ),
                SocialMediaButton(
                  icon: Icon(FontAwesomeIcons.instagram, size: 30),
                  label: "Instagram",
                  color: const Color(0xFFE1306C),
                  url: "https://www.instagram.com/abdelrhman_kamal_99/",
                ),
              ],
            ),
            const SizedBox(height: 28),
            const Divider(thickness: 1, height: 1, color: Colors.orange),
            const SizedBox(height: 28),

            // Technology Section
            const Text(
              "Technology Used",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildTechChip("Flutter", FontAwesomeIcons.flutter),
                _buildTechChip("Dart", Icons.code),
                _buildTechChip("WebView", Icons.web),
                _buildTechChip("REST API", Icons.cloud),
              ],
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildTechChip(String text, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.orange.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: Colors.orange),
          const SizedBox(width: 6),
          Text(
            text,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
