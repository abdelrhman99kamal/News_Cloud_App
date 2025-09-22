import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
    required this.url,
  });

  final Widget icon;
  final String label;
  final Color color;
  final String url;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final uri = Uri.tryParse(url.trim());

        if (uri == null || !uri.hasScheme) {
          showErrorSnack(context, "❌ Invalid URL for $label.");
          return;
        }

        try {
          final success = await launchUrl(
            uri,
            mode: LaunchMode.externalApplication,
          );

          if (!success) {
            showErrorSnack(context, "⚠️ Could not open $label link.");
          }
        } catch (e) {
          showErrorSnack(context, "⚠️ Error: $e");
        }
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(40, 40),
        elevation: 4,
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
      child: icon,
    );
  }

  void showErrorSnack(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}
