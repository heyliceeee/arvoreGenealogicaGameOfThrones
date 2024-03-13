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
irmao(X, Y) :- descendenteDir(PAI, MAE, X), descendenteDir(PAI, MAE, Y).


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



% relamorosa(nome, nome) - n ha relacao de casamento



% filho(pai, filho)



% filho(pai, filha)



% gay(nome)



% viuvo(nome) - casado c uma pessoa morta



% viuva(nome) - casada c uma pessoa morta



% viuvos_amorosos(nome, nome) - viúvos, de sexos opostos, q mantém um relacionamento amoroso



% vingança_pendente(nome, nome) – existe uma vingança pendente entre 2 personagens qd a segunda matou o conjugue da primeira



% assassino(nome) – determina se uma personagem é assassino



% morto(nome) – determina se uma personagem está morta




% vingou(X, Y) :– X vingou Y se X matou uma pessoa q tinha previamente morto Y



% infiel(nome) – uma personagem é infiel se está casada c uma pessoa (q n esteja morta) mas mantém uma relação amorosa c outra (q tbm n esteja morta)



