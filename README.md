# Árvore Genealógica Game Of Thrones
## Considere as relações entre algumas das personagens da série Game of Thrones, tal como ilustrado na Figura 1, ignorando para efeitos deste exercício se as relações aconteceram no passado ou acontecem atualmente.
## 1.1. Escreva factos/regras Prolog que representem as seguintes relações:
- homem/1
- mulher/1
- família/2 – família(nome, nome_familia). Considere os irmãos Clegane membros da família Baratheon.
- casados/2 - casados(homem, mulher).
- descendenteDir/3 – descendente(homem, mulher, filho).
- irmao/2 – defina este facto à custa de factos já definidos. Considere que duas personagens apenas têm o relacionamento de irmão se forem ambos filhos do mesmo pai e da mesma mãe.
- matou/2 - matou(assassino, vítima).
- inimigo/2
- amigo/2
- relamorosa/2 – quando não há relação de casamento.
- filho/2 e filha/2 -filho(pai, filho)
- gay/1 – define uma personagem homossexual
- viuvo/1 e viuva/1 – define uma personagem casada com uma personagem já morta
- viuvos_amorosos/2 – duas personagens viúvas, de sexos opostos, que mantém um relacionamento amoroso.
- vingança_pendente/2 – existe uma vingança pendente entre duas personagens quando a segunda matou o conjugue da primeira
- assassino/1 – determina se uma personagem é assassino
- morto/1 – determina se uma personagem está morta
- vingou/2 – X vingou Y se X matou uma pessoa que tinha previamente morto Y
- infiel/1 – uma personagem é infiel se está casada com uma pessoa (que não esteja morta) mas mantém uma relação amorosa com outra (que também não esteja morta

## 1.2. Questione, através da consola, esses mesmos factos de forma a responder positivamente ou negativamente às seguintes perguntas:
- Aeris está morto?
- Sir Jaime matou Aeris?
- Tywin é amigo de Tirion?
- O Stannis é irmão do Renly?
- Existe alguma relação de incesto?

## 1.3. Escreva agora factos/regras que permitam determinar a seguinte informação, através da consola:
- Entre que personagens existem relações de incesto?
- Que personagens foram mortas por Tyrion?
- Que personagens da família Targaryen foram mortas por Ser Jaime?
- Que personagens mataram membros da família Targaryen?
- Assumindo que não sabe a verdade, que personagens são resultado do casamento entre Cersei e Robert?
- Determine todos os filhos de todos os relacionamentos de casamento.
