abstract class Performer {
  void perform();
}

mixin Dancer implements Performer {
  @override
  void perform() {
    print('Dancing');
  }
}

mixin Singer implements Performer {
  @override
  void perform() {
    print('Singing');
  }
}

class Musician extends Performer with Dancer, Singer {
  void showTime() {
    perform();
  }
}

class IndiaArtist extends Performer with Singer, Dancer {
  void showTime() {
    perform();
  }
}

void main() {
  var rizalArmada = Musician();
  rizalArmada.perform();

  var sahrulkhan = IndiaArtist();
  sahrulkhan.perform();
}
