/*
  Warnings:

  - Added the required column `bucket_id` to the `image` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "image" ADD COLUMN     "bucket_id" TEXT NOT NULL;
