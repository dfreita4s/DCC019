*********************** FUNÇÕES DE ORDEM SUPERIOR *******************************

Considere funções que dada uma lista de valores realizam as seguintes operações:

a) soma todos os elementos da lista
    soma [1,2,3] = 6


b) realiza o produto dos elementos da lista
    produto [1,2,3] = 6


c) faz a conjunção dos elementos da lista
   conj [True, False, True] = False



* Existe um padrão na definição destas funções? Sim

a)   soma [1,2,3]
   = soma [] = 0
   = soma (x:xs) = x + sum xs 


b)   produto [1,2,3]
   = produto [] = 1
   = produto (x:xs) = x * produto xs


c)   conj [True, False, True]
   = conj [] = True
   = conj (x:xs) = x && conj xs



* Podemos generalizar o padrão?

> mfoldr op e [] = e
> mfoldr op e (x:xs) = op x (mfoldr op e xs)






* A definição destas funções tem o inconveniente de ir até o final da lista
para começar a realizar a computação de interesse. Como podemos modificar
as funções ir computando os valores enquanto percorremos a lista?

a)


b)


c)




* Existe um padrão na definição destas funções?

a)   soma [1,2,3]
   =


b)   produto [1,2,3]
   =


c)   conj [True, False, True]
   =



* Podemos generalizar o padrão?








*************************** EXERCÍCIO *********************************

1) Defina as funções map e filter usando foldr

> mmap op [] = []
> mmap op (x:xs) = op x (mmap op xs)

2) Usando foldl, implemente uma função (bin2int) que dada uma lista
contendo apenas 0's e 1's, retorna o número inteiro correspondente na
base 10. Ex.:

    - bin2int [1,1] = 3
    - bin2int [1,1,0] = 6

3) Como um list comprehension [f x | x <-  xs, p x] pode ser expresso
usando as funções de ordem superior map e filter?

> map f (filter p xs)


4) Dê uma definição para a função length usando as funções map e sum.

> mlength = xs = sum (map (\_ -> 1) xs)


5) Seja a seguinte função f:

> f xs = map (+1) $ map (+1) xs

O que está função faz? Dada duas funções, g e h, podemos obter uma
propriedade da função myst assim definida?

A funçao f incrementa 2 unidades da lista que ela recebe

> myst g h xs = map g $ map h xs

Sim, podemos.

6)  Usando foldl, defina a função dec2int :: [Int] -> Int que converte
um número decimal (representado por uma lista de dígitos) em um inteiro.
Por exemplo:

  - dec2int [2,3,4,5] = 2345

> dec2int xs = foldl (\acc x -> acc * 10 + x) 0 xs



7) Usando foldr, defina as seguintes funções:

a) replace :: Eq a => a -> a -> [a] -> [a], que dado dois elementos x e
y e uma lista xs, substitui toda ocorrência de x por y em xs

b) count :: Eq a => [a] -> [(Int,a)] que computa a frequência de cada
elemento em uma dada lista

***********************************************************************
