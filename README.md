# electronic-voting-machine-in-verilog

# Especificação

Uma Máquina de Estados Finitos (Finite State Machine) é um modelo matemático amplamente utilizado na representação do comportamento de sistemas computacionais e circuitos lógicos em geral. O modelo pode ser genericamente descrito como uma máquina abstrata que sempre deve estar em algum de seus finitos estados, um por vez. O estado no qual a máquina se encontra em dado instante é conhecido como estado atual. Todos os estados armazenam informações sobre o passado, isto é, as mudanças ocorridas desde o início do sistema até o presente momento. Uma transição indica uma mudança de estado e é descrita através de uma condição que precisa ser realizada para que tal transição ocorra. Uma ação é a descrição de uma atividade que deve ser realizada em um determinado momento.

Este trabalho prático consiste no projeto e implementação de uma Máquina de Estados Finitos que simule o comportamento de uma Urna Eletrônica simplificada. A FSM deverá ser responsável por receber o número de um candidato e concluir se o voto é válido ou não, de acordo com as especificações abaixo:

● A urna possui quatro candidatos;

● Os votos são contabilizados individualmente;

● Os candidatos são identificados através de números de 4 dígitos, que deverão corresponder aos últimos 4 dígitos das matrículas dos 4 integrantes do grupo. Números fictícios deverão ser propostos por grupos com menos de 4 integrantes;

● Qualquer voto destinado a um número inválido (diferente dos números de todos os candidatos cadastrados) é contabilizado como nulo;

● O pleito elege um único candidato. Isso significa que um eleitor pode votar em somente um dos quatro candidatos disponíveis.


A figura abaixo apresenta o diagrama básico do módulo Urna. A descrição detalhada das interfaces de entrada e saída é apresentada na Tabela 1.

