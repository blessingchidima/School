import { Request, Response } from "express";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient()

export const enterClass = async(req:Request, res:Response)=>{
    try {
        const {studentID}=req.params

        const {className} =req.body

        const user =await prisma.studentModel.findUnique({
            where: {id:studentID},
            include:{class:true}
        })
        if (user) {
          const classed = await prisma.classModel.create({
            data:{
                className,
                studentID
            }
          }) 
          user.class.push(classed) 
          return res.status(201).json({
            message:"success",
            data:classed
          })
        } else {
            return res.status(404).json({
                message:"no student",
            }) 
        }

    } catch (error:any) {
        return res.status(404).json({
            message:"error",
            data:error.message
        })
    }
}

export const seeAllStudentClasses =async(req:Request, res:Response)=>{
    try {
        const {className} = req.body
        const classed = await prisma.classModel.findMany({
            where:{className:className}
        })
        return res.status(404).json({
            message:"success",
            data:classed
        })
    } catch (error:any) {
        return res.status(404).json({
            message:"error",
            data:error.message
        })
    }
}