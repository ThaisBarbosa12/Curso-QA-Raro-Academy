Funcionalidade: Validar cadastro/acesso de usuarios
 Como usuario do sistema
 Quero realizar o cadastro da minha conta no servidor
 Para que eu possa efetuar o login e acessar as funcionalidades

   Contexto: Criar e acessar conta
     Dado que o usuario acessou a tela de login

   Cenario: Cadastrar um usuario com dados válidos
     Quando o usuario clicar em Criar conta 
     E preencher os campos "nome", "email" e "senha" válidos
     E clicar em "concluir"
     Então o cadastro será concluído

   Cenario: Acessar o sistema
     Quando o usuario preencher um email e senha ja cadastrados nos campos de login
     E clicar em "execute"
     Então o usuário terá acesso ao sistema

    Cenario: Autenticar acesso da conta
     Quando o usuario realizar o login no sistema
     E buscar o Token de autenticação em dados da conta
     E copiar e colar o token de acesso no campo de "atutenticar acesso via token"
     E clicar em "autenticar"
     Então o usuário estará autenticado

   Cenario: Senha de novo usuário deve conter de 6 a 12 digitos
    Quando o usuario acessar Criar conta 
    E preencher um email valido
    E preencher uma <senha> com <quantidadeCaracteres> caracteres
    Entao ele vizualiza a <mensagem>
    Exemplos: 
    |         senha       |  quantidadeCaracteres   |                     mensagem                            |
    |         12345       |            5            | a senha deve conter de 6 a 12 digitos. Tente novamente  |
    |        123456       |            6            | senha válida                                            |
    |      123456789      |            12           | senha válida                                            |
    |     1234567891011   |            13           | a senha deve conter de 6 a 12 digitos. Tente novamente  |

   Cenario: O email deve ser unico
     Quando o usuario acessar Criar conta 
     E preencher no campo email um email de uma conta ja cadastrada
     Entao ele vizualiza a mensagem de conflito: "email invalido, ja possui cadastro"

   Cenario: Preencher os campos de criar usuario incorretamente
     Quando o usuario clicar em Criar conta 
     E preencher os campos "nome", "email" e "senha" incorretamente
     E clicar em "concluir"
     Então o sistema retornara a mensagem: "Dados inválidos. Tente novamente"
  
   Cenario: Fazer login com dados invalidos
     Quando o usuario preencher um email e senha invalidos
     E clicar em "login"
     Então o sistema retornara a mensagem "Dados inválidos. Tente novamente"
     
   Cenario: Acessar conta de usuario que esta inativo
     Quando o usuario preencher um email e senha de um usuario inativado
     E clicar em "login"
     Entao o sistema retornara a mensagem "Dados invalidos. Tente novamente"
  
   Cenario: Acessar conta de usuario que foi deletado
     Quando o usuario preencher um email e senha de um usuario que foi deletado
     E clicar em "login"
     Entao o sistema retornara a mensagem "Dados invalidos. Tente novamente"

