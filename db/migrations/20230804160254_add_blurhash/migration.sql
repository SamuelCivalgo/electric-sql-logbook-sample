/*
  Warnings:

  - Added the required column `blurhash` to the `image` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "image" ADD COLUMN     "blurhash" TEXT NOT NULL;
