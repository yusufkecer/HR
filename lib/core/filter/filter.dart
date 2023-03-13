import '../enum/advert_filter.dart';

class Filter {
  static final Filter _singleton = Filter._internal();
  static Filter get instance {
    return _singleton;
  }

  Filter._internal();

  AdvertFilterOptions? filterOptions;

  set updateFilter(AdvertFilterOptions selected) {
    filterOptions = selected;
  }

  AdvertFilterOptions get getFilter {
    filterOptions ??= AdvertFilterOptions.all;
    return filterOptions!;
  }
}
