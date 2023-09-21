/*
  Warnings:

  - You are about to drop the `authModel` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "authModel";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "StudentModel" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "student" TEXT NOT NULL,
    "createdAT" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_classModel" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "className" TEXT NOT NULL,
    "studentID" TEXT NOT NULL,
    "createdAT" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "classModel_studentID_fkey" FOREIGN KEY ("studentID") REFERENCES "StudentModel" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "new_classModel" ("className", "createdAT", "id", "studentID") SELECT "className", "createdAT", "id", "studentID" FROM "classModel";
DROP TABLE "classModel";
ALTER TABLE "new_classModel" RENAME TO "classModel";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
