const User =require('../models/user');
const Rol =require('../models/rol');
const jwt=require('jsonwebtoken');
const keys=require('../config/keys');
const storage = require('../utils/cloud_storage');


module.exports={

    async getAll(req,res,next)

    {

        try {

          const data= await User.getAll();

          console.log(`Usuarios: ${data} `);

          return res.status(201).json(data);

        } catch (error) {

            console.log(`Error: ${error} `);

            return res.status(501).json(

                {

                    success:false,

                    message:'Error al obtener los usuarios'

                }


            );

        }


    },

    async register(req,res,next){


        try{


            const user=req.body;

            const data= await User.create(user);


            await Rol.create(data.id,1);//le asignamos al usuario el rol por defecto 1 (cliente)


            return res.status(201).json({

                success:true,

                message:"El registro se realizo con Exito, ya puedes Loguearte",

                data:data.id

            });


        }

        catch(error){

            console.log(`Error: ${error} `);

            return res.status(501).json(

                {

                    success:false,

                    message:'Error al Registar el usuario',

                    error:error

                }


            );


        }


    },

    async registerWhithImage(req,res,next){

        try{

            const user=JSON.parse(req.body.user);
            console.log(` Datos usuario : ${user}`);
            const files= req.files;

            if(files.length>0){

                const pathImage=`image_${Date.now}`;
                const url= await storage(files[0],pathImage);
                if(url!= undefined && url !=null){

                    user.image =url;

                }

            }

            const data= await User.create(user);
            await Rol.create(data.id,1);//le asignamos al usuario el rol por defecto 1 (cliente)
            return res.status(201).json({
                success:true,
                message:"El registro se realizo con Exito, ya puedes Loguearte",
                data:data.id
            });

        }
        catch(error){
            console.log(`Error: ${error} `);
            return res.status(501).json(
                {
                    success:false,
                    message:'Error al Registar el usuario',
                    error:error
                }
            );

        }

    },


    async login(req,res,next){

        try {

            const email=req.body.email;

            const password=req.body.password;


            const myUser =await User.findByEmail(email);


            if(!myUser){

                return res.status(401).json({

                    success:false,

                    message:'El usuario no fue encontrado'

                });

            }


            if(User.isPasswordMatched(password,myUser.password)){

                const token=jwt.sign({

                    id:myUser.id,

                    email:myUser.email

                },

                keys.secretOrKey,{

                    // expiresIn:(60*60*24)

                });


                const data={

                    id:myUser.id,

                    username:myUser.username,

                    email:myUser.email,

                    //image:myUser.image,

                    session_token:`JWT ${token}`,
                    roles:myUser.roles

                };


                return res.status(201).json({

                    success:true,

                    data:data,

                    message:'El usuario ha sido autenticado'


                });


            }else{


                return res.status(401).json({

                    success:false,

                    message:'La Contraseña es Incorrecta'

                });


            }






        } catch (error) {

           console.log(`Error: ${error} `);

           return res.status(501).json(

               {

                   success:false,

                   message:'Error al momento de logueo',

                   error:error

               }

           );

        }


    }

};