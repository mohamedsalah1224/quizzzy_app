class AppListData {
  const AppListData._();
  static const List<String> specializationList = ["علمي", "ادبي", "فني"];
  static const List<String> governoratListGaza = [
    "القدس",
    "أريحا والأغوار",
    "شمال غزة",
    "غزة",
    "الوسطى",
    "خان يونس",
    "رفح"
  ];
  static const List<String> governorateListWest = [
    "بيت لحم",
    "الخليل",
    "جنين",
    "الوسطى",
  ];
// to get the Area Name based on the valu of governorateList (west , giza) that selected from dropDown
  static const Map<String, List<String>> getAreaName = {
    "القدس": [
      "أبو ديس",
      " بيت إجزا",
      "بيت إكسا"
          "السواحرة الغربية",
      "أم طوبا",
      "بتير",
    ],
    "بيت لحم": ["الحجيلة", "الحدايدة", "الحلقوم"],
    "الخليل": [],
    "رام الله والبيرة": [],
    "نابلس": [],
    "سلفيت": [],
    "قلقيلية": [],
    "طولكرم": [],
    "طوباس": [],
    "جنين": [],
    "أريحا والأغوار": ["مصر"],
    "شمال غزة": [],
    "غزة": [],
    "الوسطى": [],
    "خان يونس": [],
    "رفح": [],
  };

  static const List<String> stateOfAreaList = ["مخيم", "قرية", "مدينة"];
}
