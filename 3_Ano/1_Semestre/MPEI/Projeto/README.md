# Projeto Final da disciplina Métodos Probabílisticos para Engenharia Informática 
-----
## Constituição dos grupos e participação individual global

| NMec | Nome | Email |
|:---:|:---|:---:|
| 104179 | EDUARDO ALVES | eduardoalves@ua.pt |
| 115931 | JOAQUIM MARTINS | joaquimmartins33@ua.pt |

### Estrutura do repositório

- **src** -- contém todo o código do projeto, juntamente com os Datasets.

- **Relatório** -- contém o relatório Final do Projeto, juntamente com as imagens usadas no mesmo.

- **Apresentações** -- contém a apresentação do Tema intermédio e a Apresentação Final do Projeto da disciplina.

### Em que consiste o Projeto?

O Projeto consiste no desenvolvimento de um sistema de Análise, Recomendação e Classificação de jogos.
O objetivo principal do projeto é desenvolver, testar e demonstrar uma aplicação prática que combine técnicas de classificação, filtragem e deteção de itens semelhantes.
De forma a alcançar este objetivo, a aplicação irá integrar 3 módulos principais:
- Naïve Bayes
- Bloom Filter
- Minhash

No nosso sistema vamos fazer o uso destes módulos para:

* Naïve Bayes: o utilizador seleciona tags e atribui peso de importância das mesmas, o sistema retorna se é mais provável o conjunto de tags pertencer à classe de Maiores ou Menores de 18 anos.
* Bloom Filter: O utilizador deve selecionar um jogo e uma tag das múltiplas opções disponíveis, o Bloom filter retorná se à tag pode pertencer ao jogo, ou se a tag definitavemente não pertence ao jogo.
* Minhash: O utilizador seleciona um jogo e o sistema recomenda um jogo VR semelhante.
 
Ao entrar na aplicação, o utilizador é deparado com um Menu, onde o mesmo pode escolher entre as opções anteriormente explicadas, mas pode também escolher entre:

* Testar os diferentes módulos previamente debatidos.
* Ter acesso diretro aos conjuntos de dados usados ao longo deste projeto.
* Sair, de forma a terminar a aplicação.

### Como foi dividido o código no src?

O código foi dividido em vários programas e pastas diferentes:

* Ficheiro main.m: onde se encontra o menu principal e as várias chamadas para os diferentes ficheiros.
* Ficheiro naivebayes.m: responsável pelo código desenvolvido para o nosso Naive Bayes.
* Ficheiro bloomfilter.m responsável pelo código desenvolvido para o nosso Bloom Filter.
* ficheiro minhash.m responsável pelo código desenvolvido para o nosso Minhash.
* ficheiro naivebayes_teste.m responsável pelos testes do módulo naivebayes.m.
* ficheiro bloomfilter_teste.m responsável pelos testes do módulo bloomfilter.m.
* ficheiro minhash_teste.m responsável pelos testes do módulo minhash.m.
* pasta de funções auxiliares: programas responsáveis pelas funções que auxiliam os módulos principais.
* pasta de DataSets: pasta responsável por armazenar os conjuntos de dados usados ao longo do projeto.
