/*
  Warnings:

  - You are about to drop the column `studentId` on the `StudentModel` table. All the data in the column will be lost.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_StudentModel" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    "studentNo" TEXT,
    "password" TEXT,
    "createdAT" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "new_StudentModel" ("age", "createdAT", "firstName", "id", "lastName", "password") SELECT "age", "createdAT", "firstName", "id", "lastName", "password" FROM "StudentModel";
DROP TABLE "StudentModel";
ALTER TABLE "new_StudentModel" RENAME TO "StudentModel";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
