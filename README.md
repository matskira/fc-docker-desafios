# DESAFIOS DOCKER FULL CYCLE
## Desafio 01 - GO

O primeiro desafio, é praticamente subirmos um container GO, com algumas tarefas:
- Ao executar o contaier, imprimir a mensagem "Full Cycle Rocks!"
- A imagem não pode ser maior que 2MB;


### Passos

**Criação de hello.go**

Código:
```go
package main 
import "fmt"
func main(){
	fmt.Println("Full Cycle Rocks!!")
}
```

Código simples, onde iremos executar uma mensagem no console.

**Criação do Dockerfile**

Código:
```docker
#BUILD GO COMPILER
FROM golang AS builder
WORKDIR /usr/src/app/
COPY ./go .
RUN go build -ldflags "-s -w" hello.go

#BUILD SCRATCH
FROM scratch
WORKDIR /usr/src/app/
COPY --from=builder /usr/src/app/hello .
ENTRYPOINT [ "./hello" ]
```

Bom como nos requisitos, a imagem que geraremos tem que ser menor que 2MB. 
- Usamos o conceito de multi stage building, onde separamos a compilação do programa GO, e a execução do mesmo;
- Quebramos em compilação e depois em execução
- Para compilação usamos o goland, realizamos a cópia do arquivo go e compilamos, utilizando algumas flags para diminuir o tamanho do binário que será gerado.
- Por fim como é apenas um arquivo binário, usamos o scratch, que é a menor imagem possível para executar um binário.

### Teste

Para testar é bem simples, basta clonar o repositório, e executar o seguinte comando para buildar a imagem:
` docker build -t nome/da-imagem . `
E por fim, executa ela em container:
` docker run nome/da-imagem`


***

##Desafio 02 - Nginx com Node.JS

(em andamento)


