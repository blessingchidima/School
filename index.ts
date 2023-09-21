import express, { Application,Request,Response } from "express"
import cors from "cors"
import { MainApp } from "./MainApp";
import student from "./Router/StudentRouter";
import classname from "./Router/ClassRouter";


const port:number=9986;
const app:Application=express()
MainApp(app)
app.set("view engine","ejs")
app.use(cors())
app.use(express.json())

app.use("/api",student)
app.use("/api", classname )


app.get("/", (req:Request,res:Response)=>{
    try {
        return res.status(200).json({
            message:"awesome",
        })
    } catch (error:any) {
        console.log("error from  index")
    }
})
app.listen(port,()=>{
    console.log("")
    console.log("server is runing already",port)
})