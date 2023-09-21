import { Router } from "express";
import { enterClass, seeAllStudentClasses } from "../Controller/ClassController";

const router = Router()
router.route("/:studentID/enter-class").post(enterClass)
router.route("/class-name").get(seeAllStudentClasses)


export default router