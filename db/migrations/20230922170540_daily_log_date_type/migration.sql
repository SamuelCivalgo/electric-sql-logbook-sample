/*
  Warnings:

  - Changed the type of `date` on the `daily_log` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- AlterTable
-- Manually migrate all dates to be of type DATE

ALTER TABLE "daily_log" ADD COLUMN "date_temp" DATE;
UPDATE "daily_log" SET "date_temp" = "date"::text::DATE;
ALTER TABLE "daily_log" DROP COLUMN "date";
ALTER TABLE "daily_log" RENAME COLUMN "date_temp" TO "date";
ALTER TABLE "daily_log" ALTER COLUMN "date" SET NOT NULL;
