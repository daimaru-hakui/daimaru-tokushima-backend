-- CreateEnum
CREATE TYPE "Role" AS ENUM ('USER', 'SALES', 'RD', 'LOGISTICS', 'ACCOUNTING', 'TOKUSHIMA', 'WILLFIT', 'ADMIN');

-- CreateEnum
CREATE TYPE "OrderType" AS ENUM ('REPAIRE', 'MARK');

-- CreateEnum
CREATE TYPE "NewOrPrevious" AS ENUM ('NEW', 'PREVIOUS');

-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "email" TEXT NOT NULL,
    "hashedPassword" TEXT NOT NULL,
    "nickName" TEXT,
    "role" "Role" DEFAULT 'USER',

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Task" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT,
    "userId" INTEGER NOT NULL,

    CONSTRAINT "Task_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Todo" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,

    CONSTRAINT "Todo_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Repaire" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "factory" TEXT NOT NULL,
    "deleveryPlace" TEXT NOT NULL,
    "deadline" TIMESTAMP(3) NOT NULL,
    "client" TEXT NOT NULL,
    "price" INTEGER NOT NULL,
    "orderType" "OrderType" NOT NULL DEFAULT 'REPAIRE',
    "newOrPrevious" "NewOrPrevious" NOT NULL DEFAULT 'PREVIOUS',
    "userId" INTEGER NOT NULL,

    CONSTRAINT "Repaire_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RepaireDetail" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "repaireId" INTEGER,
    "productNumber" TEXT,
    "size" TEXT,
    "quantity" INTEGER,
    "comment" TEXT,

    CONSTRAINT "RepaireDetail_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RepaireTemplate" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "factory" TEXT,
    "deleveryPlace" TEXT,
    "client" TEXT,
    "price" INTEGER NOT NULL,
    "orderType" "OrderType" NOT NULL DEFAULT 'REPAIRE',
    "newOrPrevious" "NewOrPrevious" NOT NULL,

    CONSTRAINT "RepaireTemplate_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- AddForeignKey
ALTER TABLE "Task" ADD CONSTRAINT "Task_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Repaire" ADD CONSTRAINT "Repaire_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RepaireDetail" ADD CONSTRAINT "RepaireDetail_repaireId_fkey" FOREIGN KEY ("repaireId") REFERENCES "Repaire"("id") ON DELETE SET NULL ON UPDATE CASCADE;
