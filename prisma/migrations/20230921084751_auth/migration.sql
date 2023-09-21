/*
  Warnings:

  - You are about to drop the `AuthModel` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "AuthModel";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "authModel" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "student" TEXT NOT NULL,
    "createdAT" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CreateTable
CREATE TABLE "classModel" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "className" TEXT NOT NULL,
    "studentID" TEXT NOT NULL,
    "createdAT" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "classModel_studentID_fkey" FOREIGN KEY ("studentID") REFERENCES "authModel" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
