import '../utils/logger.dart';
import '../utils/toast.dart';
import 'failures.dart';

abstract class Warning extends AppError with LogLayerMixin {
  Warning(super.error, {super.userMessage = 'Something that requires attention happened'}) {
    logWarning(error);
    Toast.warning('Warning', userMessage);
  }
}

//---RestaurantsRepoImpl----

class RestaurantsAddWarning extends Warning {
  RestaurantsAddWarning(
    super.error, {
    super.userMessage = 'A warning occurred while adding a restaurant',
  });
}

class RestaurantsUpdateWarning extends Warning {
  RestaurantsUpdateWarning(
    super.error, {
    super.userMessage = 'A warning occurred while updating a restaurant',
  });
}

class RestaurantsDeleteWarning extends Warning {
  RestaurantsDeleteWarning(
    super.error, {
    super.userMessage = 'A warning occurred while deleting a restaurant',
  });
}

class RestaurantsScheduleUpdateWarning extends Warning {
  RestaurantsScheduleUpdateWarning(
    super.error, {
    super.userMessage = 'A warning occurred while updating restaurant schedule date',
  });
}

class RestaurantsSnoozeUpdateWarning extends Warning {
  RestaurantsSnoozeUpdateWarning(
    super.error, {
    super.userMessage = 'A warning occurred while updating restaurant snooze',
  });
}

//---ReportsRepoImpl----
class ReportsAddWarning extends Warning {
  ReportsAddWarning(super.error, {super.userMessage = 'A warning occurred while adding a report'});
}

class ReportsUpdateWarning extends Warning {
  ReportsUpdateWarning(
    super.error, {
    super.userMessage = 'A warning occurred while updating a report',
  });
}

class ReportsDeleteWarning extends Warning {
  ReportsDeleteWarning(
    super.error, {
    super.userMessage = 'A warning occurred while deleting a report',
  });
}

class ReportsGetSimpleRestaurantsWarning extends Warning {
  ReportsGetSimpleRestaurantsWarning(
    super.error, {
    super.userMessage = 'A warning occurred while getting a restaurants names',
  });
}

//---AnalyticsRepoImpl---
class RiskDistributionLoadWarning extends Warning {
  RiskDistributionLoadWarning(
    super.error, {
    super.userMessage = 'Failed to fetch risk distribution',
  });
}

class TopAreasByReportsCountLoadWarning extends Warning {
  TopAreasByReportsCountLoadWarning(
    super.error, {
    super.userMessage = 'Failed to fetch top areas by reports count',
  });
}

class DailyVolumeLast30DaysLoadWarning extends Warning {
  DailyVolumeLast30DaysLoadWarning(
    super.error, {
    super.userMessage = 'Failed to fetch daily volume for last 30 days',
  });
}

class AvgVolumePerAreaLoadWarning extends Warning {
  AvgVolumePerAreaLoadWarning(
    super.error, {
    super.userMessage = 'Failed to fetch average volume per area',
  });
}

class WeeklyVolumeByAreaLoadWarning extends Warning {
  WeeklyVolumeByAreaLoadWarning(
    super.error, {
    super.userMessage = 'Failed to fetch weekly volume by area',
  });
}

class MonthlyGrowthLoadWarning extends Warning {
  MonthlyGrowthLoadWarning(
    super.error, {
    super.userMessage = 'Failed to fetch monthly growth data',
  });
}

class TopRestaurantsByVolumeLoadWarning extends Warning {
  TopRestaurantsByVolumeLoadWarning(
    super.error, {
    super.userMessage = 'Failed to fetch top restaurants by volume',
  });
}

//getVolumeQuantilesByArea
class VolumeQuantilesByAreaLoadWarning extends Warning {
  VolumeQuantilesByAreaLoadWarning(
    super.error, {
    super.userMessage = 'Failed to fetch volume quantiles by area',
  });
}

//getAreaShareOverTime
class AreaShareOverTimeLoadWarning extends Warning {
  AreaShareOverTimeLoadWarning(
    super.error, {
    super.userMessage = 'Failed to fetch area share over time',
  });
}

//getDailyAnomaliesByArea
class DailyAnomaliesByAreaLoadWarning extends Warning {
  DailyAnomaliesByAreaLoadWarning(
    super.error, {
    super.userMessage = 'Failed to fetch daily anomalies by area',
  });
}

//---AuthRepoImpl----

class AuthSignOutWarning extends Warning {
  AuthSignOutWarning(super.error, {super.userMessage = 'Sign out warning'});
}

//---NotesRepoImpl----
class NotesLoadWarning extends Warning {
  NotesLoadWarning(super.error, {super.userMessage = 'A warning occurred while loading notes'});
}

class NotesAddWarning extends Warning {
  NotesAddWarning(super.error, {super.userMessage = 'A warning occurred while adding a note'});
}

class NotesUpdateWarning extends Warning {
  NotesUpdateWarning(super.error, {super.userMessage = 'A warning occurred while updating a note'});
}

class NotesDeleteWarning extends Warning {
  NotesDeleteWarning(super.error, {super.userMessage = 'A warning occurred while deleting a note'});
}
