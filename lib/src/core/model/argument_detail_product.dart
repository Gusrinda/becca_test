class DetailProductArgument {

  final bool isReadOnly;
  final bool isOrder;
  final bool isCart;

//<editor-fold desc="Data Methods">
  const DetailProductArgument({
    required this.isReadOnly,
    required this.isOrder,
    required this.isCart,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DetailProductArgument &&
          runtimeType == other.runtimeType &&
          isReadOnly == other.isReadOnly &&
          isOrder == other.isOrder &&
          isCart == other.isCart);

  @override
  int get hashCode => isReadOnly.hashCode ^ isOrder.hashCode ^ isCart.hashCode;

  @override
  String toString() {
    return 'DetailProductArgument{' +
        ' isReadOnly: $isReadOnly,' +
        ' isOrder: $isOrder,' +
        ' isCart: $isCart,' +
        '}';
  }

  DetailProductArgument copyWith({
    bool? isReadOnly,
    bool? isOrder,
    bool? isCart,
  }) {
    return DetailProductArgument(
      isReadOnly: isReadOnly ?? this.isReadOnly,
      isOrder: isOrder ?? this.isOrder,
      isCart: isCart ?? this.isCart,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isReadOnly': this.isReadOnly,
      'isOrder': this.isOrder,
      'isCart': this.isCart,
    };
  }

  factory DetailProductArgument.fromMap(Map<String, dynamic> map) {
    return DetailProductArgument(
      isReadOnly: map['isReadOnly'] as bool,
      isOrder: map['isOrder'] as bool,
      isCart: map['isCart'] as bool,
    );
  }

//</editor-fold>
}