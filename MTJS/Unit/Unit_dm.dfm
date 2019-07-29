object DM: TDM
  OldCreateOrder = False
  Height = 150
  Width = 215
  object DB: TDatabase
    AliasName = 'orahospital'
    DatabaseName = 'orcl'
    LoginPrompt = False
    Params.Strings = (
      'DATABASE NAME='
      'USER NAME=mtjs'
      'ODBC DSN=orahospital'
      'OPEN MODE=READ/WRITE'
      'SCHEMA CACHE SIZE=8'
      'SQLQRYMODE='
      'LANGDRIVER='
      'SQLPASSTHRU MODE=SHARED AUTOCOMMIT'
      'SCHEMA CACHE TIME=-1'
      'MAX ROWS=-1'
      'BATCH COUNT=200'
      'ENABLE SCHEMA CACHE=FALSE'
      'SCHEMA CACHE DIR='
      'ENABLE BCD=FALSE'
      'ROWSET SIZE=20'
      'BLOBS TO CACHE=64'
      'PASSWORD=mtjs')
    SessionName = 'Default'
    Left = 88
    Top = 40
  end
end
