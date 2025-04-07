import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_hub/features/auth/presentation/cubits/sign_up_cubit/sign_up_state.dart'
    show SignUpFailure, SignUpInitial, SignUpState, SignUpSuccess;

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());
  final IAuthRepo authRepo;
  Future<void> createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required String name}) async {
    final result =
        await authRepo.createUserWithEmailAndPassword(email, password, name);
    result.fold(
      (failure) => emit(SignUpFailure(failure.message)),
      (user) => emit(SignUpSuccess(user)),
    );
  }
}
