unit Change;

interface

Function Crypt(sInput: string; nPass: word): string;
Function EncryptPassword(const sInput: string): string;
Function DecryptPassword(const sInput: string): string;
Function Encrypt(const s: string; Key: word): string;
function Decrypt(const s: string; Key: word): string;
function GeneratePWDSecutityString: string;
function MakeRNDString(Chars: string; Count: Integer): string;
function EncodePWDEx(Data: string; MinV: Integer = 0; MaxV: Integer = 5): string;
function DecodePWDEx(Data: string): string;

const
     c1 = 52845;
     c2 = 22719;
     Codes64 = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz+/';
     SecurityString='5WCNtuYIr+UH7Bb2';

implementation

function EncodePWDEx(Data :string; MinV: Integer = 0; MaxV: Integer = 5): string;
var
     i, x: Integer;
     s1, s2, ss: string;
begin
     if MinV > MaxV then
     begin
          i := MinV;
          MinV := MaxV;
          MaxV := i;
     end;
     if MinV < 0 then
          MinV := 0;
     if MaxV > 100 then
          MaxV := 100;
     Result := '';
     if Length(SecurityString) < 16 then
          Exit;
     for i := 1 to Length(SecurityString) do
     begin
          s1 := Copy(SecurityString, i + 1, Length(SecurityString));
          if Pos(SecurityString[i], s1) > 0 then
               Exit;
          if Pos(SecurityString[i], Codes64) <= 0 then
               Exit;
     end;
     s1 := Codes64;
     s2 := '';
     for i := 1 to Length(SecurityString) do
     begin
          x := Pos(SecurityString[i], s1);
          if x > 0 then
               s1 := Copy(s1, 1, x - 1) + Copy(s1, x + 1, Length(s1));
     end;
     ss := SecurityString;
     for i := 1 to Length(Data) do
     begin
          s2 := s2 + ss[Ord(Data[i]) mod 16 + 1];
          ss := Copy(ss, Length(ss), 1) + Copy(ss, 1, Length(ss) - 1);
          s2 := s2 + ss[Ord(Data[i]) div 16 + 1];
          ss := Copy(ss, Length(ss), 1) + Copy(ss, 1, Length(ss) - 1);
     end;
     Result := MakeRNDString(s1, Random(MaxV - MinV) + MinV + 1);
     for i := 1 to Length(s2) do
          Result := Result + s2[i] + MakeRNDString(s1, Random(MaxV - MinV) + MinV);
end;

function DecodePWDEx(Data: string): string;
var
     i, x, x2: Integer;
     s1, s2, ss: string;
begin
     Result := #1;
     if Length(SecurityString) < 16 then
          Exit;
     for i := 1 to Length(SecurityString) do
     begin
          s1 := Copy(SecurityString, i + 1, Length(SecurityString));
          if Pos(SecurityString[i], s1) > 0 then
               Exit;
          if Pos(SecurityString[i], Codes64) <= 0 then
               Exit;
     end;
     s1 := Codes64;
     s2 := '';
     ss := SecurityString;
     for i := 1 to Length(Data) do
          if Pos(Data[i], ss) > 0 then
               s2 := s2 + Data[i];
     Data := s2;
     s2 := '';
     if Length(Data) mod 2 <> 0 then
          Exit;
     for i := 0 to Length(Data) div 2 - 1 do
     begin
          x := Pos(Data[i * 2 + 1], ss) - 1;
          if x < 0 then
               Exit;
          ss := Copy(ss, Length(ss), 1) + Copy(ss, 1, Length(ss) - 1);
          x2 := Pos(Data[i * 2 + 2], ss) - 1;
          if x2 < 0 then
               Exit;
          x := x + x2 * 16;
          s2 := s2 + chr(x);
          ss := Copy(ss, Length(ss), 1) + Copy(ss, 1, Length(ss) - 1);
     end;
     Result := s2;
end;

function GeneratePWDSecutityString: string;
var
     i, x: Integer;
     s1, s2: string;
begin
     s1 := Codes64;
     s2 := '';
     for i := 0 to 15 do
     begin
          x := Random(Length(s1));
          x := Length(s1) - x;
          s2 := s2 + s1[x];
          s1 := Copy(s1, 1, x - 1) + Copy(s1, x + 1, Length(s1));
     end;
     Result := s2;
end;

function MakeRNDString(Chars: string; Count: Integer): string;
var
     i, x: Integer;
begin
     Result := '';
     for i := 0 to Count - 1 do
     begin
          x := Length(Chars) - Random(Length(Chars));
          Result := Result + Chars[x];
          Chars := Copy(Chars, 1, x - 1) + Copy(Chars, x + 1, Length(Chars));
     end;
end;

Function Encrypt(const s: string; Key: word): string;
var
     i: byte;
     ResultStr: string;
     Len: Integer;
begin
     Result := s;
     Len := Length(s);
     SetLength(Result, Len);
     for i := 0 to Len do
     begin
          Result[i] := Char(byte(s[i]) xor (Key shr 8));
          Key := (byte(Result[i]) + Key) * c1 + c2
     end;
     Result := Copy(Result, 1, Len);
end;

function Decrypt(const s: string; Key: word): string;
var
     i: byte;
     Len: Integer;
begin
     { Result[0] := s[0]; }
     Result := s;
     SetLength(Result, Len);
     Len := Length(s);
     for i := 0 to Len do
     begin
          Result[i] := Char(byte(s[i]) xor (Key shr 8));
          Key := (byte(s[i]) + Key) * c1 + c2
     end;
     Result := Copy(Result, 1, Len);
end;

Function Crypt(sInput: string; nPass: word): string;
var
     nLen, x, n: word;
     OutPut: String;
     Res: Array of String;
begin
     if sInput = '' then
     begin
          Result := '';
          Exit;
     end;
     nLen := Length(sInput);
     n := nLen;
     SetLength(Res, nLen);
     for x := nLen downto 1 do
     begin
          Res[x] := chr(Ord(sInput[n]) XOR nPass);
          OutPut := OutPut + Res[x];
          dec(n);
     end;
     Result := OutPut;
end;

Function EncryptPassword(const sInput: string): string;
Begin
     EncryptPassword := Encrypt(sInput, 1010);
End;

Function DecryptPassword(const sInput: string): string;
Begin
     DecryptPassword := Decrypt(sInput, 1010);
End;

end.
