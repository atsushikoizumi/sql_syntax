USE [AVG01]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[testdata01](
	[id] [int] NOT NULL PRIMARY KEY,
	[Name1] [varchar](256) NOT NULL,
    [Name2] [varchar](256) NOT NULL,
    [Name3] [varchar](256) NOT NULL,
    [Name4] [varchar](256) NOT NULL,
    [Name5] [varchar](256) NOT NULL,
    [Name6] [varchar](256) NOT NULL,
    [Name7] [varchar](256) NOT NULL,
    [Name8] [varchar](256) NOT NULL,
    [Name9] [varchar](256) NOT NULL,
    [Name10] [varchar](256) NOT NULL,
	[Name11] [varchar](256) NOT NULL,
    [Name12] [varchar](256) NOT NULL,
    [Name13] [varchar](256) NOT NULL,
    [Name14] [varchar](256) NOT NULL,
    [Name15] [varchar](256) NOT NULL,
    [Name16] [varchar](256) NOT NULL,
    [Name17] [varchar](256) NOT NULL,
    [Name18] [varchar](256) NOT NULL,
    [Name19] [varchar](256) NOT NULL,
    [Name20] [varchar](256) NOT NULL,
	[Name21] [varchar](256) NOT NULL,
    [Name22] [varchar](256) NOT NULL,
    [Name23] [varchar](256) NOT NULL,
    [Name24] [varchar](256) NOT NULL,
    [Name25] [varchar](256) NOT NULL,
    [Name26] [varchar](256) NOT NULL,
    [Name27] [varchar](256) NOT NULL,
    [Name28] [varchar](256) NOT NULL,
    [Name29] [varchar](256) NOT NULL,
    [Name30] [varchar](256) NOT NULL,
	[Name31] [varchar](256) NOT NULL,
    [Name32] [varchar](256) NOT NULL,
    [Name33] [varchar](256) NOT NULL,
    [Name34] [varchar](256) NOT NULL,
    [Name35] [varchar](256) NOT NULL,
    [Name36] [varchar](256) NOT NULL,
    [Name37] [varchar](256) NOT NULL,
    [Name38] [varchar](256) NOT NULL,
    [Name39] [varchar](256) NOT NULL,
    [Name40] [varchar](256) NOT NULL
    )
GO

/*
    ※1テーブルに5,000万件レコード以上はパフォーマンスの低下を招く。
    ※並列処理はスペックが低い場合は止めた方が良い。
    records       data       time
    1,000,000     10GB       1m37s
    5,000,000     50GB       6m26s
    10,000,000    100GB      12m29s
*/

DECLARE @insertNumber Bigint    -- INSERTする行数
SELECT @insertNumber=10000000;

WITH Base AS
  (
    SELECT
      1 AS n
    UNION ALL
    SELECT 
      n + 1
    FROM
      Base
    WHERE
      n < @insertNumber
  ),
  Nums AS
  (
     SELECT
       Row_Number() OVER(ORDER BY n) AS n
     FROM
       Base
  )
  
  INSERT INTO [dbo].[testdata01]
  SELECT
      n
    , 'abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890'
    , 'abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890'
    , 'abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890'
    , 'abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890'
    , 'abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890'
    , 'abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890'
    , 'abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890'
    , 'abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890'
    , 'abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890'
    , 'abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890'
    , 'abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890'
    , 'abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890'
    , 'abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890'
    , 'abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890'
    , 'abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890'
    , 'abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890'
    , 'abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890'
    , 'abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890'
    , 'abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890'
    , 'abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890'
    , 'abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890'
    , 'abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890'
    , 'abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890'
    , 'abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890'
    , 'abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890'
    , 'abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890'
    , 'abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890'
    , 'abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890'
    , 'abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890'
    , 'abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890'
    , 'abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890'
    , 'abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890'
    , 'abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890'
    , 'abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890'
    , 'abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890'
    , 'abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890'
    , 'abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890'
    , 'abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890'
    , 'abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890'
    , 'abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890abcdefghijklmnopqrstuvwx1234567890'
  FROM
    Nums
  WHERE 
    n <= @insertNumber

OPTION (MaxRecursion 0); -- 再帰SQLの再帰回数の上限を無制限にする