Funcionalidade: Validar os tipos de usuario, suas funcoes e permissões
 Como usuario do sistema e proprietario da empresa
 Quero validar os tipos de usuarios disponíveis e suas permissões
 Para que eu possa delegar corretamente as funcoes a cada um deles

   Cenário: Tipos de usuários disponíveis
    Dado que o usuario logado acessou a aba de informações da sua conta
    Quando buscar por "tipo de usuários"
    E clicar nas opções disponíveis
    Então ele vizualizará as opções "comum", "crítico" e "admin"

   Cenário: Novos usuarios devem nascer com o tipo comum
     Dado que o usuario criou uma nova conta 
     Quando ele acessar o sistema
     E buscar por tipo de usuario na aba de dados da conta
     Entao seu tipo de usuário inicial sera "Comum"

   Cenário: Buscar lista de usuarios com uma conta do tipo comum
     Dado que um novo usuário do tipo comum acessou sua conta pela 1º vez
     Quando ele tentar realizar uma busca pela lista de usuários
     Então ele vizualizará a mensagem: "Busca não autorizada. Somente usuarios do tipo admin possuem permissões especiais"
  
   Cenário: Deletar usuarios com uma conta do tipo comum
     Dado que um novo usuário do tipo comum acessou sua conta pela 1º vez
     Quando ele tentar deletar algum usuário do sistema
     Então ele vizualizará a mensagem: "Exclusão não autorizada. Somente usuarios do tipo admin possuem permissões especiais"

   Cenário: Alterar o tipo de usuário para critico
     Dado que um novo usuario esteja logado e autenticado no sistema
     Quando buscar por tipo de usuario na aba de dados da conta
     E clicar em "promover tipo de usuario para crítico"
     Entao seu tipo de usuario sera alterado para "crítico"
    
   Cenário: Alterar o tipo de um usuário para admin
     Dado que um novo usuario esteja logado e autenticado no sistema
     Quando buscar por tipo de usuario na aba de dados da conta
     E clicar em "promover tipo de usuario para admin"
     Entao seu tipo de usuario sera alterado para "admin"

   Cenario: Usuario pode consultar seus prórpios dados
     Dado que estou logado como usuario do tipo <tipoUsuario>
     E acesso a tela de consulta de dados do usuario
     Quando preencho meu ID
     E clico em "consultar"
     Entao o sistema exibe <exibe>
     Exemplos:
     |    tipoUsuario  |            exibe            |
     |      comum      |   os meus dados do usuario  |
     |     crítico     |   os meus dados do usuario  |
     |      admin      |   os meus dados do usuario  |

   Cenario: Usuario pode alterar seus próprios dados
     Dado que estou logado como usuario do tipo <tipoUsuario>
     E acesso a tela de atualizar dados do usuario
     Quando preencho meu ID e as alterações necessárias 
     E clico em "alterar"
     Entao o sistema retorna a mensagem <resultado>
     Exemplos:
     |    tipoUsuario  |              resultado                 |
     |      comum      |    alteração concluida com sucesso     |
     |     crítico     |    alteração concluida com sucesso     |
     |      admin      |    alteração concluida com sucesso     |

    Cenario: Usuario pode alterar dados de outro usuario
     Dado que estou logado como usuario do tipo <tipoUsuario>
     E acesso a tela de atualizar dados do usuario
     Quando preencho as alreações necessárias e ID de outro usuario 
     E clico em "alterar"
     Entao o sistema retorna a mensagem <resultado>
     Exemplos:
     |    tipoUsuario  |                                resultado                                        |
     |      comum      |    Usuario nao autorizado, somente admins podem alterar dados de outro usuario  |
     |     crítico     |    Usuario nao autorizado, somente admins podem alterar dados de outro usuario  |
     |      admin      |                        alteração concluida com sucesso                          |
     |   não logado    |               Usuario nao autorizado, por favor efetuar login                   |

   Cenario: Usuario pode buscar uma lista de usuarios
     Dado que estou logado como usuario do tipo <tipoUsuario>
     E acesso a tela de buscar lista de usuarios
     Quando clico em "buscar"
     Entao o sistema retorna <resultado>
     Exemplos:
     |    tipoUsuario  |                           resultado                                  |
     |     crítico     |   Usuario nao autorizado, somente admins podem realizar essa busca   |
     |      admin      |                        a lista de usuarios                           |
     |    não logado   |          Usuario nao autorizado, por favor efetuar login             |

    Cenario: Usuario pode buscar um usuario pelo ID
     Dado que estou logado como usuario do tipo <tipoUsuario>
     E acesso a tela de "buscar usuario"
     E preencho o ID
     Quando clico em "buscar"
     Entao o sistema retorna <resultado>
     Exemplos:
     |    tipoUsuario  |                           resultado                                  |
     |      comum      |   Usuario nao autorizado, somente admins podem realizar essa busca   |
     |     crítico     |   Usuario nao autorizado, somente admins podem realizar essa busca   |
     |      admin      |                    os dados do usuário procurado                     |
     |    não logado   |           Usuario nao autorizado, por favor efetuar login            |
   
   Cenario: Usuario pode se auto promover a critico
     Dado que estou logado como usuario do tipo <tipoUsuario>
     E acesso a tela de "promover usuário para crítico"
     Quando clico em "promover"
     Entao o sistema retorna <resultado>
     Exemplos:
     |    tipoUsuario  |                    resultado                        |
     |      comum      |           promocao concluida com sucesso            |
     |     crítico     |           promocao concluida com sucesso            |
     |      admin      |           promocao concluida com sucesso            |
     |    não logado   |   Usuario nao autorizado, por favor efetuar login   |

   Cenario: Usuario pode se auto promover a admin
     Dado que estou logado como usuario do tipo <tipoUsuario>
     E acesso a tela de "promover usuário para admin"
     Quando clico em "promover"
     Entao o sistema retorna <resultado>
     Exemplos: 
     |    tipoUsuario  |                    resultado                     |
     |      comum      |          promocao concluida com sucesso          |
     |     crítico     |          promocao concluida com sucesso          |
     |      admin      |          promocao concluida com sucesso          |
     |    não logado   | Usuario nao autorizado, por favor efetuar login  |

   Cenario: Usuario pode inativar sua própria conta
     Dado que estou logado como usuario do tipo <tipoUsuario>
     E acesso a tela de "inativar conta"
     Quando clico em "inativar"
     Entao o sistema retorna <resultado>
     Exemplos:
     |    tipoUsuario  |                  resultado                        |
     |      comum      |          conta inativada com sucesso              |
     |     crítico     |          conta inativada com sucesso              |
     |      admin      |          conta inativada com sucesso              |
     |    não logado   |  Usuario nao autorizado, por favor efetuar login  |
   
   Cenario: Usuario pode deletar sua própria conta
     Dado que estou logado como usuario do tipo <tipoUsuario>
     E acesso a tela de "deletar conta"
     Quando preencho meu ID
     E clico em "deletar"
     Entao o sistema retorna <resultado>
     Exemplos:
     |    tipoUsuario  |                        resultado                              |
     |     crítico     |  Usuario nao autorizado, somente admins podem deletar contas  |
     |      admin      |                Conta deletada com sucesso                     |

    Cenario: Usuario pode deletar a conta de outro usuario
     Dado que estou logado como usuario do tipo <tipoUsuario>
     E acesso a tela de "deletar conta"
     Quando preencho o ID de outro usuario 
     E clico em "deletar"
     Entao o sistema retorna <resultado>
     Exemplos:
     |    tipoUsuario  |                         resultado                             |
     |      comum      |  Usuario nao autorizado, somente admins podem deletar contas  |
     |     crítico     |  Usuario nao autorizado, somente admins podem deletar contas  |
     |      admin      |                  Conta deletada com sucesso                   |     
     |    não logado   |        Usuario nao autorizado, por favor efetuar login        |

   Cenario: Usuario pode avaliar um filme
     Dado que estou logado como usuario do tipo <tipoUsuario>
     E acesso a tela de "avaliar filmes"
     Quando preencho as informacoes de avaliação
     E clico em "avaliar"
     Entao o sistema retorna <resultado>
     Exemplos:
     |    tipoUsuario  |                   resultado                      |
     |      comum      |         avaliação concluida com sucesso          |
     |     crítico     |         avaliação concluida com sucesso          |
     |      admin      |         avaliação concluida com sucesso          |
     |    não logado   | Usuario nao autorizado, por favor efetuar login  |
   
   Cenario: Usuario pode buscar uma lista de revisões 
     Dado que estou logado como usuario do tipo <tipoUsuario>
     E acesso a tela de "buscar lista de revisões"
     Quando clico em "buscar"
     Entao o sistema exibe <resultado>
     Exemplos:
     |    tipoUsuario  |                    resultado                      |
     |      comum      |  a lista de revisoes realizadas pelo meu usuario  |
     |     crítico     |  a lista de revisoes realizadas pelo meu usuario  |
     |      admin      |  a lista de revisoes realizadas pelo meu usuario  |
     |    não logado   |  Usuario nao autorizado, por favor efetuar login  |

   Cenario: Usuario pode buscar uma lista de filmes
     Dado que estou logado como usuario do tipo <tipoUsuario>
     E acesso a tela de "buscar lista de filmes"
     Quando clico em "buscar"
     Entao o sistema exibe <resultado>
     Exemplos:
     |    tipoUsuario  |       resultado      |
     |      comum      |   a lista de filmes  |
     |     crítico     |   a lista de filmes  |
     |      admin      |   a lista de filmes  |
     |    não logado   |   a lista de filmes  |
   
   Cenario: Usuario pode criar um novo filme
     Dado que estou logado como usuario do tipo <tipoUsuario>
     E acesso a tela de "criar novo filme"
     Quando preencho todos os dados necessários
     E clico em "criar"
     Entao o sistema retorna <resultado>
     Exemplos:
     |    tipoUsuario  |                          resultado                             |
     |      comum      |    Usuario nao autorizado, somente admins podem criar filme    |
     |     crítico     |    Usuario nao autorizado, somente admins podem criar filme    |
     |      admin      |                  Filme criado com sucesso                      |
     |   não logado    |        Usuario nao autorizado, por favor efetuar login         |
   
   Cenario: Usuario pode consultar um filme
     Dado que estou logado como usuario do tipo <tipoUsuario>
     E acesso a tela de "consultar filmes"
     Quando preencho o nome do filme
     E clico em "consultar"
     Entao o sistema retorna <resultado>
     Exemplos:
     |    tipoUsuario  |                    resultado                   |
     |      comum      |  os filmes encontrado(s) com o nome pesquisado |
     |     crítico     |  os filmes encontrado(s) com o nome pesquisado |
     |      admin      |  os filmes encontrado(s) com o nome pesquisado |
     |    não logado   |  os filmes encontrado(s) com o nome pesquisado |
   
   Cenario: Usuario pode consultar detalhadamente um filme
     Dado que estou logado como usuario do tipo <tipoUsuario>
     E acesso a tela de "consulta detalhada de filmes"
     Quando preencho o ID do filme procurado
     E clico em "buscar"
     Entao o sistema retorna <resultado>
     E todas informações de revisões feitas no filme com os dados do(s) usuario(s) que as realizou
     Exemplos:
     |    tipoUsuario  |            resultado           |
     |      comum      |  os dados do filme encontrado  |
     |     crítico     |  os dados do filme encontrado  |
     |      admin      |  os dados do filme encontrado  |
     |    não logado   |  os dados do filme encontrado  |
        
   Cenario: Usuario pode deletar um filme
     Dado que estou logado como usuario do tipo <tipoUsuario>
     E acesso a tela de "deletar filme"
     Quando preencho todos os dados necessários
     E clico em "deletar"
     Entao o sistema retorna <resultado>
     Exemplos:
     |    tipoUsuario  |                           resultado                            |
     |      comum      |   Usuario nao autorizado, somente admins podem deletar filmes  |
     |     crítico     |   Usuario nao autorizado, somente admins podem deletar filmes  |
     |      admin      |                     filme deletado com sucesso                 |
     |    não logado   |          Usuario nao autorizado, por favor efetuar login       |
   
   Cenario: Usuario pode atualizar um filme
     Dado que estou logado como usuario do tipo <tipoUsuario>
     E acesso a tela de "atualizar filme"
     Quando preencho todas atualizações necessárias
     E clico em "atualizar"
     Entao o sistema retorna <resultado>
     Exemplos:
     |    tipoUsuario  |                             resultado                            |
     |      comum      |   Usuario nao autorizado, somente admins podem atualizar filmes  |
     |     crítico     |   Usuario nao autorizado, somente admins podem atualizar filmes  |
     |      admin      |                     filme atualizado com sucesso                 |  
     |    não logado   |          Usuario nao autorizado, por favor efetuar login         |

