
module.exports = {
  networks: {
      development : {
        host: 'localhost',
        port: 7545,                 // Ganache's port
        network_id : '*',           // Id net to which we connect. * match against any net
        gas: 5000000                // Gas limit / transaction
      }
  },
  compilers: {      // Necessary to specify if you require a specific solc version. By default it's 0.5.16
      solc: {
          version: "0.8.6"
      }
  }
}