void main(List<String> arguments) {
  MotherBoard b450 = MotherBoard(
      nome: "B450-M",
      tamanho: "m-ATX",
      peso: 28,
      socket: "AM4",
      slotsMemoria: 4,
      slotsPci: 2,
      energiaNecessaria: 10);

  Cpu ryzen5 = Cpu(
      nome: "Ryzen 5 3600",
      socket: "AM4",
      peso: 58.0,
      nucleos: 6,
      threads: 12,
      energiaNecessaria: 10);

  Energia thunder = Energia(
      nome: "Thunder 400",
      peso: 200,
      tipo: "Modular",
      seloDeConfianca: "80W plus bronze",
      energiaTotal: 400);

  Gpu gtx1650s = Gpu(
      nome: "GTX 1650super",
      socket: "PCI Express",
      numeroFans: 1,
      energiaNecessaria: 10);

  Armazenamento pichau = Armazenamento(
      nome: "pichau 512",
      peso: 100,
      socket: "SSD Sata",
      tamanhoArmazenamento: 512,
      velocidadeArmazenamento: 500,
      energiaNecessaria: 10);

  Memoria tforce = Memoria(
      nome: "T-Force",
      peso: 20,
      tamanho: 8,
      socket: "DDR4",
      frequencia: 3200,
      energiaNecessaria: 10);

  /*print(b450.energiaNecessaria);
  print(ryzen5.energiaNecessaria);
  print(thunder.energiaTotal);
  print(gtx1650s.energiaNecessaria);
  print(pichau.energiaNecessaria);
  print(tforce.energiaNecessaria);*/

  int energiaComponentes = b450.energiaNecessaria +
      ryzen5.energiaNecessaria +
      gtx1650s.energiaNecessaria +
      pichau.energiaNecessaria +
      tforce.energiaNecessaria;

  print(energiaComponentes);

  funcAguenta(
      energiaFonte: thunder.energiaTotal,
      energiaComponentes: energiaComponentes);

  b450.separarPecas();
  b450.montarComputador();
  b450.ligarPC();

  gtx1650s.separarPecas();
  gtx1650s.montarComputador();
  gtx1650s.ligarPC();
}

//Tipos de Paramêtros

//Posicionais Obrigatórios = só declarar porénm tem que ser na ordem
//Nomeados Opcionais = entre {com null safety} e na hora de chamar tem que declarar aonde. Cor: "Roxo";
//Parametros com "Padrão" =  declara no inicio do parametro. String cor = roxo;
//Modificador "Required" = Opcional Obrigatório required String cor. sem atribuir valores.

class Componentes implements MontarPC {
  String? nome;
  double peso;
  String? socket;
  int energiaNecessaria;

  Componentes(
      {this.nome, this.peso = 0, this.socket, this.energiaNecessaria = 0});

  void funcPrintComponentes() {
    print("Este(a) $nome precisa de $energiaNecessaria W para funcionar!");
  }

  @override
  void separarPecas() {
    print("Tirar a $nome da caixa");
  }

  @override
  void montarComputador() {
    print("Colocar no Gabinete");
  }

  @override
  void ligarPC() {
    print("Testar se ligou");
  }
}

class MotherBoard extends Componentes implements MontarPC {
  String tamanho;
  int slotsMemoria;
  int slotsPci;

  MotherBoard(
      {required String nome,
      required double peso,
      required this.tamanho,
      required String? socket,
      required this.slotsMemoria,
      required this.slotsPci,
      required int energiaNecessaria})
      : super(
            nome: nome,
            peso: peso,
            socket: socket,
            energiaNecessaria: energiaNecessaria);

  @override
  void separarPecas() {
    print("Separar a $nome");
    super.separarPecas();
  }
}

class Cpu extends Componentes {
  int nucleos;
  int threads;

  Cpu(
      {required String nome,
      required double peso,
      required String socket,
      required this.nucleos,
      required this.threads,
      required int energiaNecessaria})
      : super(
            nome: nome,
            peso: peso,
            socket: socket,
            energiaNecessaria: energiaNecessaria);
  @override
  void separarPecas() {
    print("Separar a $nome");
    super.separarPecas();
  }
}

class Memoria extends Componentes {
  int frequencia;
  int tamanho;

  Memoria(
      {required String nome,
      required double peso,
      required this.tamanho,
      required String socket,
      required this.frequencia,
      required int energiaNecessaria})
      : super(
            nome: nome,
            peso: peso,
            socket: socket,
            energiaNecessaria: energiaNecessaria);
  @override
  void separarPecas() {
    print("Separar a $nome");
    super.separarPecas();
  }
}

class Gpu extends Componentes {
  int numeroFans;

  Gpu(
      {required String nome,
      double peso = 0,
      required String socket,
      required this.numeroFans,
      required int energiaNecessaria})
      : super(
            nome: nome,
            peso: peso,
            socket: socket,
            energiaNecessaria: energiaNecessaria);
  @override
  void separarPecas() {
    print("Separar a $nome");
    super.separarPecas();
  }
}

class Armazenamento extends Componentes {
  int tamanhoArmazenamento;
  int velocidadeArmazenamento;

  Armazenamento(
      {required String nome,
      required double peso,
      required String socket,
      required this.tamanhoArmazenamento,
      required this.velocidadeArmazenamento,
      required int energiaNecessaria})
      : super(
            nome: nome,
            peso: peso,
            socket: socket,
            energiaNecessaria: energiaNecessaria);
  @override
  void separarPecas() {
    print("Separar a $nome");
    super.separarPecas();
  }
}

class Energia extends Componentes {
  String tipo;
  String seloDeConfianca;
  int energiaTotal;

  Energia(
      {required String nome,
      required double peso,
      required this.tipo,
      required this.seloDeConfianca,
      required this.energiaTotal})
      : super(nome: nome, peso: peso);
  @override
  void separarPecas() {
    print("Separar a $nome");
    super.separarPecas();
  }
}

abstract class MontarPC {
  void separarPecas();
  void montarComputador();
  void ligarPC();
}

void funcAguenta({required int energiaFonte, required int energiaComponentes}) {
  if (energiaFonte >= energiaComponentes) {
    print("esta budega aguenta o tranco");
  } else {
    print("se fudeu papai");
  }
}
