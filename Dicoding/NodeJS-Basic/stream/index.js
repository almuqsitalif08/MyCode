const fs = require('fs');
const path = require('path');

const writableStream = fs.createWriteStream(path.resolve(__dirname, 'output.txt'));

const readableStream = fs.createReadStream(path.resolve(__dirname, 'input.txt'), {
    highWaterMark: 15
});

readableStream.on('readable', () => {
    try{
        writableStream.write(`${readableStream.read()}\n`)
        console.log('Write is done');
    } catch(error){
        console.log("error nih");
        console.log(error.message);
    }
})