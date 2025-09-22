--1
--способ 1 - distinct
select distinct
	case when col1 < col2 then col1 else col2 end as col1,
	case when col1 < col2 then col2 else col1 end as col2
from InputTbl;

--способ 2 - group by
select
	case when col1 < col2 then col1 else col2 end as col1
	case when col1 < col2 then col2 else col1 end as col2
from InputTbl 
group by
	case when col1 < col2 then col1 else col2 end;
	case when col1 < col2 then col2 else col1 end;

--2
select * 
from TestMultipleZero
where (A <> 0 or A is null)
	or (B <> 0 or B is null)
	or (C <> 0 or C is null)
	or (D <> 0 or D is null);

--3
select * from section1
	where id % 2 = 1;

--4
select Top 1 * from section1
order by id ASC;

--5
select Top 1 * from section1
order by id DESC;

--6
select * from section1
where name like 'B%';

--7
select * from ProductCodes
where Code like '%\_%' escape '\';
