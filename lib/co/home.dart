import 'package:flutter/material.dart';

void main() {
  runApp(const Home());
}

// ========================= HOME ================================
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu Makanan & Minuman',
      debugShowCheckedModeBanner: false,
      home: const MenuPage(),
    );
  }
}

// ========================= MENU PAGE ================================
class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  MenuPageState createState() => MenuPageState();
}

class MenuPageState extends State<MenuPage> {
  List<Map<String, dynamic>> cart = [];
  String selectedCategory = '';

  final List<Map<String, dynamic>> foods = [
    {
      "name": "Nasi Goreng",
      "desc": "Nasi goreng spesial dengan telur",
      "price": "Rp 12.000",
      "image":
          "https://akcdn.detik.net.id/visual/2020/11/20/ilustrasi-nasi-goreng_169.jpeg?w=1200",
    },
    {
      "name": "Mie Goreng",
      "desc": "Mie goreng pedas dengan sayur",
      "price": "Rp 10.000",
      "image":
          "https://media.istockphoto.com/id/1421758309/id/foto/mie-goreng-dengan-telur-sisi-atas-yang-cerah.jpg?s=612x612&w=0&k=20&c=x9FKh-yCRaeUmKP3nuwUoq8kkv09md5E9PXLbrHlBEs=",
    },
    {
      "name": "Sate Ayam",
      "desc": "Sate ayam bumbu kacang dan kecap",
      "price": "Rp 15.000",
      "image":
          "https://i.ytimg.com/vi/R0mDzP0A_DQ/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLCKevZCAetrLVnQIhN9FBW8vvPfcg",
    },
    {
      "name": "Sate Kambing",
      "desc": "Sate kambing bumbu kacang",
      "price": "Rp 20.000",
      "image":
          "https://asset.kompas.com/crops/XQjdRClv4MAcy8Yh9nl-cy3XBdU=/34x5:1000x648/1200x800/data/photo/2022/07/10/62ca32d62f8ba.jpg",
    },
    {
      "name": "Gulai",
      "desc": "Gulai kambing danyam kas jawa",
      "price": "Rp 15.000",
      "image":
          "https://i.ytimg.com/vi/qSUb_JIQGW0/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLBBz7Tf9ouEKfZ4lK_fanSRBdPMjQ",
    },
    {
      "name": "Rawon",
      "desc": "Rawon daging sapi kas jawa",
      "price": "Rp 15.000",
      "image":
          "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBwgHBgkIBwgKCgkLDRYPDQwMDRsUFRAWIB0iIiAdHx8kKDQsJCYxJx8fLT0tMTU3Ojo6Iys/RD84QzQ5OjcBCgoKDQwNGg8PGjclHyU3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3N//AABEIAJQBCgMBIgACEQEDEQH/xAAcAAACAgMBAQAAAAAAAAAAAAAFBgMEAAIHAQj/xABDEAACAQIEAwYCBwcDAwMFAAABAgMEEQAFEiExQVEGEyJhcYEUMiNCUpGhscEHFTNictHwJOHxQ4KSFlOyNFRVY6L/xAAaAQADAQEBAQAAAAAAAAAAAAABAgMEAAUG/8QAKREAAgICAgICAQMFAQAAAAAAAAECEQMhEjEEQRNRIhRCYQUycbHRI//aAAwDAQACEQMRAD8A7YcRyMFHna45XxksiouosAOtrgevliKBO8vKL2PXgfP1wljHqRF/HLex4C1jx4emLFt+g6DGHrytx54xzYAkG3XnhaBZt5Y8b5ha2PD4rEC4/HHu56e+CE1PzXBK9bjjjNQ1WNxf8ceSSrGN2AxRlrh/0wCep44VugpNl47b8h9W+IXliPzv6KMCqutEcLSzOdK8R18hgRWZsUaFxdfGfD5YyZ/Khjdezm0uxnNZEFI3e/G42xH8eoBtGLeZwPSZHRWJAuL2ON20iLvCQEvbVh1ng/YySZa+OULYRix64glq4XHjjY/95xSkqYQbd4t/XED1ERFxIv34EssH7KLHIsyrTzbd9PE3UWP5jAqsyqva70OeC/2JlK/liz3iNwYH0OMvzF/LC/g/RRSlEWMwp+19CC6wGoj495TyFvwv+mFx+12YxyGOcOHXirswI9jjpaTyxHUjsN8R18WXZxGIc5oYqkcpLWdfMEb474oPorHyH+5HOP8A1zPDIO9jZr+YOCWX/tBpze7yQ343Jt+uMz/9mjFWq+zs71cY3NNIQsoHkeDe+/rhd7NdhcxzzMWpYSYY4SPiJpUI7odLdfLHfCM8sZbOhUPamOqRRDPFISdrABvwwfohU1KaDSTIgHhKgkH1J3ONMo7P5D2TQJR0omqreOols0hPmeXoLDFifPJbm0iqvly98MsKXbISyKX9qJ2y2qeHW8dpAbqgIt5X5XxWq8unjF2RtRA1SINvuwNm7W00D6ZcxhRjyaUA4t0napWsY545UP8AMDhuEGJU16KlTHGouhdFU+N18sDnppF8XdKq7kve/HgSOZty4Yc4ZaHOYtLIA4ItY+/v6YpZhR1FK95W1qT4JFG9/wCbE5YWtofHmrQpz0DQO5hD6ZQEjGvc/KBt/m+IvhHjd4ngYMxW1t7AG5Hr54YKynASNmkE0wN9UfFPu/PFHL4mmyxp1ctPK7Hvb3Cgn25YlRrWVuHIXc2y6WlpYmOllEg74g87EC/vz64oVUrTXkqiHYKBqtyXgPww0xd1LRtUyh/hnlbQSPqXsPvtf3xTGW5U0oNVE4py2kqkjj7wDtxHPnhNpHoeN5EcVxlG/wDv0DcvzPMcr+iilp5ad11iGVS6qTx5i2JcxrafMqSOaPKqaJ9xIdIJuDvYnHtblcENRKsFY0kEZIu0XisONjwNsbpT0tKWSTUVAsB0v1689/wwUk3ZHzPjkk8a2+wDPRNGFZI3VX4BRf8ADFY5XLf+D97YYzAqSNGI5S3FQDsB5dMR/D9RU/cuLJo81xrs63AgqCXa5IbcgWtztfp+eLwPL5saKAiBB4LCwQHG1idjsOg5+uNqMJ6Qb9T+Ax4WF7nl9bljPENlsP5cYxAsALnpywQGMt7Hcb7kc8VqqrWLwx7t16Y2qpioIVsBMxqRFSzNqs2g734YWcqHUTeeYsbyMb88U5ayKP5nVb9eeFfLcxqqigCQ1MzPFs6uSz789XEjGkrSanZ3LOvEs3D3x5mTyt0uycs6iqQSzSt+LmshJhSwHnvgbmMjioMZYWUkrv1wLLVKCcd8dLWFwd0blv0ONmrGMnetESwS2m3A4yvG5S5MzSm3sP0VVNIk0VSuuJVDaQLkgch588XIs6E7ilSJkhcaW18RcgDAGizWza1Ud5He6kAcfPngnQVEkpesr2jNLTeMqBbU1tgALX98IoPl0UxylejmWZZlmlJWVdJJmNQxgneK+r7LEfpisuf5rGdq2YnkL4P1WUpmNZLPKpDzytK+5uSxufzx4eyL0UUr11hECBEUOosCDvt5A8ceo8eNLaPV5NK2wVD2szeM/wAYtz8YBwayftfmdZVx0/cxPI/Dx6AcU07Mxz0zyxSEMilvECARa+3nfA9srqaNI6ulkcPyKbMp6b88JwxtfiqZSLbV9j5D2tpY6l6Ws+gnjbS4YhgD6jBmGvgnAZJVN+FjjjX7vrGdmlXuxa5Z+B+4cce001Zl8yzRSsrXt4WupGHUJQ2pCS4y10dvglaJwyMQ3UHDFltaJUdGCrM4+e3zHzxyLI+2SvIkFcO7kOwbkcdCyudJNLK2+Hhlt09MlkxtCl247T1GRVT0i07vV21FmU6bHmOuFqmTOc2mhkzKpUUkgJEZfQeHG3tjrvaHI4e0WXBGAStg8VPMCLg9LkHj1setjwKLXLXMlqlaeOFpO6bvH0lNjcEAW0g3HM8PMlc1x6NvhLHNfygTQS0NJKsRSnkpIIDNUl4gWKggkH+ZmsBijnFGaqRq+dko1e8kXcAJpS+ym3kBhhhjWheKOmgEbSVIsI4ttWmwIN9xw9OnG43OWp8qmjy+Ihw1tcznSCxINzY8LW2v74ipOtHp8YuXRNkGbZl2ZziCkzSoSeF3KsddzFa25PrfbHaEMVfRKUIaORbqwOx6Y4hX0E3wUix1InSM96EkUEksSWKnja44HiD9/TP2a1U0vZhJKpFiiRmEVthoGNGDJybizyvP8ZQisiJ46dQZ4Qml+LsODdB+PDA1aOpjovhBGkUC3DzKd2Xnt58L4jos6hnqZjqJiEzhrHgb8/LBcNED3kuuNbbLyPriVpujOnKGgDLlNT+61gIRIEl2Kndo9RPD8MRfuwyRS1E7qO9nR1HMIpFrjlg/3UXemWYyKoHgA2U+ZxGyQJP3lQG+XSpUWF+p/t73vwHEp+pmLT5bUvAVDo7hSqAHcXNyffGsuWtL3rvINZjVIxHxW1+P3/ng98PFGxdoCxc+DSb29sbhRBULrhQvLsW+yvP2wKG/UzFiKlnpmLRTai3zt+VxifTS82a/O2C88DJVBKZ9Ovxu4328/wC2BMsdGJHBoYnOo3fQvi88Em58ts6cLBbkafzx54UGoggfaPPHlyFtq1P9q22PbFd3bU5HPYY9EwHitsSo0p1PE49ZtKeEWJ648u2sAm7fZA2GI6ltzc7Dn0x3o4G5hMkMDSO1gBcnHJO1/aior5JMuy67ObhrfVHrg1+0ztG1ODR0r2Yjx2PAf3OOVVzyJRxxA6fiYxJI1/mubBfbGRt5H/BuxY1GNyOj5cgyruIqiWB6+Wm7xo4zuygAmxPE+mJYa2OWEuhEl1+bgMApqI1NbQZvLUpH8LSnUFJNzoK2B98VqTNAkLyka6ZzcxAE6CeNrcueMc8am7XY3lf09/Fygt/7X2MVSY2jM8bqzqLSJF4tQ9Ofti3luSzV1KHiqGjRowGAFyL/AJYUM1zJzTd5llOzFG3YrbR6g8Rg/kPbuaf6Jooe/F7hWtawG4FuGJ5cWZQvH2eb+mnBXNUR1dDPlM7QyBzdgSb2Deh5/wDOGHsjHU5qXkSKneCO8ZSUkj1/5wz5WsOYRQzzKYqzQWQr4WVCeFyDxsDi/NDSSPGZjqK30uXN7+e++GxKUopz7Hx4uMrQq1fZqqmzCQU8bU1KLAGwJLH7J32/LGmZ5FnFJEslPPAsMC3kiUFndBx3PPjww3pJCZ2jgllFjuL7bjhiaNyrBbGIDcG97+uNDmno0rJKJyWSuSqqTDLeEuCqTKoG/EEjYW/HGsXZzNUqKdczb4bUbQm4PeDflfhvuTwuMO2UZVk4gmpO/adzxn1mPSPq6QD/AM4KZolEyRPU17pDEtmZGClgORJ5c/OwwEq6LSztvSOZ1FA1JCZKmKVFDEIxW1x/nv5YCSx0k0jQtpALeAMNJ9sdAqJfiIJTXqxo1dkE0ijSy3IDEHiDtgHktSlH2rL5GjVwSILIzeKOAG97dPl2txGEx5JcnyQkZqTehLrMuaNyYSJEXjb6uGLsb2hnoZ0p6ti0IYDvN7R36nB/tDVydoqqMd0tMURgjxN/E632uLYFZrlNPlKwymnTUz3EcsmrbnsON7edr4pOpRtFo7VSOt0Dhwrix5i2Fft7kFRU1MVfTCokj7srLDAmptXIjy439sedgs8SrDUjKiEXaJFa40/Zvh6lY9wzIRsLjGjH/wCsKkZlkl42blE4ezZ2jmnlp6shthI1PJqTmSPDe9r4hh7LZvmKRGnoK15kYNaSPQgB56ntc47LHXvYaiu344lSomk+Xf0wscMfuzZL+pZK1FISMj/Z+0TrNndTdSReBGvqt1bp6YN9oc0Sgyx4oFWGmhQ8BbYcsHWjeS+plueuFfth2TzHPMtejoq2ng7z5jIG4dNsWjFRVRMWXPPNK5s452X7SyrUyJI3idywv9YE3Ix1zIc1jq440aUGyloiwv8Af5jCFL+xfP6c99R5lQSyA3CjUu/qcFKPL82yR0izGlaF76lcboGHRuGI5sdbRWE1NcWdFcyqqy1BCMu+gb/f5+WPZCw0Ty6FcfKONjy98DsvqYZKUTyBlZjsl7qtv1xdQxo6eAtK9wBe4/t74ndk2qdG7xyIO81KJiLeA7YgmRu7J1AkfNKh2/zj92LC2ifRsXk3LciP7Y0k0928YA1fWc8CTy8uX4Y4BRqmQPDLGNQOyMn1m4Y8amlLHVJEpvuCBcfji8LKomkBjlOyCPmPTEPd1n/5KJfIoTb8cCg2MoZWjFhoQ8jsRjx/ALMT3f3nGqsmpe5XWebHgPT/AGx6ZBqtGNb87HZffljfZlJRr73gui2x4nAfPa5aHL5JXNtmN+gAuT92CilTUjxszW3HJcIf7SqnTlDQgnfTCR/U1/yRvvwmR/jQ+NXI5vPSS59W9/UTd330mpyRcgHgPbFCOCsos0loZTHGsUmgJOmoqNjtx4ggj1vwwy5NAZJEUC9iP+cEs1yx6btfTToRPLW3m0ugukdtKgg7WAWwPQDniFVGjfCXGdgXOK3KqON4KuS6EeKIRsbLwG9rHmdsVKTJIMrhqdEbyd8AUMjG8a8RYbfiL4Ids/3blVVSP8TBVWtKYAR3kJBuD0PocHTR1uZfAVOaMIVmbXH3i2NwL3PH7sZZ3jikj08fkQlUm0/r7QAp4phl8pShmcmPuo4Y0LvIdxe1r8wPz64H9jMrr6TPaOhloZQ8zsahp6fRZALt4vw874bnro8uzGumiqe8paeyd5qu3eEDUSfIcvXAOLP8yqJIYKbMJKOfvA00s7XOkncKCDfpvg421Fr7M3lT+Vpx6Oh11Qe+SANEtXISw0XZ+7AIuAovYbDhxt5XE532neKJ6SioWJA+ade6Zf5rNY++2KucV8NEJKWtngWGwJshd5bcLnYg2/M4Spc21zSTUQaGx+ijkcstiOBucBxdIzwxL2MuR9qa2rzCZZkXRFZ3qACgjXhYje52PD/cuUOfKk9PBCRNLOSF0G9wN7noPPCkMpoqbP6TM6SFBSQ0wZ9L3E0moknTfew9t8DO0Ha6LLs9epyxVcNZWABXxHiBYemO+K3cSE3bpI6HNTU8lVUPWaFEsa9wGQoEaxvq4X5fjhZzKsXJa2GjzNqcGSPVBVIhMXSzKDfbrc+2F3L+2WbPXiWqpWkhb5lG+xF7eQvzwS7U1GW1fZmmqa4s1cXtSEt4gTuRbmABhlF8tlIfi9knaOpTNl7unmWph0hXELat+bADiR6csIddU5hlINOjzLQyMNTRC2sAXU+f+DbFqizGGSsq2yqJI5dQK6m8T9QpGw4E2wY7NdnE7QRV1Y+aGijjdkVJV1lbgX24Dfpi0dPY+WUYr8RWbNpKZUaloe5Zjb4ksxIvudIJsvpgfJW1E1RHVTSSySh7q73Jttf19PLDi3ZOohhANaq1QJC+G6FR1uNsL9TktZH9A7ApG5IF9gTzHrxxW1RFNsZ+z9UaWekzWmPgEgdip2/y2O4xzCSkmKfKqsBbpa4/AjHznQxVcMXch7RkWIH547tlxanyKUMWL93Em/XukGJJvEnL0L5VNJg5avuqcz1Gy30pGDu58+gwOqc8rnNoZzGg4CMWAxJmMQEJAWx4emB0FOzIGYDfjjwJebkkrbpGvwoY5wbkthSg7S1MEg+Kbv4+e24w50lRDUxJNCwZGGxxzaopbD6MBWHQ4PdkK4rO9G7XDeJfLrjd4HmycuMndneZ4sePOA5ADoMaywxyRskiKytxDC4OMVjiQb49yr7PJE6ppJMmzLRTBTBUElA/1TzF+Pn/AHxcjYa+7p9KzNsQbaQPX9Bv6ccZ25VP3bCWCse+FtXmLG3ngHTVkDxCGNmaP6/2gB0v+eMsoKMqNEW5JMPOXilFiiOf4jkeGw4Y8Ud1KHmUog+QHg5PO/5Y8jiGhZWBaHjofifX+2NjdF71tWm4IifkT/nDC0ceSyLHKZpQVdiFjUC4v5+eNTDUkk6UXyCXt733xvM7K8b6P9Uy2jiPX/OfLFZoJ9R8Knfj3g3wGchiqFLgLID3fDu0G5/29MbORCFLKEUDw6d7eRxsxsLr9H/M3PGrapHDRG1x4iR+WNpmMUuagBkWNB8u/if+wxz79qERi0Frd3LIjg9NOsH8XGHh50apaOmPfyR2WUn5U9+R8sDe02VRZ/lctKsqtOpJhe+wcDdT64WS5aKY3xdnMMuDP3awyBNYtqLAAdbnFPt0uYR1qPk1bememjgdaV20jSLWB9sS00UkUjRMjLNCdLavqdRbFuOikknjj3Jl3Avv93LEX2ars5wlJXUtUWkpXlf5iWjLgG/zW4EjfY7Y6n2UleuTLsqqK7Uii4eRgSo63+1bbn+WMzX4bs8rLUTosyC7tpLb2uEVeB8zf2wmZhn71VQsscUK91cK2izabnnsOfIC+FyRU1TF+OUtJ6H/ALWw5PkdRTZdljkSiN5nid7qAT8xaxIJJNvTlz5rUSNWZ/CtCsUMhuPFdUj2534D/OeNWqI5+8laomEwBIJu1142N8OeQdkKbttldHmq5g1PWRQ9xMsYDK5Hyk+djbbpgRik22U58IpClNJBqSljkklhhJCu8gdnYnjsBYeRvawscazyKAhVflLaDbituGITJSwZhNRuAkkEjJ3oB0uRt+mPasaQygiWdlvpvsqn8B9+OUXZXkuNoN5P26n/AHJLQPSR6oPClQdwoHA6eOr0OBMdXNQKKiSISCcsdZW7LtsFub2335n7sLuVrM8MsMcUjgkl2tZRtxJOw58TzwQarMscTMsjBFK+I2G+xtijx09EIzVbLyyuQGJkZ5NiEawYnn5Y9mjledZZtc8cF1VXa6jUCL+xIPtinQThZhBJqvG94225csG4e8qZZY5nezBu+CLx5gbdSAPU3x1UNdizl1PUWdwSJIWA0tfxNfgLDj92DtXWVMlNHR5er0UayNL8OJGIZ7C5uTueXLrbjiCtqZqNoo2cjWVaRO7AIFiNR87jEkTa6Z5JHjlRACNTDVqN7AXNydjwBtztgv7Yq+kVpWm71StfMzji7ORoPQYO5Y6/CSmqkYTbBVaxvxuR5W0+9+uKEVTOqCSjo6eGUJbvtF2PueGJaOnneRWlJaoY3YgcTywstrQydPYdymjeszGmggTVJK4CjkOt/LjjrebyrFGtPGPDGAWPnawvgF2VyX9wUXxlYg/eEq+BD/0l6euA+YZtPLUzGOQ938rC1/fGby0/gcPbMufLFO/RczGoJcDk5uWI2PpjaK7RrbhbAaapily9EFQpmhfSov8AMDva/lizlbVUyWEEhVdtWwW/S5x4WbxXGNI9Pw5Y1i0y/KgKkEjhwxr2XQjOKfQNt7+QtjWujqoIwZKd1HU8LW/3wY7F0DMrV0gsG2j8x1xXwMM5ZEivkZYrE3fY2qL43uBiMOF2AJ6Wxz/t5+0SnyjXluUSpUZm2zFN1g9ep8sfUt0eHVs9/aBnEElamXLJ/Cs0hG9mPL1xUy1okVZa0adLAxb2APX18uGFWmB+JgaUhqh3BZ23LHib4YKOaMysrqUa9hDa4PoOB9uGMjly2a3HikhjjrNQV5ZGvxVgbsP0J/DF6V+5gWWqkEs1/BpOnSeHHr1b8MAKOSGkjZnBWY3KQk7ei/3xcjC1q6YVk+JcAvJpsEvblw4b+YN+eAIW6mCZ+7RZ+/lJsxC30DztxUeVifK9xOKKjAAkzCtLj5iJbAn0tiVSlHalgjVHC/MDcX6t540bTqOpQ5vuxmO/ng69gDkj2cLJ9JKRsg+Ue398Rzu0bh6knh4Iotyx6G25/L1xLGttXw2mzHxSHe5/XEBldJTFTJ8TIPnckARnzP6Df2xrZmR5K0ICNVA06nYR6tn8iOH64gqKly6R/DiGMnTFe4b122A4bYlaMwSCWUCqrivhAIFv6QTsMUc7Sq/djSVEqGW4aKNLixG9gPrHb88JJtIeCtpAvOspWvqGr6JEGaoml4z8s3mN/mwiGqqqOqWWSMieCSzKwIIPGxHT/bHQo6lK6jirIiBcabLx1c9sV6+CjzVNFchWUbLVRDxrbr9rCcVPZaL4Ojj2dO09dV5jXRs80t9CweAljza3K1/yxTqaKljo4pVkMk8+4Gre1hcEcRv14gY6DnXZWupIXlp0FZS7DvISWJ82H1f83wKyjI6Osjq66SaOOGmjMk0g2CgDkMB60VU0wB2coA+Z0b1sAqYoGUiCRtEegNexPTicOHaGsmkoKvOayWKhSok001LAirLIotuzizW524YDZPnNO7rLRd3Ewuul4wzrfYHfjy3BA9eGIM7qa6uiSqeZZp4T4onUNp6EW226emJydsMsLlsD5RTwVGbJ8RCfgg5epgW4Lou+k89/vvhz/aZ2UyunymLMMtpKXLTEAB3ZCd6h6r18+J54RmlqaKtStllFU8i65GDizXF7X4XG59sMtdRvLQ5fmWY5hJUakW37wBiCWOyqvFjbe+Gd3aBwWkAKDJahVnpJI5Y2jbVLOXIjuQLKepF7e2C0GTZGU7lqmobUoEkjSCNCfS1iLjrywPzSsknjEMM7rCWYqqWW3iuA3NjYe3vYVYiZGEaPICQSYw2oDqQMCXKW7LJQWmjSqyeoou/1WkQXLMhuApNlxcyyuiWgtU1MiSLILBE1MR1uduG1rb323AOLOXZjPVhKd6lfhmURHSu7rbjw3UbYZsorMv7P5aslTk9HPUTEgSFtyp8mGwty/wB8CU6WxHCnaFFYXzG0TVLKoF2DuQgtwGngPbEcVCIjo2cJspvcAeXTDBNl9SIe7NBLBFWOXijNM1iD9na+3IDlhgyrsLUTKj5lI1BTjc67d7J6LuF9zfyx0XKTFk1dti7Q5dJmccEFDD3k5JVwqAkDlvy9cdB7N9mqXs7GlRW6J8wA8CD5ID5dT54IUi0OU05gyqBYlt43O7N6njgZmWapCCzv4rb4pGKiQcr/AMEmb17SnuRJ9LKfmJ+UczhIzmaR3eLeKnjYi31pCNsbVVTW1szz0Y1qfAwPTFavnmMoRowkirdhYXt1B54yTbnkMeaXLSIksotIwJG5HL0xcppdTkxyBLjqQcBjI4Jdy1r8Rf8AK2GHIMnnroGnvpRTp8exb9cLkSUWThjlJ6D+TvIh1PK7W4yNtt0sMGMw7Xx5FkM2Y1dLNPHAwBWADYHhx5flgLG6xsYwGYA8jtiPOjFLkGZJILo1LID92342xhwZZQzJrpm/j+NCD2o/arnufRy09Ewy2hYW0wn6Rh5vy9B9+AXZfL2mqVd1J37w3/znjzs1kZzWt0MNNNENUz/ko8yf1w/1VLSdnMneoKqKhhZI+rH5R+uPbzZElS9lsOP9zKFI8b513bAsKeM3A3Jc4YoOALjvmP8ADUblPK3L154V+y0ciIKuRZDNUuRG4G0luPlxucNa3jqgkXdJUTEa2JupHS3G/p79MTSpBm7Zey8zAlSEkkYgOX37och5+gwfg72npxT0WhzYuQT8lybljzubnqcBolRCkCG1W3iLE+FupINr+g39t8ECIobLssjN/FDWA82PIeR47DntxNltYZlPdwuJS/ifWN/M34W5WONxTwAWPf38nbEbaYYyiCR5ectjsftG3LyxuqQ6R/qGfb5hILHzwNADYMkx8JEUSmxT61uVumMOpiFpPCimzFuB9PPGrhZvpak93o4Rg8vM8wenD3xG7TVZb4eVadEtqZgSXHOwuLC17Hrytx13sznkpZZimXnVUHeRm3Uf1H9BjQQdwrySSd7WyLa3EAHiB9leZPOw6YiE0lXJoyxNCRnxVLXA/wC37frw99sXZwCEjjS7NuZTtp6nz9MJ2E51TZgezWfTUNYR8HK178Ql+DD8jhjqoQp1x+JSFswGxuP9sU/2iZdFU5Ws8CEzU7btYWZed2uMKnZntQKJFoq5w1Md4ZSflv8AVPO3Q8sQTeNmulkjyXY3xTywPrgkZG56Ta+PKpaPMIZ4a2jX6ddMstOe6Zh5244hJjmj1U78BuDa49xscQio0+B73HHF09EXGhbq/wBnFDJIJcpzlqd03VKqLYe4xPH2PzckipSnqFX5JKWcXJ/pPC+D4ljbg4+/HoIG6nfqDgOKZSOSaEut7LZ3To4XK5wNz9HGravP1wuVuW9qZnY1eX5lUSA6hJ3Elz67fdjrQqqhPlnkHlqx7+8q4bCplA/qxyikqOlklLZyuh7P51USf6jKMwVWFmtTG+3IcOOCVP2M7TzVBkp8nenGhkQ1AQ2Dcb7nfHQGzKt/+4k/8sRPVzt80zn/ALjjqQPkmLeXfs/zunYvPmNDSlhpLsRK1vLbY+Ywcy3snk+XPHJW19RXtGbhNIC8b+44Y2eb7Tsf6jiF62KP61/fHOMX6Bzm/Y0TZ4xuKeNU6NxIwPqK0sdUstycL0ubAX0DfrihPmDve7WGCuhUg1WZqFVlVtxhKz7PWD3iYlQfHbj7Yq5pngYtDTtqbgWBvgJUkyp588JJ+iqxpobezWbR5jS1AiazwP4oyOKkXv8An92Ns3tOYn0khG1AqbHCLRVE+W1IqKRikg49GHQjmMMsHaGmqaeSRhomjS7R9T/L5Yzyw07iYcmGUZWi+1GXkVix02uTfli/lkzUkgaFPAF06SbceeAWQdqaeqp1o83lSmnUnu52FlkHIE8iOG+3DB+OehjVjJWUipbZjOuIZYzWmi6SQQpZm1arsrE38LYpdsM0dMsOXrKrT1lhbhZBxJxSru0VFTRscvX94TD5TH/CB5an4H0F/bA2ho6qV5M2z+b6V/EdfIch5AdMLi8f8uci0IuTDXZiGny3Lw02mOFBrZmHzH7R/IYWe0Wbz59maJAWMWrRCnlzYjritnmfPWExodFMhuF5t5n+3+C92TyzXesnkMczNaJbXsPPyxuUN8mWnNJcUNNHQzUOWQfCt330f8EC+lfL0wZikPw/dwBalWS7K63I6kjjcW4HEYhRIhrbTVMLhgbgdD5i3L8Bi2iosQiAtUXB7zjcn61xx9Db0wSJtBcoIoCJiwGsOenW/MdOOCNKzRq0dNqaUj5JRw9fL/N8UIEk06DCBUnxd+Ds38xPH2PtiwhkhZom3mtrMy+MHlc/Z8gbeV+QAEKZxDEaamYpMN3MvEE+XTpbbGhpacm7UIkbm7C5Y9Sb74ip5CqiDdyRq7z63q3n5j7hib4WE/8Att5sCSfXzwABHLnp5lCVAkBADwpJG6GxHRty173xb+FNRU3rHPg3iiXZQOp6ny4YWqOYTNbwrVRNr3VmYv8AaJvawHUHa2974ZKKohrEjlmcPUXuiFbaeIuo+/fj+WLx/klJEjPrn7uRe4hQAqR9f34AeWNZ2llAjJEMTcZXO7fyjp640kV5KgLXgqgN440+VyOBJ438uHrjatkdIw1Ut4mIUKPrE8m6+nl7YZinlTEJ6HuO7KUxGliVudPp+uOK9sMuGU5i7U0Tfu6Zvom5HyHl588dkq4pHpycylK0ai7Rqx8X9Z4keXPnfhgZ2gyZM0yZ4p4kWna7hFABA8j9X/NwcSmrLY5cGcbos6rKDQ8MzaV+XfgOnphgoO2tJVN3WZDuJRwlC+Fv7YUM5oJ8nmJK3p2Pgcjl54oMyTAcP1OAkXlUzrIljlQNC4cEXDKbjEbO6jYtjlEFVXZe16KqkjUG+jVdfuO2CtN21rI9q2mEn80Z0n/PfFESaofDWTLsG2xqcwmG18KqdsaCS3eGSO/20O3vwxL/AOpsrYbVkQ9ThuItjC2ZTdRiGTMKg87YX37R5Zc/6qL/AMsVZu1OXp8kpf8ApBOO4s60MclTKfmkOIZJ9tTEjCjP2uv/AAIGJ+0xtgVU55mFSSO+7tTse7FiffB4s60Oldm1PSD6WUBrbLxJ9sLtdnVRXErFeOL13bAKNS7XNyT13vi/BHbiLYSSoaOyxCLAYmY9MaxLiwsDNwXEWzSlopPGrHe+JKakTXfcYIJRkqGZbeR54v0mXu3BdI6ubD++A5HcUwDVZV3x8KEv5DE2V9kkeQPVDvFG+hBYD+o4aHXLsvTVWzpv9Ubb+g3OAOZ9pbKYsuTulH/Uc7+w5YKnN6Qk4Q7Ybkly7JIVaexkA+jjQcB5Dl64V85z2ozJh3l0hHyID+fngPPUPKxkkYvIT8zG5bF6hyx53WaoDCPaw5++KLHW5CSyeonuVUUlbPE7grEWumr6/pjoVDAtL/8AUujlgBHoOwH5rx98VMqy6KnRJ3YSGwAit/8AH/P7YYKSIQyCaAa5GO8L77/ynp5Hj15YWTsVFuljNImmNhVazz+dfUdMEaIoqFIFDat/Ed18yenr7Yp0sXdylILCY7vBIOA6qeIHlwxfKkP3dKe7r2F2JYlSLcWF+nDTvt0BwAMmhDITBCheRxqe+2n3/TGkUc6TvFABrkOp1YfKftX/AAA8tsSxI0IWKEHvm3uouG82HT8emLJGh9MagzMbBk21ddV7+H19t8cAq/DOB3NMdMjG7KdwOrE8sTilp7bxajzYyDfz44mqljiUI7apX8KmMlCD68h+Hrjw5XUA2OYy3H2YtvbxY6gWC86o2VhVQfOh8Q+0PPG2V10cv0lCqrXXN42exfayqAF3QcduGDMqar7C544WszoZaSoWtoGMciG5AGNE4XtCRfob8vrIa0nvQwqwLPGQwA4XKXAJF/rW3xJpaCqXv3+ImcHQdrxrwPh6cN+O4wjZbmkUsoEjLS1C2s0do1IFySSBc3PEc8M1DmccbdxUkRvKEDVEuxnJ5W5cdh57YnyfTOcaCNarQaJJj8S5No4uh/lHP34YrVv0FL3lSySRs2pYV+VjyA5ufz6YlqD8JP8AROZJHt3hNy0a9fIeX54q1aCndJKSUyzyLsp8VwfrDp688CXZ0Ra7VZIKmhkq5CpiI1MrDwj188cfzXJ6miX4hYmRGJJVgQV8iOXpjvdYi6VmikMstyBHcm7W3svIjryvhRz7Ke+h76Nj3p+aLjY9LdMJGVPZU4+Kg2s6kHzHDGxKPscGs7yggm48XMLgHJQTQpx3HI9MWVM66IzCp+Un3xHJD1F/MHHneMORxsJvfB2LpkBp1ONkomk4W98Sagbk49WUjg2Gt+gVH2YmWTHgCffE65VP9j/+h/fGqV9QvCX8BiQZlVD/AKv4DE28g6WMtQZVUG30a/8Amv8AfBKHJ5iPEIx6vgJ+86v/AN839Bjw5hUsN6iX2a2FcZv2UU4L0NUGWIo+lniUDy/ucbvLlUA0z1Ia3IN+gwmSVDv87s/9TE4174Dkb+WF+J+w/MhvftHRU62o6d3I6gKP74F1naPMKkHS4gU8Qn98AGqCTY7eeJoqWpqHA0FVP1m2w6xJdiPM30ZJUBiSzF35km/440QTVBCxJcX422GClJkqCQfFMSt9hy98H4cuSICyhV5p09Mc5JdCbl2C8vyUQ6aiotJbj0Avyw05dRRFklF9V7Kg3B8vXzx7T0EW0msqQdl4g7cLdcGqSKEMA8WiV/lC7H264RybGSolpqXRKD3HdTv8iKLq46W/Ue/TFoyGKRI5aZ0ruMcaEBj1seBUcyb/AH7YzvJhKUrKcszfJa4A9G4i3XBFmlVBBJ9OxAurXstvrbb7eVjfhhTrMbWFCyqrSk7zgFRH5k3uB6nfhiaZHjQo+mZTuZTtoO27H6o534bY17mSIL8NJ8QjC5O1/U9cSQo0RWSjmEj81vZCR/8AHfbHAJn100Gib/UI2/fAcB1a3C32vvxL8VFSRKA/fFuFkLd4Tw3F7jzxVE60Qsqt8SzXMAGkMT9kchjaOSmp5XkJZakHxR6LFSeg5Xty42xwCUSQx6ZtffyMLII11D0QYh1A7mryqL/9bMxKeRN+IxG1YnfO0cf+tYfwF2J/3/mGLqtmBUH4WBbj5XkOoeR244KYKCDYqVMalT5mxxmMxsJCjn1LDtIqaWbocedlcwqK/Nky2ZgEYq3f21SjSrWALXsNhyx5jMQy9lIdDTRzPBWjK4/4CxI2piS5LE3uTx4c8WKlBRyR/D+EVEjLJzvbgf8ANvLHmMxJdBka5nTR0sXewXR2srMOYv8A74oZ3DHTUkksK2fQPFe/EXxmMwkuwoTM3oYXp0mOoSOoJYHfhhTrKeNl8QvtjMZh4jA6OlhZnBW9sQfu+ndyCpHocZjMVQoNrqdKeQiMtYHmcVbnGYzDIVmXOPbnGYzDIB5c9ceajjMZjmcepdnAuR6YYKDJqWZA8rSsSPtW/LGYzCNjIu5dBAxf/TxKENgFXj64tBVWv7iwKab78cZjMTkx4l4Qp8TCm+lnsR7YIRwIk9MFuFeTSV5Dbj64zGYQYPZdTRTzKGGlrtpZeK8eH3c8T0E5qqdZJo0OoC6i9vbfbHuMxwCzDVTRVNTFq1rThtBfc2F7A9cV4KiSGFJFa5kjEpBFgD0FuAxmMxwoRm+ggFRGSJdIZj9om3H7/wAMWHjEVHT1ys3fSMuu/Br2HDyH+HGYzBAZEBKI6qQapmBGs8VANgB0GII52q66WOYC8aOI3BN0tbhvbfn+mMxmAziHPJ37P9m56ukIlqYyumWfdhq35W2HIY5t8fWSeN6qZmbdmLkknGYzDw6OP//Z",
    },
    {
      "name": "Bakso",
      "desc": "Bakso sapi dan ayam kas malang",
      "price": "Rp 13.000",
      "image": "https://assets.unileversolutions.com/recipes-v2/245281.jpg",
    },
    {
      "name": "Ayam Geprek",
      "desc": "Ayam geprek sambal pedas",
      "price": "Rp 13.000",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuK3X5hxG3yoCn9mkiDHUAu38Ll4BkLK-M7A&s",
    },
    {
      "name": "Bebek Goreng",
      "desc": "Bebek goreng kas madura",
      "price": "Rp 19.000",
      "image":
          "https://i.gojekapi.com/darkroom/gofood-indonesia/v2/images/uploads/e7b1ce76-a6da-4fe0-97c6-4454ed4c46d8_Go-Biz_20210506_125456.jpeg",
    },
    {
      "name": "Soto Ayam",
      "desc": "Soto ayam kas lemongan dengan koya",
      "price": "Rp 17.000",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKISacqQruWQNioCoYuHplsm95w3TiJ2wOrQ&s",
    },
  ];

