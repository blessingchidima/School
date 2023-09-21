import { Request, Response } from "express";
import { PrismaClient } from "@prisma/client";


const prisma = new PrismaClient()

export const registerStudent = async(req: Request, res: Response)=>{
    try {
        const {firstName, lastName, age,  } = req.body
        const pass = "CODELABSTUDENT".toString()
        
        const get2Names = firstName.substring(0, 2).toUpperCase() + lastName.substring(0,1).toUpperCase()
        const addNo =   get2Names + Math.floor(Math.random() * 10).toString()

        console.log(addNo)
        const user = await prisma.studentModel.create({
            data:{
                firstName, lastName, age,   password:pass, studentNo: addNo
                
                 
            },
            include:{class:true}
        })
        return res.status(201).json({
            message:"success",
            data: user
        })
    } catch (error:any) {
        return res.status(404).json({
            message:"error",
            data:error.message
        })
    }
}

export const viewStudents =async(req:Request, res:Response)=>{
    try {
        const students = await prisma.studentModel.findMany({
            include:{class:true}
        })
        return res.status(200).json({
            message:"success",
            data: students
        })
    } catch (error:any) {
        return res.status(404).json({
            message:"error",
            data:error.message
        })
    }
}

export const getOneStudent = async(req:Request, res:Response)=>{
    try {
        const {studentID} = req.params

        const oneStudent = await prisma.studentModel.findUnique({
            where:{
                id: studentID
            }
        })

        return res.status(200).json({
            message : "success",
            data: oneStudent
        })
        
    } catch (error) {
        return res.status(404).json({
            message: "user not found",
            data: error
        })
        
    }
}

export const updateOneStudent = async(req:Request, res:Response)=>{
    try {
        const {studentID} = req.params
        const {firstName, lastName} = req.body
        const updateStudent = await prisma.studentModel.update({
            where:{
                id: studentID
            },
            data:{
                firstName,  lastName

            }
        })

         return res.status(200).json({
            message: "success",
            data: updateStudent
         })
        
    } catch (error) {
        return res.status(404).json({
            message: "error occured updating student details",
            data: error
        })
        
    }
}

export const deleteOneStudent = async(req:Request, res:Response)=>{
    try {
        const {studentID} = req.params
        const deleteStudent = await prisma.studentModel.delete({
            where:{
                id:studentID
            }
        })
        return res.status(200).json({
            message: "student deleted",
            data: deleteStudent
        })
    } catch (error) {
        return res.status(404).json({
            message: "error occured",
            data: error
        })
        
    }
}

export const signInStudent = async(req:Request, res:Response)=>{
    try {
        const {studentNo, password} = req.body
        
        const student_signin = await prisma.studentModel.findFirst({
            where:{
                studentNo
            }
        })
        if(student_signin!){
            const getPassword =  student_signin.password
            if(getPassword === password){
                return res.status(200).json({
                    message: "student successfully login",
                    data: student_signin.id
                })
            }else{
                return res.status(404).json({
                    message: "password not correct"
                })
            }

        }else{
            return res.status(404).json({
                message: "student id not found"
            })
        }
    } catch (error) {
        return res.status(404).json({
            message: "user not found"
        })
    }
}