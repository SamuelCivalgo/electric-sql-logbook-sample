/*
  Warnings:

  - Changed the type of `order` on the `projectProperties` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `order` on the `taskProperties` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- AlterTable
ALTER TABLE "projectProperties" DROP COLUMN "order",
ADD COLUMN     "order" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "taskProperties" DROP COLUMN "order",
ADD COLUMN     "order" INTEGER NOT NULL;
