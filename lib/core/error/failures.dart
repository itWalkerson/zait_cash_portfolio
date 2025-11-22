import '../utils/logger.dart';
import '../utils/toast.dart';

abstract class AppError {
  final Object error;
  final String userMessage;

  AppError(this.error, {this.userMessage = 'An error occurred'});
}

abstract class Failure extends AppError with LogLayerMixin {
  Failure(super.error, {super.userMessage = 'A failure occurred'}) {
    logError(error);
    Toast.error('Failure', userMessage);
  }
}

//---RestaurantsRepoImpl----

class RestaurantsLoadFailure extends Failure {
  RestaurantsLoadFailure(
    super.error, {
    super.userMessage = 'A failure occurred while loading restaurants',
  });
}

class RestaurantsCountFailure extends Failure {
  RestaurantsCountFailure(
    super.error, {
    super.userMessage = 'A failure occurred while getting restaurants count',
  });
}

//---ReportsRepoImpl----
class ReportsLoadFailure extends Failure {
  ReportsLoadFailure(super.error, {super.userMessage = 'A failure occurred while loading reports'});
}

//---AnalyticsRepoImpl----
class AnalyticsLoadFailure extends Failure {
  AnalyticsLoadFailure(
    super.error, {
    super.userMessage = 'A failure occurred while loading analytics data',
  });
}

//---AuthRepoImpl----
class AuthSignInFailure extends Failure {
  AuthSignInFailure(super.error, {super.userMessage = 'Sign in failed'});
}

class AuthSignUpFailure extends Failure {
  AuthSignUpFailure(super.error, {super.userMessage = 'Sign up failed'});
}

class AuthSignOutFailure extends Failure {
  AuthSignOutFailure(super.error, {super.userMessage = 'Sign out failed'});
}

class AuthGetUserFailure extends Failure {
  AuthGetUserFailure(super.error, {super.userMessage = 'Get current user failed'});
}
