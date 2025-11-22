//general use
import 'package:intl/intl.dart';

const String kFontFamily = 'Abel'; //original font -> 'Nova'

const kBorderRadius = (
  none: 0.0,
  outer: 4.0,
  inner: 8.0,
  circle: 100.0,
  //app specific
  window: 8.0,
);

const kBorderWidth = (none: 0.0, thin: 0.5, normal: 1.0, thick: 2.0);

const kIconSize = (micro: 12.0, tiny: 15.0, small: 17.0, medium: 20.0, large: 25.0, massive: 32.0);

const kDuration = (
  zero: Duration.zero,
  rapid: Duration(milliseconds: 100),
  fast: Duration(milliseconds: 200),
  medium: Duration(milliseconds: 300),
  long: Duration(milliseconds: 1000),
);

const kElevation = (none: 0.0, soft: 1.0, strong: 3.0, sharp: 8.0);

const kPadding = (small: 4, medium: 8, large: 12);

const kMobileBreakpoint = 600.0;

final kNumberFormat = NumberFormat.decimalPattern();

final kDate = DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY);

//---app specific---

const kRestaurantsTable = 'restaurants_v3';
const kRestaurantsView = 'restaurant_risk_vw_v3';
const kReportsTable = 'oil_reports_v3';
const kUsersTable = 'users';
const kNotesTable = 'notes';

const kRestaurantsRiskViewColumns = (
  id: 'id',
  name: 'name',
  area: 'area',
  phones: 'phones',
  drumSize: 'drum_size',
  uniqueKey: 'unique_key',
  createdAt: 'created_at',
  reportsCount: 'reports_count',
  medianGapDays: 'median_gap_days',
  meanGapDays: 'mean_gap_days',
  lastCollectionDate: 'last_collection_date',
  daysSinceLat: 'days_since_last',
  typicalGapDays: 'typical_gap_days',
  riskScore: 'risk_score',
  riskLabel: 'risk_label',
  confidenceRank: 'confidence_rank',
);

const kAsset = (
  logo: 'assets/animations/logo.json',
  file: 'assets/images/file.png',
  url: 'assets/images/url.png',
  folder: 'assets/images/folder.png',
  folderOpen: 'assets/images/folder_open.png',
);

const kGap = (small: 5.0, medium: 10.0, big: 30.0);

const kDashHori = (height: 3.0, width: 5.0, widthHovered: 15.0, widthExpanded: 15.0, widthExpandedHovered: 30.0);

const kDashVert = (height: 5.0, heightHovered: 17.0, width: 3.0);

const kLogo = (width: 30.0, height: 30.0);

const kDialogButton = (width: 60.0, height: 30.0);

const kContextMenu = (height: 33.0, width: 180.0);

const kSidebar = (width: 170.0);

const kPopupMenuButton = (width: 130.0);

const kToastButton = (width: 30.0, height: 30.0);

const kButtonSmall = (width: 20.0, height: 20.0);

//hive boxes
const kHiveBox = (prefs: 'prefsBox', items: 'itemsBox');

//init prefs
const kPrefsInit = (
  backgroundOpacity: 1.0,
  selectedBackgroundEffect: 0,
  selectedAccentColor: 0,
  theme: 0,
  hasBorder: false,
  mixBackgroundWithAccent: false,
  useSystemAccentColor: false,
);
