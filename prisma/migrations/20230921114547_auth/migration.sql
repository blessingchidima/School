/*
  Warnings:

  - You are about to drop the column `student` on the `StudentModel` table. All the data in the column will be lost.
  - Added the required column `age` to the `StudentModel` table without a default value. This is not possible if the table is not empty.
  - Added the required column `firstName` to the `StudentModel` table without a default value. This is not possible if the table is not empty.
  - Added the required column `lastName` to the `StudentModel` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_StudentModel" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    "createdAT" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "new_StudentModel" ("createdAT", "id") SELECT "createdAT", "id" FROM "StudentModel";
DROP TABLE "StudentModel";
ALTER TABLE "new_StudentModel" RENAME TO "StudentModel";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
