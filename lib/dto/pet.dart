abstract class PetDto {
  PetDto.defaults() {
    this.name = "";
    this.nickname = "";
    this.dateOfBirth = null;
  }

  PetDto(this.name, this.nickname, this.dateOfBirth);

  String name;
  String nickname;
  DateTime dateOfBirth;
}
