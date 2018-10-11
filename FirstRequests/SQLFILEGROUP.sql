use master;
GO
DROP DATABASE test_base;
GO
CREATE DATABASE test_base
ON
PRIMARY
  (NAME = file1,
    FILENAME = 'E:\ALBA\DB2018\filename1.mdf',
    SIZE = 200MB,
    MAXSIZE = 300MB,
    FILEGROWTH = 20MB),
    ( NAME = file2,
    FILENAME = 'E:\ALBA\DB2018test\filename2.ndf',
    SIZE = 100MB,
    MAXSIZE = 200,
    FILEGROWTH = 20),
FILEGROUP FileGroup1
    ( NAME = file3,
    FILENAME = 'E:\ALBA\DB2018\filename3.ndf',
    SIZE = 100MB,
    FILEGROWTH = 10),
FILEGROUP FileGroup2
	(NAME = file4,
	FILENAME = 'E:\ALBA\DB2018\filename4.ndf',
	SIZE = 100MB,
	MAXSIZE = 100MB,
	FILEGROWTH = 0),
FILEGROUP FileGroup3
	(NAME = file5,
	FILENAME = 'E:\ALBA\DB2018\filename5.ndf')
LOG ON
(NAME = TestLog,
	FILENAME = 'E:\ALBA\DB2018\testlog.ldf',
	FILEGROWTH = 15%);
GO
ALTER DATABASE test_base
MODIFY FILEGROUP FileGroup2 DEFAULT
GO