# ruby-dev-test-1

Desenvolver a camada de modelos de um sistema de arquivos persistido em um banco de dados SQL onde seja possível criar diretórios e arquivos. Os diretórios poderão conter sub-diretórios e arquivos. O conteúdo dos arquivos podem estar ser persistidos como blob, S3 ou mesmo em disco.

A solução deverá ser escrita majoritariamente em Ruby com framework Ruby on Rails.

## Iniciando

Instruções para rodar o projeto: 

### Pré-requisitos

Pre-requisitos para instalar e rodar o projeto
```
ambiente linux, mac
ruby 2.4.1 ou superior
rails 5.1 
```

### Instalação

Passo a passo que mostram como instalar e rodar o ambiente de desenvolvimento. Para iniciar você deve rodar os seguintes comando no terminal

Instalar os componentes do projeto
```
bundle install
```

Para configurar o banco de dados SQLite

```
rake db:create db:migrate
```
Para criar alguns dados de inicialização

```
rake db:seed
```

#Configuração do S3

Será necessário configurar as chaves de acesso do S3 no arquivo .env na raiz do projeto. Esse passo é importante porque sem essa configuração o projeto não vai rodar corretamente e os testes da classe FileS3 também vão gerar erros.
```
S3_BUCKET=you_bucket_name
S3_REGION=your_region_s3
S3_ACCESSS_KEY_ID=your_access_key
S3_SECRET_ACCESS_KEY=your_secret_key
```

Para inicializar o projeto
```
bundle exec rails s
```

Para acessar o demo basta digitar no seu browser
```
http://localhost:3000
```


## Testes unitários

Detalhes para rodas os testes únitarios


### Rodando os testes

Explain what these tests test and why

```
rspec 
```

## Infos

Foi utilizado o conceito de Open-Closed do solid para gerar os drives de upload para os diferentes storages.
A classe que ficou responsável pela orquestração das instancias com base no tipo de arquivo foi:

```
FileProcess.rb 
```
Foi definido uma classe base que define a assinatura dos métodos da classe fila e com isso permite estender mais classes quando houver a necessidade
```
FileBase.rb 
```
As classes que herdam a funcionalidade e usam polimorfismo nos metodos save, find e destroy são:
```
FileS3.rb, FileLocal.rb e FileBlob.rb  
```

Estrutura de diretórios

![Diretorios](https://github.com/rruy/ruby-dev-test-1/blob/master/public/infos/Diretories.jpg?raw=true)

Classe responsável por criar a lista de diretórios e subdiretórios com os arquivos para o front-end:
```
FileStorageHelper.rb
```

Visão geral
![Diretorios](https://github.com/rruy/ruby-dev-test-1/blob/master/public/infos/ViewAll.jpg?raw=true)


Para adicionar mais arquivos em um diretório
![Diretorios](https://github.com/rruy/ruby-dev-test-1/blob/master/public/infos/AddFileToFolder.jpg?raw=true)

Para ver o arquivo
![Diretorios](https://github.com/rruy/ruby-dev-test-1/blob/master/public/infos/ViewFile.jpg?raw=true)

## Author

* **Ricardo Ruy** 
