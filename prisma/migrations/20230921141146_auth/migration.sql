/*
  Warnings:

  - Added the required column `password` to the `StudentModel` table without a default value. This is not possible if the table is not empty.
  - Added the required column `studentNo` to the `StudentModel` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_StudentModel" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    "studentNo" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "createdAT" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "new_StudentModel" ("age", "createdAT", "firstName", "id", "lastName") SELECT "age", "createdAT", "firstName", "id", "lastName" FROM "StudentModel";
DROP TABLE "StudentModel";
ALTER TABLE "new_StudentModel" RENAME TO "StudentModel";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