Funcionalidade: Validar as funcionalidades e avaliações dos filmes
 Como usuario do sistema
 Quero verificar as funcoes disponíveis na tela de filmes
 Para elaborar minhas tarefas no sistema

   Cenario: Todas as avaliacoes feitas devem ser retornadas ao consultar um filme
     Dado que o usuario acessa a tela de "consultar filmes"
     Quando ele preencher o nome do filme
     E clicar em "consultar"
     Entao o sistema retornará os dados do filme 
     E todas as avaliações feitas para este filme

   Cenario: Ao consultar um filme detalhadamente as informações de avaliações e usuario avaliador devem ser retornadas 
     Dado que o usuario acessa a tela de "consultar lista detalhada de avaliacoes"
     E preenche o ID do filme
     Quando ele clicar em "consultar"
     Entao o sistema retornará todas as avaliações feitas
     E os dados do usuario avaliador 
    
   Cenario: Criar avaliação de um filme
     Dado que o usuario acessa a área de "avaliar filmes"
     Quando preencher todas as informações da avaliação
     E clicar no botão "avaliar"
     Então a avaliacao será concluida

   Cenário: Reavaliar um filme 
     Dado que o usuario acessa a área de "avaliar filme"
     E quer reavaliar um filme
     Quando preencheer os dados da reavaliação
     E clicar no botão "avaliar"
     Então a reavaliação será concluída
     E substituirá avaliações anteriores, pois só é permitido 1 avaliaçao por usuario. 

    Cenario: Criar um filme com dados incorretos
     Dado que o usuario esta logado e autenticado 
     E acessa a tela de "criar novo filme"
     Quando preencheer todos os dados necessários incorretamente
     E clicar em "criar"
     Entao o sistema retornará a mensagem de erro "Dados inválidos. Por favor preencha novamente"
     

