abstract class Services {
  Future<void> newBike(String name, String rollno, String phno, String bmodel,
      String vno, String year, String dept, String section);
  Future<void> insertUser(String mail, String pass);
}
