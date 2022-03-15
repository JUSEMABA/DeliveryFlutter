const express=require('express');
const app =express();
const http =require('http');
const server = http.createServer(app);
const logger = require('morgan');
const cors =require('cors');

const port =process.env.PORT || 3000;

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({
    extended:true
}));
app.use(cors());


app.disable('x-powered-by');

app.set('port',port);
server.listen(3000, '192.168.1.24'||'localhost',function(){
    console.log('Aplicacion NodeJS id=>'+process.pid+' puerto =>'+port+' iniciado....');}

);

app.get('/',(req,res)=>{

    res.send('Ruta Raiz del Backed');

});


app.get('/una',(req,res)=>{

    res.send('Ruta una del Backed');

});



app.use((err,req,res,next)=>{

    console.log(err);

    res.status(err.status || 500).send(err.stack);

});