![image](https://github.com/mtsfreitas/morse-code-in-verilog/assets/21324690/9de0e9b4-ab2e-43af-b84d-ddc74fe3cbbf)

Figura 1. Diagrama de entradas e saídas do módulo Urna

![image](https://github.com/mtsfreitas/morse-code-in-verilog/assets/21324690/9869c810-d8cd-4916-af3e-bbf47b9d8ea5)

Tabela 1. Descrição dos sinais do módulo Urna.

A linguagem de descrição de hardware Verilog deverá ser utilizada para descrever o circuito tanto em ambiente virtual (simulação) quanto em ambiente físico (FPGA). Ao final, seu design deverá ser capaz de receber um número, dígito por dígito, concluir se o número corresponde a um voto válido ou nulo, contabilizar a informação e apresentar os resultados finais.

Atenção: A Máquina de Estados Finitos deve ser projetada de forma a permitir que os votos sejam lidos, processados e contabilizados até que o sinal de controle finish seja ativado. Construa seus estados de forma que tal comportamento seja permitido.

# 1. Etapas do desenvolvimento

A linguagem de descrição de hardware Verilog deverá ser utilizada para descrever o circuito tanto em ambiente virtual (simulação) quanto em ambiente físico (FPGA). Ao final, seu design deverá ser capaz de receber um número, dígito por dígito, concluir se o número corresponde a um voto válido ou nulo, contabilizar a informação e apresentar os resultados finais.

Atenção: A Máquina de Estados Finitos deve ser projetada de forma a permitir que os votos sejam lidos, processados e contabilizados até que o sinal de controle finish seja ativado. Construa seus estados de forma que tal comportamento seja permitido.

# Introdução
O objetivo deste trabalho foi a implementação em Verilog de uma máquina de estados de um controlador para um sistema de votação em urna simplificada. O voto deve ser contabilizado se uma das matrículas dos integrantes do grupo. As matrículas são: 3031; 3009; 2670; 2668 (matrícula inventada). Caso seja nenhuma delas, um voto nulo será adicionado. A chegar no último estado “Q5” representa que um voto será computado a um  candidato. Caso chegue no estado “Q12”, um voto nulo será computado. Para este trabalho, implementamos esta máquina de estados como uma máquina de Moore.

# Metodologia
Neste trabalho utilizamos o software JFlap para elaborar o diagrama de transição de estados. Utilizamos também as ferramentas Icarus Verilog e GTKWave para a simulação do módulo e visualização das formas de ondas, respectivamente. Além disso, utilizamos um tutorial para nos auxiliar na implementação em Verilog. Decidimos por utilizar os nomes dos sinais que já estavam propostos no esboço  proposto, sendo Clock; Digit; Valid; Vote status; Finish. 

* Clock pulso de clock do sistema. 
* finish tem o comportamento de um RESET; 
* valid serve para sincronizar a entrada de cada dígito; 
* digit é a entrada de 4 bits; 
* votestatus indica se o voto foi válido ou não
* Candidato 1: totalvotos_matheus
* Candidato 2: totalvotos_luis
* Candidato 3: totalvotos_vinicius
* Candidato 4: totalvotos_random
* Votos nulos: totalvotos_nulos

Com o JFlap, fizemos o diagrama de transição: aborda uma forma simplificada para a visualização das transições dos estados.

# Resultados
Diagramas de transição de estados

![image](https://github.com/mtsfreitas/electronic-voting-machine-in-verilog/assets/21324690/2d47162a-50db-4f54-b5e6-86484073ba14)

Fig. 1: Diagramas de transição de estados (Máquina de Moore).

Na Figura 1, observe que os bits de saída somente se alteram nos estados q5 e q12. O estado q12 indica que o sinal de senha inválida foi ativado e que um voto nulo será computado. O estado q5, por sua vez, indica que o sinal de senha inválida está desativado e um voto em algum candidato será computado. Os estados q9, q10, q11 e q12 são referentes ao caminho da senha inválida. Se em algum momento algum dígito errado for inserido, este caminho garantirá que pelo menos 4 bits foram inseridos antes de mostrar que a senha está errada. Fazer isso garante uma maior segurança para o sistema.

# OBSERVAÇÕES:
Toda transição representada pelas setas na figura só são de fato realizadas se 
Valid = 1. Adotamos uma matrícula aleatória (2668) para compor 4 candidatos, uma vez que nosso grupo é composto por 3 integrantes

# Testbench

![image](https://github.com/mtsfreitas/electronic-voting-machine-in-verilog/assets/21324690/5d9aa045-912d-4e19-ad43-069fd74480c7)

Fig. 3: Resultado da simulação do módulo de testbench.

# Formas de ondas da simulação

![image](https://github.com/mtsfreitas/electronic-voting-machine-in-verilog/assets/21324690/f79d83bd-4612-4aba-8290-1e5e2263431f)

Fig. 4: Formas de onda geradas pela simulação dos módulos.

# FPGA

O arquivo “teste.v” é onde está definido a inclusão dos arquivos “trabalho_pratico2.v”, “mux2x1.v”, “display7segmentos.v” e a comunicação dos  elementos de entrada e saída do dispositivo com a função “F_trabalho_pratico2”,  para o devido funcionamento do módulo na FPGA (Field Programmable Gate Array).

![image](https://github.com/mtsfreitas/electronic-voting-machine-in-verilog/assets/21324690/54894b18-8935-4c8e-b2ae-cb107f3c5389)

Fig. 5: Inclusões dos módulos essenciais no arquivo teste.v

Sendo no painel da máquina as chaves SW (switch) para “entrada” definida de 0 a 3 (4 bits), “reset” na última posição 17 (1 bit), “valid” para a décima  10 (1 bit) e tendo como saída um LED verde (LEDG[8]), indicando que o voto foi computado.

![image](https://github.com/mtsfreitas/electronic-voting-machine-in-verilog/assets/21324690/8d5f9407-26fe-45a2-b1d0-ae76a94946b2)

Fig. 6: Fazendo a ligação dos fios e dos registradores do módulo da urna com os fios registradores do módulo teste.v

![image](https://github.com/mtsfreitas/electronic-voting-machine-in-verilog/assets/21324690/a4ff2c3a-4778-42fb-a6a0-184acf261c70)

Fig. 7: Declaração de fios e registradores do módulo teste.v.

![image](https://github.com/mtsfreitas/electronic-voting-machine-in-verilog/assets/21324690/892c4d11-9add-4764-abec-f844d4e2006f)

Fig. 8: Vinculando os registradores aos display de 7 segmentos. Como existem 8 displays na FPGA, cada um sendo representado por 4 bits, e como cada saída precisa de 8 bits, então cada saída precisa ser representada por 2 displays. “O res_mux_2x1” é o resultado do multiplexador 2 por 1 que seleciona qual será a saída: total de votos nulos ou total de votos random.

![image](https://github.com/mtsfreitas/electronic-voting-machine-in-verilog/assets/21324690/00211453-444b-4d15-87b3-d6caad6942cc)

Fig. 9: Sempre que o sinal “finish SW[17]” se altera esse bloco é executado. Se “finish” é 1, então os votos contabilizados são mostrados nos displays. Se “finish” é 0, então todos os resultados da exibição serão resetados.

![image](https://github.com/mtsfreitas/electronic-voting-machine-in-verilog/assets/21324690/de5fbd41-519e-4251-b0f7-2d9ec9873aee)

Fig. 10: Instância do módulo que representa o multiplexador 2 por 1: ele usa a chave SW[8] para selecionar um dos valores: total votos nulos ou total votos random. Este valor é usado para o que foi exposto na figura “fig. 7”

![image](https://github.com/mtsfreitas/electronic-voting-machine-in-verilog/assets/21324690/6bfdbeac-ad64-4d9c-9b55-9083d33a931d)

Fig. 11: Definição dos LEDR para exibir o valor do estado atual. Enquanto que o LEDG exibe qual será o próximo estado de acordo com o estado das chaves.

![image](https://github.com/mtsfreitas/electronic-voting-machine-in-verilog/assets/21324690/36a681b9-771d-4678-86f2-118aa93fd5b5)

Fig. 12: Elevação do tempo do clock para evitar problemas de contabilização do levantamento das chaves a cada ciclo. Sempre que o clock for 1 (acender no LED[11]) será computado o estado se “valid” estiver levantado.

![image](https://github.com/mtsfreitas/electronic-voting-machine-in-verilog/assets/21324690/ce73746b-b286-4ffd-9744-7b2d5acd73be)

Fig. 13: Exibição dos votos no display de 7 segmentos após levantar a chave 17 (finish) para a finalização dos votos, contendo: 2 votos nulos, 1 voto para o candidato 1 (Matheus), 1 voto para o candidato 2 (Luís), 1 voto para o candidato (Vinicius) respectivamente.

![image](https://github.com/mtsfreitas/electronic-voting-machine-in-verilog/assets/21324690/f0df4dda-e9f4-43c7-b4d9-451857e84d63)

Fig. 14: Exibição dos votos no display de 7 segmentos após levantar a chave 17 (finish) para a finalização dos votos, contendo: 1 voto para o candidato 4 (random), 1 voto para o candidato 1 (Matheus), 1 voto para o candidato 2 (Luís), 1 voto para o candidato (Vinicius) respectivamente. Sendo a exibição do quarto candidato possível após levantar a chave 8 (definido pelo mux), ocorrendo a troca de exibição de votos nulos para candidato random.

# Conclusão

Com esse trabalho conseguimos explorar bem o funcionamento de uma máquina de estados. Aperfeiçoando as habilidades na linguagem Verilog. Conhecendo mais a fundo os recursos que a FPGA dispõe, sendo importante definir o comportamento de um sistema, uma vez que modelado como tal a implementação em Verilog fica muito mais simplificada (isso se dá pela transição de estados).

# Referências

VERILOG TUTORIAL FOR BEGINNERS. Disponível em: 
<http://referencedesigner.com/tutorials/verilog/verilog_01.php>. Acesso em: 12 
out. 2018

VERILOG TUTORIAL. Disponível em: <http://www.asic-world.com/verilog/veritut.html>. Acesso em: 12 out. 2018

DOWNLOAD ICARUS VERILOG . Disponível em: <http://bleyer.org/icarus>. 
Acesso em: 12 out. 2018

DOWNLOAD GTKWAVE. Disponível em: 
<http://www.dspia.com/gtkwave.html>. Acesso em: 12 out. 2018

DOWNLOAD Quartus Prime Lite Edition. Disponível em:
<http://fpgasoftware.intel.com/?edition=lite>. Acesso em: 29 out. 2018
