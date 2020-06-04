package main

import (
	"github.com/tendermint/tendermint/libs/cli"

	app "github.com/zh/hw_chain"
	"github.com/zh/hw_chain/starter"
)

func main() {

	params := starter.NewServerCommandParams(
		"hwd",
		"hw_chain AppDaemon",
		starter.NewAppCreator(app.NewHelloChainApp),
		starter.NewAppExporter(app.NewHelloChainApp),
	)

	serverCmd := starter.NewServerCommand(params)

	// prepare and add flags
	executor := cli.PrepareBaseCmd(serverCmd, "HW", starter.DefaultNodeHome)
	err := executor.Execute()
	if err != nil {
		panic(err)
	}
}
