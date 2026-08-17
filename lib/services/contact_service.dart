class ContactMessage {
  const ContactMessage({
    required this.name,
    required this.email,
    required this.subject,
    required this.message,
  });

  final String name;
  final String email;
  final String subject;
  final String message;
}

enum ContactStatus { unconfigured, success, failure }

class ContactResult {
  const ContactResult({required this.status, required this.message});

  final ContactStatus status;
  final String message;

  factory ContactResult.unconfigured() {
    return const ContactResult(
      status: ContactStatus.unconfigured,
      message:
          'Email delivery is not configured yet. Connect EmailJS, Formspree, or a custom API in ContactService.',
    );
  }
}

/// Swap [UnconfiguredContactService] for EmailJS, Formspree, or a custom API.
abstract class ContactService {
  Future<ContactResult> send(ContactMessage message);

  static ContactService instance = UnconfiguredContactService();
}

class UnconfiguredContactService implements ContactService {
  @override
  Future<ContactResult> send(ContactMessage message) async {
    return ContactResult.unconfigured();
  }
}
