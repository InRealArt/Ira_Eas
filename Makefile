#!make
include .env
export $(shell sed 's/=.*//' .env)

IRA_SCHEMA_REGISTRY_ADDRESS=0xC8847Bae1Dd2Aa418990fB7f73Bb6379A73Ff46A
IRA_RESOLVER_ADDRESS=0x13b85781B0773f6f43628cFcc83DD9d105f6C4B9

.PHONY: deploy

test : 
	env

deployResolver:
	@echo "Deploying the IraResolver contract..."
	forge script script/DeployIraResolver.s.sol:DeployIraResolver --broadcast --fork-url $(RPC_URL) --private-key $(PRIVATE_KEY) --legacy


deploySchemaRegistrar:
	@echo "Deploying the SchemaRegistrar contract..."
	forge script script/DeployIraSchemaRegistrar.s.sol:DeployIraSchemaRegistrar --broadcast --fork-url $(RPC_URL) --private-key $(PRIVATE_KEY) --legacy

registerSchema: 
	@echo "Register schema..."
	cast send $(IRA_SCHEMA_REGISTRY_ADDRESS) "register(string,address,bool)" "string IraCertificate" $(IRA_RESOLVER_ADDRESS) true --rpc-url $(RPC_URL) --private-key $(PRIVATE_KEY) --legacy
