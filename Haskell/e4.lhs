********************************* Entrada e Saída em Haskell ************************************

Haskell é uma linguagem puramente funcional, o que significa que:

  - funções não tem efeito externo, como imprimir na tela
  - funções não dependem de de outros valores, como entrada do teclado, além dos parâmetros

Então, como realizar operações de entrada e saída em Haskell?
  * Haskell tem o tipo especial "IO a", que encapsula operações de entrada e saída. O tipo a é
o tipo do resultado da operação de IO
  * O tipo IO funciona como uma "caixa" que demarca o código impuro!

  * Algumas funções em Haskell de I/O:

     - getChar :: IO Char
     - getLine :: IO String
     - putStrLn :: String -> IO ()
     - putChar :: Char -> IO ()

Agora, podemos fazer o nosso bom e velho programa "Hello, World!":

> hello :: IO ()
> hello = putStrLn "Hello, World!"
 
Para fazer o sequenciamento de operações de IO usamos a notação do, como a seguir:

> hello2 :: IO ()
> hello2 = do
>          putStrLn "Greetings! What is your name?"
>          name <- getLine
>          putStrLn $ "Welcome to Haskell, " ++ name ++ "!"

Neste exemplo usamos a notação <- em "name <- getLine" para "desencaixotar" o valor da operação de IO.
Caso queiramos usar um resultado de uma função "pura" na notação do, usado o let.
Por exemplo, se quisermos usar o tamanho da string name, faríamos:

          let tam = length name


EXEMPLO: Faça um programa quer ler o nome de uma pessoa (string) e imprime a quantidade de caracteres
que chá no nome.

> count = error "complete your code"


*************************************************************************************************


****************************************** IO e Mônadas *****************************************

O tipo IO é uma instância de Monad!
    - confirme no ghci usando o comado :info IO

A notação do é um açúcar sintático das operações >>= e >>

 Just 3 >>= (\x -> Just $ show x ++ "!")

é equivalente, na notação do, a:

 do
   x <- Just 3
   return (show x ++ "!")


E o seguinte código na notação do:

  do
    putStrLn "Greetings! What is your name?"
    name <- getLine
    putStrLn $ "Welcome to Haskell, " ++ name ++ "!"


é equivalente a:

  putStrLn "Greetings! What is your name?"
   >> getLine
   >>= (\name -> putStrLn $ "Welcome to Haskell, " ++ name ++ "!")


O casamento de padrão pode ser usado em conjunto com a notação do:

> wopwop = do
>    (x:xs) <- Just ""
>    return x

Qual o resultado da execução da função wopwop?

****************************************** EXERCÍCIOS *****************************************

1) Criei uma função, soma :: Int -> IO (), que recebe um número inteiro n como parâmetro,
ler n valores de entrada e imprime na tela a média dos valores lidos.
Na sua resposta, use a seguinte função que calcula a média de uma lista de valores:

> media (x:xs) = sum (x:xs) / (fromIntegral $ length (x:xs))
> soma :: Int -> IO ()
> soma n = do
>       putStrLn "Digite os valores:"
>       val <- replicateM n readLn
>       putStrLn $ "A media eh: " ++ show (media valores)
Ons.: você pode criar funções auxiliares caso julgue necessário

2) Faça uma função que ler continuamente uma linha e imprime o texto reverso.
Por exemplo, caso a o usuário digite a seguinte frase:

  "A mala nada na lama"

Deve ser impresso:

  "amal an adan alam A"  

Use a seguinte função para reverter uma linha:

> reverseWords = unwords . map reverse . reverse . words

3) Faça um programa que ler uma entrada do usuário e determina se é um palíndromo. 

*************************************************************************************************
