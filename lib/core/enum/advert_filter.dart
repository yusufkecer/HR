enum AdvertFilterOptions { active, passive, all }

extension AdvertFilter on AdvertFilterOptions {
  String get options {
    switch (this) {
      case AdvertFilterOptions.active:
        return "Aktif";
      case AdvertFilterOptions.passive:
        return "Pasif";
      default:
        return "Tümü";
    }
  }
}