  final List<Map<String, dynamic>> drinks = [
    {
      "name": "Es Teh Manis",
      "desc": "Teh manis segar dengan es",
      "price": "Rp 6.000",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjz3HofsGm5GlVN4G25EgoKa80eRW8mGYvYw&s",
    },
    {
      "name": "Es Jeruk",
      "desc": "Jus jeruk segar alami dan sehat",
      "price": "Rp 9.000",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJmINERahgTiEkm6VUgrtRm6iH7UTfc-bg6g&s",
    },
    {
      "name": "Jus Jambu",
      "desc": "Jus Jambu manis dan segar",
      "price": "Rp 9.000",
      "image":
          "https://i0.wp.com/resepkoki.id/wp-content/uploads/2021/03/Resep-Jus-Jambu-scaled.jpg?fit=1440%2C1920&ssl=1",
    },
    {
      "name": "Jus Alpukat",
      "desc": "Jus Alpukat manis dan segar",
      "price": "Rp 9.000",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSGiKblop8oek6yJ2p994lUGufmzp-PM4yYA&s",
    },
    {
      "name": "Air Putih AQUA",
      "desc": "Air purih AQUA bikin segar",
      "price": "Rp 5.000",
      "image":
          "https://images.tokopedia.net/img/cache/500-square/VqbcmM/2021/4/2/3261e141-e010-40df-a850-02c126ab897b.jpg",
    },
    {
      "name": "Es Matcha",
      "desc": "Es Matcha dengan susu putih",
      "price": "Rp 10.000",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeDkhQqnv6QCaSiac94A_WmR1XOpFSX3pXaA&s",
    },
    {
      "name": "Jus Wortel",
      "desc": "Jus Wortel bikin sehat tubuh",
      "price": "Rp 9.000",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUmVD-H_8zev7dNnzA5yvOL48BEZlH2zi0sA&s",
    },
    {
      "name": "Jus Pepaya",
      "desc": "Jus Pepaya pilihan pepaya yang bagus",
      "price": "Rp 9.000",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeQsDliZQGiaqLa4cH5pL9rnbi4nRqo_Edzw&s",
    },
    {
      "name": "Es Coklat",
      "desc": "Es Coklat dengan toping susu coklat",
      "price": "Rp 12.000",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoEfS-x55NxtEyqblViG3kMw94Uf_PxKdtwQ&s",
    },
    {
      "name": "Es Krim Strawberry",
      "desc": "Es Strawberry dengan toping strawberry",
      "price": "Rp 15.000",
      "image":
          "https://assets.promediateknologi.id/crop/0x0:0x0/0x0/webp/photo/p3/93/2024/10/21/es-krim-strawberry-tokomesin-3546676439.jpg",
    },
  ];

