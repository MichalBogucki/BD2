/****** WF ******/
--1) logowanie do systemu
SELECT 	* FROM UserLogin ul
WHERE ul.Login = 'test'
AND ul.Password = 'test123'

--2) rejestracja nowego uzytkownika
SET IDENTITY_INSERT dbo.UserLogin ON
INSERT INTO dbo.UserLogin (LoginId, Login, Password, PermissionId, PhoneNumber, Email, PESEL) 
VALUES (12, 'test2', '2test123', 1, '777888999', '2test@test.pl','545678909')
SET IDENTITY_INSERT dbo.UserLogin OFF

--3) modyfikacja danych
UPDATE [dbo].[UserLogin]
   SET [Login] = 'test27'
      ,[Password] = '27test123'
      --,[PermissionId] = 2
      --,[PhoneNumber] = '222888999'
      --,[Email] = '2test@test'
      --,[PESEL] = '5455678909'
 WHERE LoginId = 12

--4) wyszukiwanie kar
SELECT
	f.FineAmountWithInterests
   ,f.WritingDate
   ,pas.Name
   ,pas.Surname
   ,pas.PESEL
   ,pay.PaymentStatus
FROM Fine f
JOIN meta.PaymentStatus pay
	ON f.PaymentStatusId = pay.PaymentStatusId
JOIN dbo.Passenger pas
	ON f.PassengerId = pas.PassengerId
WHERE pas.PESEL = '622722752'

--5) zg³oszenie za¿alenia
SELECT c.*, cs.ComplaintStatus FROM Complaint c
JOIN meta.ComplaintStatus cs ON c.ComplaintStatusId = cs.ComplaintStatusId
WHERE c.ComplaintId = 101

SET IDENTITY_INSERT dbo.Complaint ON
INSERT INTO dbo.Complaint 
(ComplaintId,TicketCollectorId, PassengerId, Justification, ArrivalDate, ComplaintStatusId) 
VALUES (101, NULL, NULL, 'Testowe zazalenie', SYSDATETIME(), 1)
SET IDENTITY_INSERT dbo.Complaint OFF
--6) mo¿liwoœæ op³aty kar z poziomu systemu

--7) Powiadomienie KRD po przekroczeniu terminu zap³aty
SELECT ps.PaymentStatus,f.* FROM Fine f
JOIN meta.PaymentStatus ps ON f.PaymentStatusId = ps.PaymentStatusId
WHERE ps.PaymentStatus LIKE 'over%'

--8) Prosba o wypisasnie z KRD po uiszczeniu oplaty
SELECT ps.PaymentStatus,f.* FROM Fine f
JOIN meta.PaymentStatus ps ON f.PaymentStatusId = ps.PaymentStatusId
WHERE ps.PaymentStatus LIKE 'accept%'

--9) generowanie Harmonogramu
SELECT cs.ControlScheduleId, r.RegionName, mot.TransportName,cs.Month  FROM ControlSchedule cs
JOIN meta.Region r ON cs.RegionId = r.RegionId
JOIN meta.MeanOfTansport mot ON cs.MeanOfTransportId = mot.MeanOfTransportId


--10) wyp³ata pensji pracownikom
SELECT
	f.TicketCollectorId
   ,COUNT(f.WritingDate) AS FineCount
   ,ct.FineQuota
FROM Fine f
JOIN dbo.TicketCollector tc ON f.TicketCollectorId = tc.TicketCollectorId
JOIN meta.ContractType ct ON ct.ContractTypeId = tc.ContractTypeId
GROUP BY f.TicketCollectorId, ct.FineQuota
ORDER BY FineCount DESC
----
SELECT * FROM Payroll p


--11) zmiana statusu pracownika
SELECT * FROM TicketCollector tc

/********** NWF ***********/
--1) uwierzytelnienie uzytkownika
--2) autoryzacja uzytkownika
--3) ochrona przed atakami
--4) zapewnienie ochrony wrazliwych danych
--5) backup
--6) walidacja
SET IDENTITY_INSERT dbo.payroll ON
INSERT INTO dbo.payroll 
(PayrollId,TicketCollectorId, TotalGrossSalary, Bonus, Year, Month) 
VALUES (102, 7, 11, 11, 1590, 13)
SET IDENTITY_INSERT dbo.payroll OFF

SELECT * FROM Payroll p ORDER BY p.PayrollId desc

--7) wydajne dzia³anie systemu
--8) intuicyjny interfejs graficzny