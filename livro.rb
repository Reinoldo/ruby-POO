

class Livro
	attr_reader :preco, :ano_lancamento, :titulo

	def initialize(preco, ano_lancamento, titulo, possui_reimpressao)
		
		@ano_lancamento = ano_lancamento
		@titulo = titulo
		@possui_reimpressao = possui_reimpressao
		@preco = calcula_preco(preco)
		
	end

	def possui_reimpressao?
		@possui_reimpressao
	end

	def calcula_preco(base)
		if @ano_lancamento <= 2006
			if @possui_reimpressao
		 	 	base * 0.9
			else
			 	base * 0.95
			end
		elsif @ano_lancamento <=2010
		 	base *0.96
		else
		 	base
		end

	end

	def to_csv()
		puts "#{@titulo}, #{@ano_lancamento}, #{@preco}"
	end


	def livro_para_newsletter()
			
			puts "newsletter"
			puts ano_lancamento
			puts titulo
			puts preco
			puts possui_reimpressao?
		
	end
end

class Estoque
	

	def initialize
		@livros = []
	end

	def exporta_csv
		@livros.each do |livro|
			puts livro.to_csv
		end
	end

	def mais_barato_que(valor)
		#@livros.select do |livro|
		#	livro.preco <= valor
		@livros.each do |livro|
			if livro.preco <= valor
				puts livro.titulo
			end
		end
	end

	def total
		puts @livros.size
	end

	def adiciona(livro)
		@livros << livro if livro
	end
end
		
	
rails = Livro.new(100, 2006, "ruby on rails", true)
arquitetura = Livro.new(150, 1999,"Introdução a arquitetura e Design de Software", true)

estoque = Estoque.new

estoque.adiciona rails
estoque.adiciona arquitetura
estoque.adiciona Livro.new(40, 2010, "Turbo Pascal", false)
estoque.adiciona Livro.new(40, 2010, "Turbo Pascal 2", false)
estoque.adiciona Livro.new(40, 2010, "Turbo Pascal 3", false)


estoque.mais_barato_que 50
#estoque.exporta_csv
estoque.total
