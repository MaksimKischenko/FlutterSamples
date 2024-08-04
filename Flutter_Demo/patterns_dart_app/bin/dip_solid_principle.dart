abstract class NotificationService {
  void sendNotification(String message);
}

class EmailNotificationService implements NotificationService {
  @override
  void sendNotification(String message) {
    print('Sending email: $message');
  }
}

class SMSNotificationService implements NotificationService {
  @override
  void sendNotification(String message) {
    print('Sending SMS: $message');
  }
}

class UserService {
  final NotificationService notificationService;

  UserService(this.notificationService);

  void registerUser(String username) {
    // Логика регистрации пользователя
    print('User $username registered.');
    notificationService.sendNotification('Welcome $username!');
  }
}

void main() {
  // Создаем конкретные реализации уведомлений
  NotificationService emailService = EmailNotificationService();
  NotificationService smsService = SMSNotificationService();
  
  // Внедряем зависимости в UserService
  UserService userServiceWithEmail = UserService(emailService);
  UserService userServiceWithSMS = UserService(smsService);
  
  // Используем UserService
  userServiceWithEmail.registerUser('Alice');
  userServiceWithSMS.registerUser('Bob');
}