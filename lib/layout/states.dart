abstract class BookingStates{}
class initialState extends BookingStates{}
class ChangeNavState extends BookingStates{}
class ChangeModeState extends BookingStates{}
// for get data from api
class LayoutGetCurrentHardcoverFictionDataSuccessState extends BookingStates {}

class LayoutGetCurrentHardcoverFictionDataErrorState extends BookingStates {}

class LayoutGetCurrentHardcoverFictionDataLoadingState extends BookingStates {}

// for get data from api
class LayoutGetCurrentMangaDataSuccessState extends BookingStates {}

class LayoutGetCurrentMangaDataErrorState extends BookingStates {}

class LayoutGetCurrentMangaDataLoadingState extends BookingStates {}

// for
class LayoutGetCurrentPictureBooksDataLoadingState extends BookingStates {}

class LayoutGetCurrentPictureBooksDataSuccessState extends BookingStates {}

class LayoutGetCurrentPictureBooksDataErrorState extends BookingStates {}

// for since
class LayoutGetCurrentScienceDataLoadingState extends BookingStates {}

class LayoutGetCurrentScienceDataSuccessState extends BookingStates {}

class LayoutGetCurrentScienceDataErrorState extends BookingStates {}

// for Sports list 5🎿
class LayoutGetCurrentSportsDataLoadingState extends BookingStates {}

class LayoutGetCurrentSportsDataSuccessState extends BookingStates {}

class LayoutGetCurrentSportsDataErrorState extends BookingStates {}

// for libraryData
class LayoutGetLibraryDataLoadingState extends BookingStates {}

class LayoutGetLibraryDataSuccessState extends BookingStates {}

// for downloadData
class LayoutGetDownloadDataLoadingState extends BookingStates {}

class LayoutGetDownloadDataSuccessState extends BookingStates {}

// for launchURLBrowser 🎿
class LayoutLaunchURLBrowserLoadingState extends BookingStates {}

class LayoutLaunchURLBrowserSuccessState extends BookingStates {}

class LayoutLaunchURLBrowserErrorState extends BookingStates {}

//for FavoriteBook
class FavoriteBookLoadingState extends BookingStates{}
class FavoriteBookSuccessState extends BookingStates{}