const userController = require('../controllers/userController');

const UserController =require('../controllers/userController');


module.exports=(app, upload)=>{

    //peticiones de consulta

    app.get('/api/users/getAll',UserController.getAll);


    //peticiones de insercion
    app.post('/api/users/create',upload.array('image',1), UserController.registerWhithImage);
    app.post('/api/users/login',userController.login);


};