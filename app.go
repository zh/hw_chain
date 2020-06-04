package hellochain

import (
	abci "github.com/tendermint/tendermint/abci/types"
	"github.com/tendermint/tendermint/libs/log"
	dbm "github.com/tendermint/tm-db"

	"github.com/zh/hw_chain/starter"
)

const appName = "hw_chain"

var (
	ModuleBasics = starter.ModuleBasics
)

type helloChainApp struct {
	*starter.AppStarter
}

func NewHelloChainApp(logger log.Logger, db dbm.DB) abci.Application {

	appStarter := starter.NewAppStarter(appName, logger, db)

	var app = &helloChainApp{
		appStarter,
	}

	app.InitializeStarter()

	return app
}
