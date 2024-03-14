% 	homem(nome)
homem("stannis").
homem("renly").
homem("robert").
homem("tywin").
homem("kevan").
homem("ser jaime").
homem("tyrion").
homem("joffrey").
homem("tommen").
homem("lancel").
homem("loras tyrell").
homem("gandor clegane").
homem("ser gregor clegane").
homem("aerys ii").
homem("rhaegar").
homem("viserys").
homem("khal drogo").
homem("rhaenys").
homem("aegon").



% 	mulher(nome)
mulher("joanna").
mulher("dorna").
mulher("cersei").
mulher("myrcella").
mulher("rhaella").
mulher("elia").
mulher("daenerys").



% 	familia(nome, nomeFamilia)
familia("stannis", "baratheon").
familia("renly", "baratheon").
familia("robert", "baratheon").
familia("joffrey", "baratheon").
familia("myrcella", "baratheon").
familia("tommen", "baratheon").
familia("sandor clegane", "baratheon").
familia("ser gregor clegane", "baratheon").
familia("joanna", "lannister").
familia("tywin", "lannister").
familia("kevan", "lannister").
familia("dorna", "lannister").
familia("cersei", "lannister").
familia("ser jaime", "lannister").
familia("tyrion", "lannister").
familia("lancel", "lannister").
familia("aerys ii", "targaryen").
familia("rhaella", "targaryen").
familia("elia", "targaryen").
familia("rhaegar", "targaryen").
familia("viserys", "targaryen").
familia("daenerys", "targaryen").
familia("khal drogo", "targaryen").
familia("rhaenys", "targaryen").
familia("aegon", "targaryen").



% casados(homem, mulher)
casados("robert", "cersei").
casados("tywin","joanna").
casados("kevan", "dorna").
casados("aerys ii", "rhaella").
casados("rhaegar", "elia").
casados("khal drogo", "daenerys").


% descendenteDir(homem, mulher, filho)
descendenteDir("tywin","joanna", "ser jaime").
descendenteDir("tywin","joanna", "cersei").
descendenteDir("tywin","joanna", "tyrion").
descendenteDir("kevan", "dorna", "lancel").
descendenteDir("robert", "cersei", "joffrey").
descendenteDir("robert", "cersei", "myrcella").
descendenteDir("robert", "cersei", "tommen").
descendenteDir("robert", "cersei", "sandor clegane").
descendenteDir("robert", "cersei", "ser gregor clegane").
descendenteDir("aerys ii", "rhaella", "rhaegar").
descendenteDir("aerys ii", "rhaella", "viserys").
descendenteDir("aerys ii", "rhaella", "daenerys").
descendenteDir("rhaegar", "elia", "rhaenys").
descendenteDir("rhaegar", "elia", "aegon").



% irmao
irmao(X, Y) :- 
    descendenteDir(PAI, MAE, X), 
    descendenteDir(PAI, MAE, Y).

irmao("tywin", "kevan").
irmao("stannis", "renly").
irmao("stannis", "robert").
irmao("renly", "robert").
irmao("sandor clegane", "ser gregor clegane").
irmao("aerys ii", "rhaella").



% matou(assassino, vitima)
matou("tyrion", "joanna").
matou("ser jaime", "aerys ii").
matou("robert", "rhaegar").
matou("ser gregor clegane", "elia").
matou("ser gregor clegane", "rhaenys").
matou("ser gregor clegane", "aegon").



% inimigo(nome, nome)
inimigo("sandor clegane", "ser gregor clegane").
inimigo("tywin", "tyrion").



% amigo(nome, nome)
amigo("renly", "loras tyrell").



% relamorosa(nome, nome) - n ha relacao de casamento
relamorosa("ser jaime", "cersei").
relamorosa("renly", "loras tyrell").


% filho(pai, filho)
filho(PROGENITOR, FILHO) :- 
    descendenteDir(PROGENITOR, _, FILHO), 
    homem(FILHO).



