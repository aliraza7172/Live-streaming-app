import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_up_live/presentation/login/bloc/signin_event.dart';
import 'package:stream_up_live/presentation/login/bloc/signin_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState()) {
    // on<EmailEvent>((event, emit) {
    //   emit(state.copyWith(email: event.email));
    // });
    ///handler
    on<EmailEvent>(_emailEvent);

    // on<PasswordEvent>((event, emit) {
    //   emit(state.copyWith(passward: event.password));
    // });
    on<PasswordEvent>(_passwordEvent);
  }

  void _emailEvent(EmailEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(passward: event.password));
  }
}
