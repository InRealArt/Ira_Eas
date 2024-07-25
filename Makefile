.PHONY: deploy

deploySchemaRegistrar:
	@echo "Deploying the SchemaRegistrar contract..."
	forge script script/DeploySchemaRegistrar.s.sol:DeploySchemaRegistrar --broadcast --rpc-url $(RPC_URL) --private-key $(PRIVATE_KEY)

registerSchema: 
	@echo "Register schema..."
	cast call 0xEdDa4460fCCF59420D18fD580738BcAa30d31D02 "allowance(address,address)" 0xB63cE207B985e8508b17B5e8CF3900EF22C4e444 0xa546D99E5DE183CC0057CaeD71D5DFf03580B2c3 --rpc-url $SEPOLIA_RPC_URL
