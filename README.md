# LanHouse · Computadores

Microsserviço de **Computadores** do projeto LanHouse (Arquitetura de Software, Engenharia de Software, UNISATC).

Cadastro dos computadores (identificação, tipo, hardware e valor da hora) e controle do status (Livre, Reservado, EmUso).

- Requisitos atendidos: RF03, RF04
- Depende de: nenhum serviço
- Consumido por: Reservas
- Banco próprio: SQLite (`computadores.db`), criado com `EnsureCreated()` na inicialização
- Porta local: `5002`

Dados de demonstração criados na inicialização: computadores 1 a 4.

## Endpoints

- `POST /api/computadores`
- `GET /api/computadores?status=`
- `GET /api/computadores/{id}`
- `PUT /api/computadores/{id}/status`
- `POST /api/computadores/{id}/reservar`

Também expõe `GET /health` e a documentação interativa (Scalar) em `/scalar`. Erros seguem o formato `{ "erro": "mensagem" }`.

## Configuração

Este serviço não depende de nenhum outro: não há URLs externas para configurar.

## Executar localmente

Requisito: [.NET SDK 10](https://dotnet.microsoft.com/download).

```bash
cd Computadores
dotnet run --launch-profile http   # http://localhost:5002
```

## Executar com Docker

```bash
docker build -t lanhouse-computadores .
docker run --rm -p 5002:8080 lanhouse-computadores
```

## Publicação no Render

| Campo | Valor |
|---|---|
| Language | Docker |
| Dockerfile Path | `./Dockerfile` |
| Docker Build Context Directory | `./` |
| Instance Type | Free |

Publique primeiro os serviços sem dependências (Cobrança e Computadores), depois Clientes e por último Reservas.

## Os 4 repositórios do projeto

| Serviço | Repositório |
|---|---|
| Clientes | https://github.com/pachecothiagoo/lanhouse-clientes |
| Computadores | https://github.com/pachecothiagoo/lanhouse-computadores |
| Reservas | https://github.com/pachecothiagoo/lanhouse-reservas |
| Cobrança | https://github.com/pachecothiagoo/lanhouse-cobranca |

Documento de requisitos, diagramas e execução conjunta: https://github.com/pachecothiagoo/lanhouse
