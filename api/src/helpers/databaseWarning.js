const dropDatabase = require("./sync")
const readline = require("node:readline")

const MESSAGE = "You have 5 seconds to stop this operation"
const databaseWarning = () => {
    const rl = readline.createInterface({
        input:process.stdin,
        output:process.stdout
    })

  const timer = setTimeout(() => {
    console.log(MESSAGE);
    dropDatabase()
   }, 5000);

   rl.question("Type 'stop' within 5 seconds to cancel: ", (input) => {
   if(input.toLowerCase() === 'stop') {
    clearTimeout(timer) 
    console.log("Database sync operation cancelled");  
    }else {
        console.log("Invalid input, proceeding with the operation...");
    }
    rl.close()
   })


}

module.exports = databaseWarning