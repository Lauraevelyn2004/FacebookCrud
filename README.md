# Facebook CRUD - Sistema de Gestão de Postagens

## Alterações (Commit #2)

Nesta atualização, o sistema evoluiu de uma estrutura estática para uma aplicação dinâmica com integração total à base de dados para a entidade **Posts**.

### 1. Camada Controller (Lógica de Controlo)
A introdução do `PostsController.java` permitiu a centralização das regras de negócio.
* **Mapeamento de Rotas:** O controlador agora interpreta as ações do utilizador (listar, criar, editar, eliminar).
* **Gestão de Requisições:** Utiliza o objeto `HttpServletRequest` para capturar inputs e `request.setAttribute` para enviar objetos recuperados do banco diretamente para as páginas JSP.

### 2. Camada Model & Persistência (DAO)
* **Integração com PostDAO:** O controlador comunica com o `PostDAO` para realizar operações de leitura e escrita no MySQL.
* **Relacionamento entre Entidades:** Foi implementada a lógica para associar um `Post` a um `User`. Agora, o sistema identifica corretamente o autor de cada publicação através da chave estrangeira no banco de dados.

### 3. Camada View (Interface do Utilizador)

* **`index.jsp` (Ponto de Entrada):** Configurado para realizar um *forward* ou *redirect* automático para o Servlet de postagens, garantindo que o utilizador nunca aceda a uma página sem os dados carregados.
* **`posts.jsp` (Listagem):** * Implementação de ciclos (`c:forEach`) para renderizar a tabela de posts.
    * Exibição dinâmica do nome do autor, título e conteúdo.
* **`form_post.jsp` (Formulário Inteligente):**
    * **Carregamento de Autores:** O formulário agora consulta o `UserDAO` para listar todos os utilizadores registados num elemento `<select>`.
    * **Seleção de Autoria:** O utilizador pode selecionar manualmente qual perfil é o autor daquela postagem específica, garantindo a integridade dos dados.

## Fluxo de Funcionamento Atualizado

1. O utilizador acede à aplicação via `index.jsp`.
2. O `PostsController` intercepta a chamada e solicita ao `PostDAO` a lista de publicações.
3. O `PostDAO` executa o SQL no MySQL e retorna uma lista de objetos `Post`.
4. O Controller disponibiliza esta lista para a `posts.jsp`.
5. A `posts.jsp` percorre a lista e gera o HTML final para o navegador.

Desenvolvido por Laura Evelyn Neves Oliveira
