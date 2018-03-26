#Author: Diego Costa
#Last Update: 25/03/2018
#Version: 4.0
#Description: Classe que implementa a lógica do desafio

class HellTriangle

	#Método principal
	def select_max_way_on_triangle(array_triangle)
		
		if is_valid_triangle?(array_triangle)

				#Monta o gabarito de caminhos
				array_caminhos = monta_gabarito(array_triangle)

				#Mapeia o triângulo em um objeto Hash
				obj_map = convert_mult_array_in_hash(array_triangle)

				array_final = []
				#Itera todos os caminhos chamando um método recursivo para coletar os valores
				array_caminhos.each do |caminho|
					@caminho_real_temp = []
					count = 0
					
					final =	busca_filhos(caminho, obj_map)
					
					array_final << final

				end
				maior_soma = 0

				#Itera todas as possibilidades para coletar a maior soma dos caminhos
				array_final.each do |array|
					maior_soma = array.inject(:+) if array.inject(:+) > maior_soma
				end

				puts"SUM - #{maior_soma}"
				return maior_soma
			else
				return "Não é um triângulo válido!"
			end
		end

	#Método recursivo para buscar os valores reais
	def busca_filhos(caminho, obj)

		if @caminho_real_temp.length == 0
			temp = obj.select{|k,v| v['nivel'] == 0 }
			@caminho_real_temp << temp.values[0]['value']
		end

		if @caminho_real_temp.length < caminho.length

			obj_filho = obj.select{|k,v| v['value']== @caminho_real_temp.last && v['nivel'] == @caminho_real_temp.length - 1}
			@caminho_real_temp << obj_filho.values[0]['filho'][caminho[@caminho_real_temp.length].to_i]

			busca_filhos(caminho,obj)
		else
			return @caminho_real_temp
		end
	end

	#Método para validar se o triângulo é válido
	def is_valid_triangle?(array_triangle)
		result = false
		
		level_count = 1		
		
		array_triangle.each do |nivel|
			if nivel.length == level_count
				result = true
			else
				result = false
				break
			end

			level_count +=1 
		end
		result
	end

	#Método para converter array multidimensional em um objeto Hash
	def convert_mult_array_in_hash(array_triangle)

		qtd_niveis = array_triangle.length - 1
		count_nivel = 0
		obj = {}
		count_value = 0
		array_triangle.each do |nivel|

			nivel.each do |value|

				posicao = nivel.index(value)
				key = "#{count_value}"
				key_2 = "#{count_nivel}-#{posicao}"
				obj[key] = {} if !obj.has_key? key

				obj[key]['id'] = key
				obj[key]['position'] = key_2
				obj[key]['value'] = value
				obj[key]['nivel'] = count_nivel
				
				if count_nivel == 0
					obj[key]['pai'] = nil
				else

				#Se for a primeira posição seu pai sempre será a primeira posição do npivel acima
				if posicao == 0 

					obj[key]['pai'] =[]
					obj[key]['pai'] << array_triangle[count_nivel-1].slice(0)

				#Se for a última posição seu pai sempre será a última posição do npivel acima
			elsif posicao == nivel.index(nivel.last)
					# procura pelo pai
					obj[key]['pai'] = []
					obj[key]['pai'] << array_triangle[count_nivel-1].slice(array_triangle[count_nivel-1].index(array_triangle[count_nivel-1].last))
				else
					# Se for um npo do meio, possuirá 2 pais
					obj[key]['pai'] = array_triangle[count_nivel-1].slice(posicao-1,posicao + 1)
				end
			end

			if posicao == 1 
				obj[key]['filho'] = array_triangle[count_nivel+1].slice(posicao,posicao + 1) if count_nivel < qtd_niveis
			else
				obj[key]['filho'] = array_triangle[count_nivel+1].slice(posicao,posicao + 2) if count_nivel < qtd_niveis
			end
			count_value += 1
		end
		count_nivel += 1
	end
		#Retorna um objeto com 
		obj
	end

	#Método para gerar todos os caminhos possíveis baseado na quantodade de níveis do triângulo
	def monta_gabarito(array_triangle)

		#Pega a quantidade de níveis e subtrai 1, pois a PG já inicia em 1
		count_nivel = array_triangle.length 
		count_nivel = count_nivel - 1

		total_pg = 1

		#Usa progressão geométrica para encontrar a quantidade de caminhos possíveis
		count_nivel.times do |value|
			total_pg = total_pg * 2
		end

		#Monta Gabarito de Caminhos possíveis
		array_caminhos = []
		total_pg.times do |value|
			array_temp = []

			#Monta um número binário, dentro da quantidade de possibilidades, que representará um caminho possível
			numero_binario = value.to_s.to_i(10).to_s(2)
			array_temp << numero_binario.split("")
			tamanho =  array_temp[0].length
			diferenca = (count_nivel + 1) - tamanho
			
			#Preenche os espaços vazios à esquerda do numero binário com 0, para completar o caminho.
			diferenca.times do |c|
				array_temp[0].insert(0,"0")
			end

			#Retorna um caminho montado
			array_caminhos << array_temp[0]
		end

		#Retorna o conjunto de todos os caminhos possíveis
		array_caminhos
	end
end


#Teste direto na classe principal para observar a saída com o valor da soma do maior caminho
#Aqui é possível modificar o parâmetro de entrada
array_triangle = [[6],
[3,5],
[9,7,1],
[9,6,8,4]]

hell = HellTriangle.new

hell.select_max_way_on_triangle(array_triangle)