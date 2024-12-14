class SFormatters {
  SFormatters._();

  static String getGreetingMessage() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return "Good Morning,\n";
    } else if (hour < 18) {
      return "Good Afternoon,\n";
    } else {
      return "Good Evening,\n";
    }
  }
}
