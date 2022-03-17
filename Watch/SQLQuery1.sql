select A.*, dbo.getProductName(2) as PNamee, '2' as PIDD, PData.Name,PData.Extention
from tblProducts A
cross apply(
select top 1 B.Name, Extention from tblProductImages B where B.PID=A.PID
) PData
where A.PID=20