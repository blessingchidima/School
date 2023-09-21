/*
  Warnings:

  - You are about to drop the column `Email` on the `AuthModel` table. All the data in the column will be lost.
  - Added the required column `email` to the `AuthModel` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_AuthModel" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "userName" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "verified" BOOLEAN NOT NULL DEFAULT false,
    "avater" TEXT NOT NULL,
    "avaterID" TEXT,
    "token" TEXT
);
INSERT INTO "new_AuthModel" ("avater", "avaterID", "id", "password", "token", "userName", "verified") SELECT "avater", "avaterID", "id", "password", "token", "userName", "verified" FROM "AuthModel";
DROP TABLE "AuthModel";
ALTER TABLE "new_AuthModel" RENAME TO "AuthModel";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
