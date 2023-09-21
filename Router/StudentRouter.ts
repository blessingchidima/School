import { Router } from "express";
import { deleteOneStudent, getOneStudent, registerStudent, signInStudent, updateOneStudent, viewStudents } from "../Controller/StudentController";

const router = Router()
router.route("/create").post(registerStudent)
router.route("/view-students").get(viewStudents)
router.route("/get-one-student/:studentID").get(getOneStudent)
router.route("/update-one-student/:studentID").patch(updateOneStudent)
router.route("/delete-one-student/:studentID").delete(deleteOneStudent)
router.route("/sign-in-student").post(signInStudent)


export default router