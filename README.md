## **TF - Matéria: Banco de Dados - Professor Gustavo**
Atividade prática desenvolvida para a matéria de Banco de Dados, onde realizamos operações de inserção, consulta, atualização e exclusão de dados em MongoDB. A atividade incluiu o uso de comandos como insertMany, find, updateOne e deleteOne, com foco na manipulação de coleções de clientes, processos e eventos.

# 1. Modelagem

* Cliente
* Entregador
* Pedido
* Produto

#### **Cliente - Referenciar:** O cliente tem dados fixos que não mudam frequentemente, e embutir todos os dados em cada pedido seria redundante e ineficiente.


#### **Entregador - Referenciar:** Dados do entregador são fixos e não precisam ser duplicados em todos os pedidos. O pedido pode referenciar o entregador facilmente.


#### **Pedido - Embutido:** Os dados do produto são frequentemente acessados com o pedido, então é eficiente embutir. Cliente e entregador podem ser referenciados, evitando redundância.


#### **Produto - Embutido:** Dados do produto são fixos e acessados diretamente em cada pedido, então embutir evita buscas adicionais e melhora a performance.
