import 'package:sliver_test/domain/model/collectable.dart';
import 'package:sliver_test/domain/model/ntf.dart';
import 'package:sliver_test/domain/model/token.dart';

class DummyData {
  static final tokens = [
    Token(name: "Klay", amount: 45.12, price: 3247.93, unit: "USD", imgSrc: "assets/image/klay.png", iconSrc: "assets/image/klay.png"),
    Token(name: "Bora", amount: 45.15, price: 3247.93, unit: "USD", imgSrc: "assets/image/bora.png", iconSrc: "assets/image/bora.png"),
    Token(name: "Wemix", amount: 160.23, price: 47.93, unit: "USD", imgSrc: "assets/image/wemix.png", iconSrc: "assets/image/wemix.png"),
    Token(name: "Kronos", amount: 360.24, price: 247.93, unit: "USD", imgSrc: "assets/image/kronos.png", iconSrc: "assets/image/kronos.png"),
    Token(name: "Draco", amount: 60.25, price: 3247.93, unit: "USD", imgSrc: "assets/image/draco.png", iconSrc: "assets/image/draco.png"),
    Token(name: "Hydra", amount: 160.51, price: 47.93, unit: "USD", imgSrc: "assets/image/hydra.png", iconSrc: "assets/image/hydra.png"),
  ];

  static final collectables = [
    Collectable(name: "STEPN", ntfs: List.generate(17, (i) => Ntf(tokenId: "#12345", onwerName: "Citizen Gorillarz", contractAddr: "test", charName: "Monkey Kingdom", ntfClass: "Warrior", imgSrc: "assets/image/p1.png"))),
    Collectable(name: "Citizen Gorillarz", ntfs: List.generate(5, (i) => Ntf(tokenId: "#12345", onwerName: "Citizen Gorillarz", contractAddr: "test", charName: "Monkey Kingdom", ntfClass: "Warrior", imgSrc: "assets/image/p2.png"))),
    Collectable(name: "Potral Gagaga", ntfs: List.generate(3, (i) => Ntf(tokenId: "#12345", onwerName: "Citizen Gorillarz", contractAddr: "test", charName: "Monkey Kingdom", ntfClass: "Warrior", imgSrc: "assets/image/p3.png"))),
    Collectable(name: "Potral STEPN", ntfs: List.generate(17, (i) => Ntf(tokenId: "#12345", onwerName: "Citizen Gorillarz", contractAddr: "test", charName: "Monkey Kingdom", ntfClass: "Warrior", imgSrc: "assets/image/p${i % 3 + 1}.png"))),
    Collectable(name: "Gorillarz Potral", ntfs: List.generate(5, (i) => Ntf(tokenId: "#12345", onwerName: "Citizen Gorillarz", contractAddr: "test", charName: "Monkey Kingdom", ntfClass: "Warrior", imgSrc: "assets/image/p${i % 3 + 1}.png"))),
    Collectable(name: "STEPN", ntfs: List.generate(17, (i) => Ntf(tokenId: "#12345", onwerName: "Citizen Gorillarz", contractAddr: "test", charName: "Monkey Kingdom", ntfClass: "Warrior", imgSrc: "assets/image/p${i % 3 + 1}.png"))),
    Collectable(name: "Citizen Gorillarz", ntfs: List.generate(5, (i) => Ntf(tokenId: "#12345", onwerName: "Citizen Gorillarz", contractAddr: "test", charName: "Monkey Kingdom", ntfClass: "Warrior", imgSrc: "assets/image/p${i % 3 + 1}.png"))),
    Collectable(name: "Potral Gagaga", ntfs: List.generate(3, (i) => Ntf(tokenId: "#12345", onwerName: "Citizen Gorillarz", contractAddr: "test", charName: "Monkey Kingdom", ntfClass: "Warrior", imgSrc: "assets/image/p${i % 3 + 1}.png"))),
    Collectable(name: "Potral STEPN", ntfs: List.generate(17, (i) => Ntf(tokenId: "#12345", onwerName: "Citizen Gorillarz", contractAddr: "test", charName: "Monkey Kingdom", ntfClass: "Warrior", imgSrc: "assets/image/p${i % 3 + 1}.png"))),
    Collectable(name: "Gorillarz Potral", ntfs: List.generate(5, (i) => Ntf(tokenId: "#12345", onwerName: "Citizen Gorillarz", contractAddr: "test", charName: "Monkey Kingdom", ntfClass: "Warrior", imgSrc: "assets/image/p${i % 3 + 1}.png"))),
    Collectable(name: "STEPN", ntfs: List.generate(17, (i) => Ntf(tokenId: "#12345", onwerName: "Citizen Gorillarz", contractAddr: "test", charName: "Monkey Kingdom", ntfClass: "Warrior", imgSrc: "assets/image/p${i % 3 + 1}.png"))),
    Collectable(name: "Citizen Gorillarz", ntfs: List.generate(5, (i) => Ntf(tokenId: "#12345", onwerName: "Citizen Gorillarz", contractAddr: "test", charName: "Monkey Kingdom", ntfClass: "Warrior", imgSrc: "assets/image/p${i % 3 + 1}.png"))),
    Collectable(name: "Potral Gagaga", ntfs: List.generate(3, (i) => Ntf(tokenId: "#12345", onwerName: "Citizen Gorillarz", contractAddr: "test", charName: "Monkey Kingdom", ntfClass: "Warrior", imgSrc: "assets/image/p${i % 3 + 1}.png"))),
    Collectable(name: "Potral STEPN", ntfs: List.generate(17, (i) => Ntf(tokenId: "#12345", onwerName: "Citizen Gorillarz", contractAddr: "test", charName: "Monkey Kingdom", ntfClass: "Warrior", imgSrc: "assets/image/p${i % 3 + 1}.png"))),
    Collectable(name: "Gorillarz Potral", ntfs: List.generate(5, (i) => Ntf(tokenId: "#12345", onwerName: "Citizen Gorillarz", contractAddr: "test", charName: "Monkey Kingdom", ntfClass: "Warrior", imgSrc: "assets/image/p${i % 3 + 1}.png"))),
  ];

  static final singleNtfs = [
    Ntf(tokenId: "#12345", onwerName: "Citizen Gorillarz", contractAddr: "test", charName: "Monkey Kingdom", ntfClass: "Warrior", imgSrc: "assets/image/p1.png"),
    Ntf(tokenId: "#12345", onwerName: "Citizen Gorillarz", contractAddr: "test", charName: "Monkey Kingdom", ntfClass: "Warrior", imgSrc: "assets/image/p2.png"),
    Ntf(tokenId: "#12345", onwerName: "Citizen Gorillarz", contractAddr: "test", charName: "Monkey Kingdom", ntfClass: "Warrior", imgSrc: "assets/image/p3.png"),
    Ntf(tokenId: "#12345", onwerName: "Citizen Gorillarz", contractAddr: "test", charName: "Monkey Kingdom", ntfClass: "Warrior", imgSrc: "assets/image/p1.png"),
    Ntf(tokenId: "#12345", onwerName: "Citizen Gorillarz", contractAddr: "test", charName: "Monkey Kingdom", ntfClass: "Warrior", imgSrc: "assets/image/p2.png"),
  ];
}
