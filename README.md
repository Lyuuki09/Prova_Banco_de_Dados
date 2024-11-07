# Avaliação Bando de Dados

### Prova Prática de Banco de Dados

### Instruções Gerais:

1. **Tema Livre**: Escolha um tema que possibilite a criação de um banco de dados com pelo menos três tabelas relacionadas. Exemplo: sistema de gerenciamento escolar, controle de estoque de loja, sistema de biblioteca, entre outros.
2. **Estrutura de Tabelas**: Defina e crie a estrutura das tabelas com chaves primárias e estrangeiras, assegurando a integridade referencial dos dados.
3. **Inserção de Dados**: Insira um conjunto mínimo de dados para cada tabela para possibilitar testes.

---

### Requisitos de Implementação

Para cada função solicitada, descreva como você a aplicou e onde ela se encaixa no contexto do tema escolhido.

### 1. **Views**

- Crie pelo menos **uma view** que retorne informações específicas de diferentes tabelas do seu banco de dados. Essa view deve simplificar uma consulta complexa e ser útil para o contexto do tema escolhido.

### 2. **Subqueries**

- Utilize **subqueries** para realizar consultas que retornem dados específicos, como filtragem baseada em resultados de outras tabelas ou cálculos específicos.

### 3. **CTEs (Common Table Expressions)**

- Crie pelo menos **uma CTE** para simplificar uma consulta. Ela pode ser usada, por exemplo, para calcular totais, percentuais ou qualquer dado intermediário que seja utilizado em consultas mais complexas.

### 4. **Window Functions**

- Utilize **funções de janela (Window Functions)** para calcular métricas como somas acumulativas, classificações (ranking), ou médias móveis em um contexto adequado.

### 5. **Functions**

- Crie pelo menos **uma função (Function)** que realize um cálculo ou operação específica no banco de dados. Essa função pode ser usada para transformar dados ou realizar cálculos personalizados.

### 6. **Loops**

- Utilize **loops** para realizar operações repetitivas, como inserir registros, atualizar uma série de dados, ou qualquer outra operação em lotes que seja relevante ao tema.

### 7. **Procedures**

- Crie pelo menos **uma stored procedure** que encapsule uma operação completa, como inserção de múltiplos dados ou atualização de registros. A procedure deve ser parametrizada para aumentar a reutilização.

### 8. **Triggers**

- Crie pelo menos **um trigger** para executar uma operação automaticamente em resposta a eventos como inserções, atualizações ou deleções de registros.

---

### Critérios de Avaliação (100 pontos)

### 1. **Estrutura do Banco de Dados** (20 pontos)

- **Definição das Tabelas e Relacionamentos** (10 pontos): Estrutura de tabelas bem organizada com chaves primárias e estrangeiras adequadas e com integridade referencial.
- **Inserção de Dados** (10 pontos): Conjunto mínimo de dados inseridos de maneira coerente, permitindo a execução e validação de consultas e demais funcionalidades.

### 2. **Implementação das Funcionalidades** (60 pontos)

- **Views** (8 pontos): View criada de maneira funcional e com utilidade clara no contexto do tema escolhido.
- **Subqueries** (8 pontos): Subquery usada adequadamente, simplificando ou agregando valor em consultas complexas.
- **CTEs (Common Table Expressions)** (8 pontos): CTE implementada de forma prática e funcional, com uma justificativa de sua utilidade na consulta.
- **Window Functions** (8 pontos): Função de janela aplicada corretamente, com uma aplicação prática relevante ao tema.
- **Functions** (8 pontos): Função criada de maneira correta e útil, aplicando uma transformação ou cálculo relevante.
- **Loops** (8 pontos): Uso apropriado de loop para uma operação repetitiva e relevante ao tema.
- **Procedures** (8 pontos): Stored procedure implementada corretamente, com parâmetros e lógica de execução eficiente.
- **Triggers** (8 pontos): Trigger implementado de forma funcional, acionando uma operação adequada e com propósito no tema.

### 3. **Criatividade e Coerência do Tema** (10 pontos)

- **Originalidade** (5 pontos): Criatividade na escolha do tema, com foco em um sistema realista que aproveite bem as funcionalidades requisitadas.
- **Aplicação Prática dos Requisitos** (5 pontos): Alinhamento do tema com as funcionalidades implementadas, facilitando a aplicação dos conceitos no contexto proposto.

### 4. **Documentação e Comentários** (10 pontos)

- **Descrição das Funcionalidades** (5 pontos): Explicação breve e clara para cada funcionalidade implementada, descrevendo seu propósito e como ela atende ao tema.
- **Clareza e Organização dos Comentários** (5 pontos): Comentários no código SQL que ajudam a entender a lógica, com uma organização que facilita a leitura e avaliação do projeto.

### Pontuação Final

A nota final será dada pela soma dos pontos, conforme o desempenho em cada critério listado acima, totalizando **100 pontos**.
