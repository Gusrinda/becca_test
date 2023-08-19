class DummyVisitingModel {

  final String namaPT;
  final String tipeVisiting;
  final bool isRealisasi;

//<editor-fold desc="Data Methods">
  const DummyVisitingModel({
    required this.namaPT,
    required this.tipeVisiting,
    required this.isRealisasi,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DummyVisitingModel &&
          runtimeType == other.runtimeType &&
          namaPT == other.namaPT &&
          tipeVisiting == other.tipeVisiting &&
          isRealisasi == other.isRealisasi);

  @override
  int get hashCode =>
      namaPT.hashCode ^ tipeVisiting.hashCode ^ isRealisasi.hashCode;

  @override
  String toString() {
    return 'DummyVisitingModel{' +
        ' namaPT: $namaPT,' +
        ' tipeVisiting: $tipeVisiting,' +
        ' isRealisasi: $isRealisasi,' +
        '}';
  }

  DummyVisitingModel copyWith({
    String? namaPT,
    String? tipeVisiting,
    bool? isRealisasi,
  }) {
    return DummyVisitingModel(
      namaPT: namaPT ?? this.namaPT,
      tipeVisiting: tipeVisiting ?? this.tipeVisiting,
      isRealisasi: isRealisasi ?? this.isRealisasi,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'namaPT': this.namaPT,
      'tipeVisiting': this.tipeVisiting,
      'isRealisasi': this.isRealisasi,
    };
  }

  factory DummyVisitingModel.fromMap(Map<String, dynamic> map) {
    return DummyVisitingModel(
      namaPT: map['namaPT'] as String,
      tipeVisiting: map['tipeVisiting'] as String,
      isRealisasi: map['isRealisasi'] as bool,
    );
  }

//</editor-fold>
}