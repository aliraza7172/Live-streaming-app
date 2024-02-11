abstract class SignInEvent {
  const SignInEvent();
}
///Events registered
class EmailEvent extends SignInEvent {
  final String email;
  const EmailEvent(this.email);
}
///Events triggered
class PasswordEvent extends SignInEvent {
  final String password;
  const PasswordEvent(this.password);
}