% filha(pai, filha)
filha(PROGENITOR, FILHA) :- 
    descendenteDir(PROGENITOR, _, FILHA), 
    mulher(FILHA).



% gay(nome)
gay(PESSOA) :- 
    (casados(PESSOA, CONJUGE); casados(CONJUGE, PESSOA); relamorosa(PESSOA, CONJUGE); relamorosa(CONJUGE, PESSOA)), 
    ((mulher(PESSOA), mulher(CONJUGE)); (homem(PESSOA), homem(CONJUGE))).



% viuvo(nome) - casado c uma pessoa morta
viuvo(PESSOA) :- 
    homem(PESSOA),
    (casados(PESSOA, CONJUGE); casados(CONJUGE, PESSOA)),
    matou(_, CONJUGE).



% viuva(nome) - casada c uma pessoa morta
viuva(PESSOA) :- 
    mulher(PESSOA),
    (casados(PESSOA, CONJUGE); casados(CONJUGE, PESSOA)),
    matou(_, CONJUGE).



% viuvos_amorosos(HOMEM, MULHER) - viúvos, de sexos opostos, q mantém um relacionamento amoroso
viuvos_amorosos(HOMEM, MULHER) :- 
    viuvo(HOMEM), viuva(MULHER), 
    (relamorosa(HOMEM, MULHER); relamorosa(MULHER, HOMEM)). 



% vingança_pendente(nome, nome) – existe uma vingança pendente entre 2 personagens qd a segunda matou o conjugue da primeira
vingança_pendente(PESSOA1, PESSOA2) :-
    matou(PESSOA2, CONJUGEPESSOA1),
    (casados(PESSOA1, CONJUGEPESSOA1); casados(CONJUGEPESSOA1, PESSOA1)).



% assassino(nome) – determina se uma personagem é assassino
assassino(PESSOA) :- matou(PESSOA, _).



% morto(nome) – determina se uma personagem está morta
morto(PESSOA) :- matou(_, PESSOA).



% vingou(X, Y) :– X vingou Y se X matou uma pessoa q tinha previamente morto Y
vingou(X, Y) :-
    matou(X, PESSOA),
    matou(PESSOA, Y).



% infiel(nome) – uma personagem é infiel se está casada c uma pessoa (q n esteja morta) mas mantém uma relação amorosa c outra (que tbm n esteja morta)
infiel(PESSOA) :- 
    (casados(PESSOA, CONJUGE); casados(CONJUGE, PESSOA)),
    not(matou(_, CONJUGE)),
    (relamorosa(PESSOA, PESSOA2); relamorosa(PESSOA2, PESSOA)),
    not(matou(_, PESSOA2)). 



% 1.2. Questione, através da consola, esses mesmos factos de forma a responder positivamente ou negativamente às seguintes perguntas:
%   Aeris está morto?
%   matou(_, "aerys ii"). - true


%   Sir Jaime matou Aerys?
%   matou("ser jaime", "aerys ii"). - true


%   Tywin é amigo de Tirion?
%   amigo("tywin", "tirion"). - false


%   O Stannis é irmão do Renly?
%   irmao("stannis", "renly"). - true


%   Existe alguma relação de incesto?
%   irmao(X, Y), (casados(X, Y); casados(Y, X)); (relamorosa(X, Y); relamorosa(Y, X)), familia(X, F), familia(Y, F).


%   1.3. Escreva agora factos/regras que permitam determinar a seguinte informação, através da consola:
%   Entre que personagens existem relações de incesto?
%   incesto(X, Y)
incesto(X, Y) :- 
    irmao(X, Y), 
	(casados(X, Y); casados(Y, X)); 
    (relamorosa(X, Y); relamorosa(Y, X)).


%   Que personagens foram mortas por Tyrion?
%   matou("tyrion", Y).


%   Que personagens da família Targaryen foram mortas por Ser Jaime?
%   Que personagens mataram membros da família Targaryen?
%   Assumindo que não sabe a verdade, que personagens são resultado do casamento entre Cersei e Robert?
%   Determine todos os filhos de todos os relacionamentos de casamento.