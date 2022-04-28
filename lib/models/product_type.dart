class ListProductType {
  int? value;
  String? name;

  ListProductType(this.value, this.name);

  static List<ListProductType> getListProductType() {
    return [
      ListProductType(1, 'อาหารเช้า'),
      ListProductType(2, 'อาหารเที่ยง'),
      ListProductType(3, 'อาหารเย็น'),
    ];
  }
}
