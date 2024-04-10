class FrameModel {
  String framePath;
  Map logo;
  Map email;
  Map contact;
  Map address;
  Map name;
  Map icon;
  Map? designation;
  Map? watermark;
  Map? optionalContactNo;
  FrameModel(this.framePath, this.logo, this.email, this.contact, this.address,
      this.name, this.icon, {this.designation, this.watermark, this.optionalContactNo});
}
