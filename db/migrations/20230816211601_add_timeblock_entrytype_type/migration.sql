/*
  - Alter the type of the "entry_type" column in the "time_block" table to be of type "TimeBlockEntryType".
  - Copy to temp column, then drop the original column, then rename the temp column.
*/
-- CreateEnum
CREATE TYPE "TimeBlockEntryType" AS ENUM ('range', 'timer', 'duration');

ALTER TABLE "time_block" ADD COLUMN "entry_type_temp" "TimeBlockEntryType";
UPDATE "time_block" SET "entry_type_temp" = "entry_type"::text::"TimeBlockEntryType";
ALTER TABLE "time_block" DROP COLUMN "entry_type";
ALTER TABLE "time_block" RENAME COLUMN "entry_type_temp" TO "entry_type";
ALTER TABLE "time_block" ALTER COLUMN "entry_type" SET NOT NULL;
