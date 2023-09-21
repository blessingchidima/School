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
INSERT INTO "new_StudentModel" ("age", "createdAT", "firstName", "id", "lastName", "password", "studentNo") SELECT "age", "createdAT", "firstName", "id", "lastName", "password", "studentNo" FROM "StudentModel";
DROP TABLE "StudentModel";
ALTER TABLE "new_StudentModel" RENAME TO "StudentModel";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