  void addToCart(Map<String, dynamic> item) {
    setState(() {
      cart.add(item);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${item["name"]} ditambahkan ke keranjang')),
    );
  }

  void openCart() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => CartPage(cart: cart)),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> displayedItems = selectedCategory == 'Makanan'
        ? foods
        : drinks;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 124, 96, 235),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Menu $selectedCategory",
                      textAlign: TextAlign.center, // Ini supaya teksnya center
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //------------------------- search--------------------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 255, 255, 255),
                  hintText: "Cari makanan favorit...",
                  hintStyle: TextStyle(
                    color: const Color.fromARGB(255, 0, 140, 255),
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: const Color.fromARGB(255, 0, 140, 255),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(child: buildTabButton("Makanan")),
                  const SizedBox(width: 10),
                  Expanded(child: buildTabButton("Minuman")),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: displayedItems
                      .map(
                        (item) =>
                            ItemCard(item: item, onAdd: () => addToCart(item)),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),

      //---------------keranjang---------------------
      floatingActionButton: Stack(
        alignment: Alignment.topRight,
        children: [
          FloatingActionButton(
            onPressed: openCart,
            child: const Icon(Icons.shopping_cart),
          ),
          if (cart.isNotEmpty)
            Positioned(
              right: 0,
              top: 0,
              child: CircleAvatar(
                radius: 10,
                backgroundColor: Colors.red,
                child: Text(
                  '${cart.length}',
                  style: const TextStyle(fontSize: 12, color: Colors.white),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget buildTabButton(String label) {
    final bool isSelected = selectedCategory == label;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.blue : Colors.grey[300],
        foregroundColor: isSelected ? Colors.white : Colors.black,
      ),
      onPressed: () {
        setState(() {
          selectedCategory = label;
        });
      },
      child: Text(label),
    );
  }
}

// ========================= ITEM CARD ================================
class ItemCard extends StatelessWidget {
  final Map<String, dynamic> item;
  final VoidCallback onAdd;

  const ItemCard({super.key, required this.item, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 6)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.network(
              item["image"],
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              item["name"],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              item["desc"],
              maxLines: 2,
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Text(item["price"], style: const TextStyle(color: Colors.blue)),
                const Spacer(),
                GestureDetector(
                  onTap: onAdd,
                  child: const Icon(Icons.add_circle, color: Colors.blue),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ========================= CART PAGE ================================

// Perbaikan kode menyeluruh untuk CartPage, MenuScreen, dan PembayaranScreen
// Termasuk: parameter yang hilang, perbaikan tipe data, dan navigasi

class CartPage extends StatefulWidget {
  final List<Map<String, dynamic>> cart;

  const CartPage({required this.cart, super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  Map<String, int> quantities = {};

  @override
  void initState() {
    super.initState();
    for (var item in widget.cart) {
      quantities[item["name"]] = (quantities[item["name"]] ?? 0) + 1;
    }
  }

  void increment(String name) {
    setState(() {
      quantities[name] = (quantities[name] ?? 1) + 1;
    });
  }

  void decrement(String name) {
    setState(() {
      if ((quantities[name] ?? 1) > 1) {
        quantities[name] = quantities[name]! - 1;
      }
    });
  }

  void removeItem(String name) {
    setState(() {
      widget.cart.removeWhere((item) => item["name"] == name);
      quantities.remove(name);
    });
  }

  int getSubtotal() {
    int subtotal = 0;
    for (var entry in quantities.entries) {
      final menuItem = widget.cart.firstWhere((i) => i["name"] == entry.key);
      final price = int.parse(menuItem["price"].replaceAll(RegExp(r'\D'), ''));
      subtotal += price * entry.value;
    }
    return subtotal;
  }

  @override
  Widget build(BuildContext context) {
    final subtotal = getSubtotal();
    final total = subtotal;

    return Scaffold(
      appBar: AppBar(
        title: Text("Keranjang Saya"),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () {
              setState(() {
                widget.cart.clear();
                quantities.clear();
              });
            },
          ),
        ],
      ),
      body: widget.cart.isEmpty
          ? Center(
              child: Text(
                "Keranjang masih kosong",
                style: TextStyle(fontSize: 18),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView(
                    children: quantities.entries.map((entry) {
                      final item = widget.cart.firstWhere(
                        (i) => i["name"] == entry.key,
                      );
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    item["image"],
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item["name"],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        item["desc"],
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        item["price"],
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                      SizedBox(height: 8),
                                      Row(
                                        children: [
                                          IconButton(
                                            onPressed: () =>
                                                decrement(entry.key),
                                            icon: Icon(
                                              Icons.remove_circle,
                                              color: Colors.blue[200],
                                            ),
                                          ),
                                          Text('${entry.value}'),
                                          IconButton(
                                            onPressed: () =>
                                                increment(entry.key),
                                            icon: Icon(
                                              Icons.add_circle,
                                              color: Colors.blue,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete, color: Colors.red),
                                  onPressed: () => removeItem(entry.key),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Subtotal"),
                          Text("Rp ${_formatNumber(subtotal)}"),
                        ],
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text("Diskon (15%)"),
                      //     Text(
                      //       "- Rp ${_formatNumber(discount)}",
                      //       style: TextStyle(color: Colors.green),
                      //     ),
                      //   ],
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [Text("Ongkos Kirim"), Text("Rp 5.000")],
                      // ),
                      // Divider(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Rp ${_formatNumber(total)}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: () {
                          final List<Item> orderedItems = quantities.entries
                              .map((entry) {
                                final item = widget.cart.firstWhere(
                                  (i) => i["name"] == entry.key,
                                );
                                final price = int.parse(
                                  item["price"].replaceAll(RegExp(r'\D'), ''),
                                );
                                return Item(
                                  name: item["name"],
                                  price: price,
                                  quantity: entry.value,
                                );
                              })
                              .toList();

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  PembayaranScreen(pesanan: orderedItems),
                            ),
                          );
                        },
                        icon: Icon(Icons.payment),
                        label: Text("Lanjut ke Pembayaran"),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  String _formatNumber(int number) {
    return number.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]}.',
    );
  }
}

class Item {
  final String name;
  final int price;
  int quantity;

  Item({required this.name, required this.price, this.quantity = 0});

  int get subtotal => price * quantity;
}

// ------------PEMBAYARAN--------------------
class PembayaranScreen extends StatefulWidget {
  final List<Item> pesanan;
  const PembayaranScreen({super.key, required this.pesanan});

  @override
  // ignore: library_private_types_in_public_api
  _PembayaranScreenState createState() => _PembayaranScreenState();
}

class _PembayaranScreenState extends State<PembayaranScreen> {
  bool isCashSelected = false;

  int get total => widget.pesanan.fold(0, (sum, item) => sum + item.subtotal);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(title: Text('Pembayaran')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 194, 1, 1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Warung Madura',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Jl. Raya Mawar No. 13',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text('Kasir: Ayu', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(blurRadius: 4, color: Colors.black12)],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Detail Pesanan',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Divider(),
                  ...widget.pesanan.map(
                    (item) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              '${item.name}\n${item.quantity}x @ Rp ${item.price}',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          Text('Rp ${item.subtotal}'),
                        ],
                      ),
                    ),
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Rp $total',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(blurRadius: 4, color: Colors.black12)],
              ),
              child: RadioListTile<bool>(
                value: true,
                groupValue: isCashSelected,
                onChanged: (value) => setState(() => isCashSelected = true),
                title: Text("Tunai"),
                subtitle: Text("Bayar dengan uang cash"),
                secondary: Icon(Icons.payments_outlined),
                selected: isCashSelected,
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: isCashSelected
                  ? () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PembayaranSelesaiScreen(total: total),
                        ),
                      );
                    }
                  : null,
              icon: Icon(Icons.payment),
              label: Text('Lanjutkan Pembayaran'),
              style: ElevatedButton.styleFrom(
                backgroundColor: isCashSelected
                    ? Colors.blue
                    : Colors.grey[400],
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PembayaranSelesaiScreen extends StatelessWidget {
  final int total;
  const PembayaranSelesaiScreen({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Ikon centang
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check, color: Colors.white, size: 60),
              ),
              const SizedBox(height: 24),
              const Text(
                'Pembayaran Berhasil',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Rp ${total.toString()}',
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Terima kasih telah melakukan pembayaran.',
                style: TextStyle(fontSize: 16, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ), // Ganti HomePage dengan halaman Home kamu
                  );
                },
                child: Text('Kembali ke Home'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}