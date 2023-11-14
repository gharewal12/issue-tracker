/*
  Warnings:

  - You are about to drop the column `Decription` on the `Issue` table. All the data in the column will be lost.
  - Added the required column `Description` to the `Issue` table without a default value. This is not possible if the table is not empty.

*/
BEGIN TRY

BEGIN TRAN;

-- AlterTable
ALTER TABLE [dbo].[Issue] DROP COLUMN [Decription];
ALTER TABLE [dbo].[Issue] ADD [Description] NVARCHAR(1000) NOT NULL;

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
