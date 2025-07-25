-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Client" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "cpf" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "isEmailVerified" BOOLEAN NOT NULL DEFAULT false,
    "phone" TEXT NOT NULL,
    "birthDate" DATETIME NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'ACTIVE',
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);
INSERT INTO "new_Client" ("birthDate", "cpf", "createdAt", "email", "id", "name", "phone", "status", "updatedAt") SELECT "birthDate", "cpf", "createdAt", "email", "id", "name", "phone", "status", "updatedAt" FROM "Client";
DROP TABLE "Client";
ALTER TABLE "new_Client" RENAME TO "Client";
CREATE UNIQUE INDEX "Client_cpf_key" ON "Client"("cpf");
CREATE UNIQUE INDEX "Client_email_key" ON "Client"("email");
CREATE UNIQUE INDEX "Client_phone_key" ON "Client"("phone");
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
