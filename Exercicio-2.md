# **1. Modelagem**

#### **Cliente - Referenciar:** O cliente tem dados fixos que não mudam frequentemente, e embutir todos os dados em cada pedido seria redundante e ineficiente.


#### **Entregador - Referenciar:** Dados do entregador são fixos e não precisam ser duplicados em todos os pedidos. O pedido pode referenciar o entregador facilmente.


#### **Pedido - Embutido:** Os dados do produto são frequentemente acessados com o pedido, então é eficiente embutir. Cliente e entregador podem ser referenciados, evitando redundância.


#### **Produto - Embutido:** Dados do produto são fixos e acessados diretamente em cada pedido, então embutir evita buscas adicionais e melhora a performance.

# **2. Consultas**

### Dado para as consulta:

```javascript
db.pedidos.insertOne({
  cliente_id: ObjectId("64b3f"),
  entregador_id: ObjectId("64b3e..."),
  nome:"Carlos Mendes"
  data: ISODate("2024-04-01T00:00:00Z"),
  status: "entregue",
  local: {
    type: "Point",
    coordinates: [-46.6333, -23.5505]
  },
  produtos: [
    { nome: "Pizza Calabresa", preco: 35 },
    { nome: "Coca-Cola 2L", preco: 10 }
  ]
})
```

### Escreva as seguintes consultas:

#### **A** - Retorne todos os pedidos entregues por "Carlos Mendes":

```javascript
db.pedidos.find({ nome_entregador: "Carlos Mendes" });

```

#### **B** - Liste os nomes dos produtos e os totais de vendas (quantidade vendida) agrupados:

```javascript
db.pedidos.aggregate([
  { $unwind: "$produtos" },
  { $group: { _id: "$produtos.nome", total: { $sum: 1 } } }
]);
```

#### **C** - Encontre pedidos entregues perto da coordenada [-46.634, -23.551] com raio de 1 km.

```javascript
db.pedidos.createIndex({ local: "2dsphere" });

db.pedidos.find({
  local: {
    $near: {
      $geometry: { type: "Point", coordinates: [-46.634, -23.551] },
      $maxDistance: 1000
    }
  }
});
```
#### **D** - Retorne todos os pedidos que contenham o item "Pizza Calabresa".

```javascript
db.pedidos.find({ "produtos.nome":"Pizza Calabresa" });
```
#### **E** - Projete apenas o nome do cliente e os nomes dos produtos do pedido.

```javascript
db.pedidos.aggregate({
    $project: { nome_cliente:1, "produtos.nome":1 }
    });
```