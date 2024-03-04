-- CreateTable
CREATE TABLE "User" (
    "idUser" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "telephone" TEXT NOT NULL,
    "profileImg" TEXT NOT NULL,
    "biography" TEXT NOT NULL,
    "birthDate" DATETIME NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'active',
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deletedAt" DATETIME,
    "updatedAt" DATETIME
);

-- CreateTable
CREATE TABLE "ChatRoom" (
    "idChatRoom" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "UserChatRoom" (
    "userId" INTEGER NOT NULL,
    "chatRoomId" INTEGER NOT NULL,

    PRIMARY KEY ("userId", "chatRoomId"),
    CONSTRAINT "UserChatRoom_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("idUser") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "UserChatRoom_chatRoomId_fkey" FOREIGN KEY ("chatRoomId") REFERENCES "ChatRoom" ("idChatRoom") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Message" (
    "idMessage" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "content" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    "senderId" INTEGER NOT NULL,
    "chatRoomId" INTEGER NOT NULL,
    "chatRoomIdChatRoom" INTEGER,
    CONSTRAINT "Message_senderId_fkey" FOREIGN KEY ("senderId") REFERENCES "User" ("idUser") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Message_chatRoomId_fkey" FOREIGN KEY ("chatRoomId") REFERENCES "ChatRoom" ("idChatRoom") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "_UserChatRooms" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,
    CONSTRAINT "_UserChatRooms_A_fkey" FOREIGN KEY ("A") REFERENCES "ChatRoom" ("idChatRoom") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "_UserChatRooms_B_fkey" FOREIGN KEY ("B") REFERENCES "User" ("idUser") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "User_telephone_key" ON "User"("telephone");

-- CreateIndex
CREATE UNIQUE INDEX "_UserChatRooms_AB_unique" ON "_UserChatRooms"("A", "B");

-- CreateIndex
CREATE INDEX "_UserChatRooms_B_index" ON "_UserChatRooms"("B");
