class Livro
	attr_reader :preco, :ano_lancamento, :titulo

	def initialize(preco, ano_lancamento, titulo)
		
		@ano_lancamento = ano_lancamento
		@titulo = titulo
		@preco = calculaPreco(preco)
	end

	def calculaPreco(preco)
		if @ano_lancamento < 2000
			desconto = preco *0.3
			preco = preco * 0.7

			puts "o desconto é de R$ #{desconto}"
		else
			preco
		end
	end

	def livro_para_newsletter()
	if @ano_lancamento < 2000
		puts "newsletter"
		puts titulo
		puts preco
	end
end
end







rails = Livro.new(200, 1998, "ruby on rails")


rails.livro_para_newsletter()


