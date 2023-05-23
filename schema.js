const { ApolloServer, gql } = require('apollo-server');
const typeDefs = gql`
  type Customer {
    name: String
    email: String
    password: String
    number: Int
    
    
  }

  type Query {
    getCustomer(id: ID!): Customer
   
  }

  type Mutation {
    createCustomer(input: CustomerInput): Customer
    updateCustomer(id: ID!, input: CustomerInput): Customer
    deleteCustomer(id: ID!): Customer
    
  }

  input CustomerInput {
    name: String
    email: String
    password: String
    
  }
`;


const server = new ApolloServer({ typeDefs });

server.listen().then(({ url }) => {
    console.log(`Servidor GraphQL listo en ${url}`);
  });

  
