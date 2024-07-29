## InRealArt Ethereum Attestation Service

## Tests

Execute the command : 

```sh
source .env
```

Then :

```sh
forge test --fork-url $RPC_URL
```

### Register a Schema

Execute the command : 

```sh
make registerSchema
```

## Deployments


### Deploy a custom resolver 

Execute the command : 

```sh
make deployResolver
```

### Deploy a custom registry

Execute the command : 

```sh
make deploySchemaRegistrar
```

All the addresses below are using the official addresses of EAS.<br>
`@ethereum-attestation-service/eas-contracts/deployments` 


### Testnets

#### Ethereum

- **Resolver**:
  - Contract: [0x13b85781B0773f6f43628cFcc83DD9d105f6C4B9](https://sepolia.etherscan.io/address/0x13b85781B0773f6f43628cFcc83DD9d105f6C4B9)
  - Deployment and ABI:
- **SchemaRegistry**:
  - Contract: [0xC8847Bae1Dd2Aa418990fB7f73Bb6379A73Ff46A](https://sepolia.etherscan.io/address/0xC8847Bae1Dd2Aa418990fB7f73Bb6379A73Ff46A)
  - Deployment and ABI:

### Mainnets

#### Ethereum

- **Resolver**:
  - Contract: 
  - Deployment and ABI:
- **SchemaRegistry**:
  - Contract:
  - Deployment and ABI:
