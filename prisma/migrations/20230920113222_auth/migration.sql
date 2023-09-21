-- CreateTable
CREATE TABLE "AuthModel" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "userName" TEXT NOT NULL,
    "Email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "verified" BOOLEAN NOT NULL DEFAULT false,
    "avater" TEXT NOT NULL,
    "avaterID" TEXT,
    "token" TEXT
);
