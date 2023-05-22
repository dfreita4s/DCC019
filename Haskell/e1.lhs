*********************** PROGRAMAÇÃO FUNCIONAL *******************************

O programa é uma coleção de definições de funções e o resultado é computado
via avaliações de expressões.

Usaremos a linguagem Haskell, por ser uma linguagem puramente funcional,
para estudar os conceitos de programação funcional.

Em sua essência, uma linguagem funcional precisa apenas apresentar uma sintaxe
para definição de funções lambda.
Em Haskell, definições em lambda cálculo são especificadas com a seguinte sintaxe:
  
                 \x -> expr

Nomes podem ser associados a expressões usando a sintaxe

                nome = expr

Desta forma, podemos as seguinte definições em Haskell para as funções em lambda cálculo

                            λx.x          e         λx.λy.x y

> ex1 = \x -> x
> ex2 = \x -> \y -> x y

A linguagem Haskell é uma linguagem estaticamente e fortemente tipada!
Haskell tem os tipos básicos Int, Float, Char, Bool, Tuplas, Funções e Listas.

A sintaxe para avaliação de expressão é

                    expr expr

Usaremos o compilador GHC - Glasgow Haskell Compiler para avaliar programas em Haskell.
Usando o interpretador, GHCi, execute a avaliação das seguintes expressões:

1 + 5 -- Operação de adição com números
42 * 10 -- Operação de multiplicação com números
5 / 2 -- Operação de divisão
True && False -- Conjunção lógica
"Hello, World" -- Uma string
'L' -- Um caractere
(1, "Um") -- Exemplo de um valor tupla

ex1 1 -- Aplicação da definição ex1 no argumento 1
ex2 ex1 1 -- Aplicação da definição ex2 nos argumentos ex1 e 1

************************** DEFINIÇÕES DE FUNÇÕES ***************************

Como podemos definir uma função que dobra o valor do argumento?
Usando a notação de lambda cálculo, basta definir um nome e associar a lambda
expressão correspondente:

> dobro = \x -> 2 * x

Alternativamente, os nomes dos parâmetros podem ser descritos após e o nome da função
e antes do símbolo de igualdade.
Deste modo, a definição da função fica:

> dobro1 x = 2 * x

Como exemplo, podemos definir uma função que soma dois valores

> soma x y = x + y

e funções para o primeiro / segundo elemento de uma tupla:

> pri (x, y) = x
> seg (x, y) = y

*************************** EXERCÍCIO *********************************

1) No GHCi, verifique o resultado da avaliação das seguintes expressões:

  a) dobro 2
  b) dobro1 (dobro1 2)
  c) pri (1, True)
  d) seg (1, True)

***********************************************************************

E como podemos definir a função fatorial? Para tal, usaremos a expressão
condicional if e₁ then e₂ else e₃

> fat n = if n == 0 then 1 else n * fat (n-1)


Uma maneira alternativa de definir a função fatorial é usar uma definição
por casamento de padrões.
Neste formato, as funções são definidas por uma sequência de equações para
cada caso:

> fat1 0 = 1
> fat1 n = n * fat (n-1)

Numa aplicação de função, por exemplo fat1 5, o argumento da função é testado
com cada um dos casos, em ordem, até que encontre um casamento com o padrão e
a expressão da direita da igualdade é usada como resultado a aplicação.
Se não houve casamento com nenhum padrão, um erro de execução será reportado.

Neste formato, podemos definir a função lógica "e"  descrevendo todos os possíveis
caso:

> e True True = True
> e True False = False
> e False True = False
> e False False = False

*************************** EXERCÍCIO *********************************

2) Observe que a ordem que as equações que definem uma função é executada
é importante, visto que a tentativa de casamento de padrão é realizada na
ordem que as equações são definidas. Sabendo disto, qual o resultado de
fat1 3 caso a ordem das equações da função fatorial fossem invertidas?

***********************************************************************

Uma 3ª maneira de definir funções em Haskell é usando guardas, em que
cada caso é definido com o símbolo |, um caso de teste e a expressão
de retorno.
A seguir apresento a definição da função fatorial usando guardas:

> fat2 n
>   | n == 0 = 1
>   | otherwise = n * fat2 (n-1)


*************************** EXERCÍCIO *********************************

3) Defina uma função que retorna o n-ésimo elemento da série de Fibonacci.
Defina uma versão da função usando cada uma das maneiras vista:
  a) com expressão if-then-else
  b) com casamento de padrão
  c) usando guardas

***********************************************************************

*************************** LISTAS EM HASKELL *************************

Prolog usa uma representação simbólica de lista, a qual contém uma cabeça e uma cauda.

A notação usada para lista é:
  
             head : tail

head é um elemento da lista, a cabeça, e tail é uma lista ou a cauda.
A lista vazia é representada por [].

Literais de listas podem ser definidos listando os elementos, separando-os por vírgula.

São exemplos de lista:

-  []
-  [1,2,3]
-  ['A', 'B', 'C']       
-  1:[2,3]
-  1:2:3:[]
-  'A':" small cat"

Listas são tipos homogêneos, ou seja, contém apenas elementos do mesmo tipo.
Assim, as expressões abaixo não são listas válidas em Haskell:

- [1,2,'a','b']
- [1, 3, []]
- [True, 1]

Podemos descrever listas usando intervalos, via uso do operador ..

- [1 .. 20]
- ['a' .. 'z']
- [2, 4 .. 19]
- [10, 9 .. 1]
- [3, 6 .. 2*12]
- [3, 6 ..]

Podemos usar casamento de padrão para definir funções sobre listas:

Como exemplo, vamos definir as seguintes funções sobre listas:

1) Função que concatena duas listas

mconcat :: [a] -> [a] -> [a]

2) Função de indexação 

mindex :: [a] -> Int -> a

3) Função que calcula tamanho da lista

mlen :: [a] -> Int

4) Função que retorna a cabeça da lista

mhead :: [a] -> a

5) Função que retorna os n primeiros elementos de uma lista

mtake :: Int -> [a] -> [a]

*************************** EXERCÍCIOS *********************************
  
4) Defina as seguintes funções sobre lista

a) função que retorna a cauda de uma lista (mtail), tal que
      mtail [1,2,3] = [2,3]

b) função que reverte uma lista (mreverse), de modo que
      mreverse [1,2,3] = [3,2,1]

c) função que remove os n primeiros elementos de uma lista (mdrop), tal que
     mdrop 0 [1,2,3] = [1,2,3]
     mdrop 2 [1,2,3] = [3]
     mdrop 5 [1,2,3] = []

d) função que dada duas listas, retorna uma lista formados por um elemento
da primeira e um elemento da segunda (mzip). Por exemplo,
    mzip [1,2,3] ['a','b'] = [(1,'a'), (2, 'b')]
    mzip [1] ['a','b'] = [(1,'a')]
    mzip [1,2,3] [] = []

e) função que intercala duas listas (merge). Tal que
  merge "abc" "xyz" = "axbycz"
  
f) função que dado um elemento x e uma lista l, insere x entre os elementos de l (intersp):
  intersp ',' "1234" = "1,2,3,4"

g) função que dada uma lista, produz um par de listas em que ambas possuem metade dos elementos
da lista original. Se a lista possuir tamanho ímpar, então uma das listas terá um elemento
a mais que a outra (mixHalf) :
  mixHalf [1,2,3,4,5] = ([1,3,5],[2,4])

***********************************************************************
