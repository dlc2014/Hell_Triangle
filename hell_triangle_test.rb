#Author: Diego Costa
#Last Update: 25/03/2018
#Version: 2.0
#Description: Classe de teste responssável por validar a lógica e os parêmetros

require 'minitest/autorun'
require 'benchmark'

load 'hell_triangle.rb'

class HellTriangleTest < MiniTest::Unit::TestCase

	def setup
    	@hell_triangle = HellTriangle.new
  	end

  	#Testa triângulo do desafio
	def test_way_of_chalenge
		array_triangle = [[6],
						 [3,5],
						[9,7,1],
					   [4,6,8,4]]

		
		assert_equal 26, @hell_triangle.select_max_way_on_triangle(array_triangle)
	end 

	#Testa um caminho mais longo
	def test_long_way
		array_triangle = [[6],
						 [3,5],
						[9,7,1],
					   [4,6,8,4],
					  [4,6,8,4,8],
					 [4,6,8,4,8,1],
					[4,6,8,4,8,1,2]]

		
		assert_equal 50, @hell_triangle.select_max_way_on_triangle(array_triangle)
	end 

	#Testa outro caminho que quebraria a busca se tivesse usado a lógica de escolher o filho com maior valor
	def test_other_way
		array_triangle = [[6],
						 [3,5],
						[9,7,1],
					   [9,6,8,4]]

		
		assert_equal 27, @hell_triangle.select_max_way_on_triangle(array_triangle)
	end 

	#Testa o caminho descendo pela direita
	def test_way_of_right
		array_triangle = [[6],
						 [0,5],
						[0,0,1],
					   [0,0,0,4],
					  [0,0,0,0,8]]
		assert_equal 24, @hell_triangle.select_max_way_on_triangle(array_triangle)
	end

	#Testa o caminho descendo pela esquerda
	def test_way_left
		array_triangle = [[6],
						 [5,0],
						[1,0,0],
					   [4,0,0,0],
					  [8,0,0,0,0]]
		assert_equal 24, @hell_triangle.select_max_way_on_triangle(array_triangle)
	end

	#Testa o caminho descendo pelo centro
	def test_way_of_center
		array_triangle = [[6],
						 [5,0],
						[0,1,0],
					   [0,0,4,0],
					  [9,9,8,0,0]]
		assert_equal 24, @hell_triangle.select_max_way_on_triangle(array_triangle)
	end

	#Testa o metodo que valida se é um triangulo válido
	def test_is_valid_triangle
		result = false
		array_triangle = [[0],
						 [0,0],
						[0,0,0],
					   [0,0,0,0],
					  [0,0,0,0,0]]
		
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
		assert_equal true, result
	end

	#Testa o cenário de triângulo não válido
	def test_is_not_valid_triangle
		result = false
		array_triangle = [[0],
						 [0,0,0,0],
						[0,0,0],
					   [0,0,0,0],
					  [0,0,0,0,0]]
		
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
		assert_equal false, result
	end

	# Testa o retorno do ´método principal
	def test_select_max_way_on_triangle_return_ok

		array_triangle = [[6],
						 [3,5],
						[9,7,1],
					   [4,6,8,4]]

		retorno = @hell_triangle.select_max_way_on_triangle(array_triangle)

		assert_equal Fixnum , retorno.class
	end

	#Teste alerta de triângulo não válido
	def test_select_max_way_on_triangle_return_not_ok

		array_triangle = [[6],
						 [3,5,0,3],
						[9,7,1],
					   [4,6,8,4]]

		retorno = @hell_triangle.select_max_way_on_triangle(array_triangle)

		assert_equal "Não é um triângulo válido!" , retorno
	end
end