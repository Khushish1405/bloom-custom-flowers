import 'package:url_launcher/url_launcher.dart';

/// ──────────────────────────────────────────────
/// WhatsApp Helper — Bloom Custom Flowers
/// ──────────────────────────────────────────────
/// Single place to configure the business WhatsApp
/// number and generate pre-filled order messages.
/// ──────────────────────────────────────────────

class WhatsAppHelper {
  WhatsAppHelper._();

  /// ── Business WhatsApp Number ─────────────────
  /// Change this to your business WhatsApp number.
  /// Include country code without + or spaces.
  /// Example: '919586669463' for +91 98765 43210
  static const String businessWhatsAppNumber = '919586669463';

  /// ── Business Display Name ────────────────────
  static const String businessName = 'Bloom Custom Flowers';

  /// ── Send a WhatsApp message ──────────────────
  static Future<void> sendMessage(String message) async {
    final encodedMessage = Uri.encodeComponent(message);
    final url = Uri.parse(
      'https://wa.me/$businessWhatsAppNumber?text=$encodedMessage',
    );

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  /// ── Quick WhatsApp (no message) ──────────────
  static Future<void> openChat() async {
    final url = Uri.parse('https://wa.me/$businessWhatsAppNumber');

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  /// ── Generate Order Message ───────────────────
  /// Builds a formatted order message from components.
  static String generateOrderMessage({
    required Map<String, int> flowers,
    required String wrapping,
    required List<String> extras,
    String? personalMessage,
    required String customerName,
    required String phone,
    required String deliveryDate,
    required String deliveryAddress,
    required double estimatedPrice,
  }) {
    final buffer = StringBuffer();

    buffer.writeln('Hello, I would like to order a customized bouquet.');
    buffer.writeln();

    // Flowers
    if (flowers.isNotEmpty) {
      buffer.writeln('🌸 *Flowers:*');
      flowers.forEach((name, qty) {
        buffer.writeln('  $name — $qty');
      });
      buffer.writeln();
    }

    // Wrapping
    if (wrapping.isNotEmpty) {
      buffer.writeln('🎀 *Wrapping:*');
      buffer.writeln('  $wrapping');
      buffer.writeln();
    }

    // Extras
    if (extras.isNotEmpty) {
      buffer.writeln('🎁 *Extras:*');
      for (final extra in extras) {
        buffer.writeln('  $extra');
      }
      buffer.writeln();
    }

    // Personal Message
    if (personalMessage != null && personalMessage.isNotEmpty) {
      buffer.writeln('💌 *Personal Message:*');
      buffer.writeln('  $personalMessage');
      buffer.writeln();
    }

    // Customer Info
    buffer.writeln('👤 *Customer Name:*');
    buffer.writeln('  $customerName');
    buffer.writeln();

    buffer.writeln('📞 *Phone:*');
    buffer.writeln('  $phone');
    buffer.writeln();

    buffer.writeln('📅 *Delivery Date:*');
    buffer.writeln('  $deliveryDate');
    buffer.writeln();

    buffer.writeln('📍 *Delivery Address:*');
    buffer.writeln('  $deliveryAddress');
    buffer.writeln();

    buffer.writeln('💰 *Estimated Price:*');
    buffer.writeln('  ₹${estimatedPrice.toStringAsFixed(0)}');
    buffer.writeln();

    buffer.writeln('Please confirm the final price and availability. 🙏');

    return buffer.toString();
  }
}
