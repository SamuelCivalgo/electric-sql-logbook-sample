-- CreateTable
CREATE TABLE "Project" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "Project_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProjectProperty" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "order" DOUBLE PRECISION NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "ProjectProperty_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProjectPropertyValue" (
    "id" TEXT NOT NULL,
    "value" TEXT NOT NULL,
    "projectId" TEXT NOT NULL,
    "projectPropertyId" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "ProjectPropertyValue_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "ProjectPropertyValue" ADD CONSTRAINT "ProjectPropertyValue_projectId_fkey" FOREIGN KEY ("projectId") REFERENCES "Project"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProjectPropertyValue" ADD CONSTRAINT "ProjectPropertyValue_projectPropertyId_fkey" FOREIGN KEY ("projectPropertyId") REFERENCES "ProjectProperty"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
