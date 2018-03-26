# Hell_Triangle

Implementação do desafio Hell Triangle, descrito no documento HellsTriangle.pdf.

Considerações
A entrada é composta por um array multidimenssional de inteiros.

Solução
A solução está implementada na Classe hell_triangle.rb, dentro da raiz.

Chamada
É preciso ter uma versão do ruby instalado.
O módulo é chamado através do terminal, acessando a raiz do projeto e executando o comando "ruby ruby hell_triangle.rb"
Os parâmetros de entrada podem ser alterados no array qua é passado como parâmetro na mesma classe(final do arquivo).
O retorno é um número inteiro com a Soma do maior caminho de cima para baixo.

Implementação
O desafio foi implementado em ruby.

1 - O array de entrada é converdito em um objeto hash.
2 - Com base na quantidade de níveis do triângulo, são calculados todos os caminhos possíveis.
3 - com os caminhos possíveis é ralizada uma busca recursiva no objeto para obter todos os valores do caminho e somálos.

Testes
Os testes foram criados em uma classe separada utilizando "minitest", chamada hell_triangle_test, também no diretório raiz.

Chamada
A chamada é executada utilizando apenas o comando "ruby hell_triangle_test.rb".

Implementação
Uma subclasse chamada HellTriangleTest, contém diversos métodos de testes, cobrindo as possibilidades de erro e os casos de sucesso. 
O método setUp é utilizado para instanciar a classe principal.

Os testes são:

test_way_of_chalenge : #Testa triângulo do desafio

test_long_way : #Testa um um triângulo com caminho mais longo

test_other_way : #Testa outro caminho que quebraria a busca se tivesse usado a lógica de escolher o filho com maior valor (isso me tirou da casca de banana no desafio)

test_way_of_right : #Testa o caminho descendo pela direita

test_way_left : #Testa o caminho descendo pela esquerda

test_way_of_center : #Testa o caminho descendo pelo centro

test_is_valid_triangle : #Testa o metodo que valida se é um triangulo válido

test_is_not_valid_triangle : #Testa o cenário de triângulo não válido

test_select_max_way_on_triangle_return_ok : # Testa o retorno do ´método principal

test_select_max_way_on_triangle_return_not_ok : #Teste alerta de triângulo não válido

