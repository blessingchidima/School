import cors from "cors";
import  express,{ Application,Request,Response   } from "express";

export const MainApp=(app:Application)=>{
    app.use(express.json())
    .use(cors())

    .get("/",(res:Response, req:Request)=>{
  return res.status(200).json({
    message:"welcome back"
  })
    })
}

