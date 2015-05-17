

CREATE TABLE `inspection_flag` (
  `inspectionid` int(11) NOT NULL,
  `rats` tinyint(1) DEFAULT '0',
  `bugs` tinyint(1) DEFAULT '0',
  `slime` tinyint(1) DEFAULT '0',
  `condemned` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`inspectionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into inspection_flag select distinct id, 0, 0, 0, 0 from inspection;


update inspection_flag 
join (
select ins.id from inspection ins
join violation vio
on vio.inspectionid = ins.id
where comments like '%obser%roden%') s on inspection_flag.inspectionid = s.id
set rats = 1;

update inspection_flag 
join (
select ins.id from inspection ins
join violation vio
on vio.inspectionid = ins.id
where comments like '%obser%roach%'
or comments like '%obser%flies%'
or comments like '%obser%gnats%') s on inspection_flag.inspectionid = s.id
set bugs = 1;


update inspection_flag 
join (
select ins.id from inspection ins
join violation vio
on vio.inspectionid = ins.id
where comments like '%slime%') s on inspection_flag.inspectionid = s.id
set slime = 1;



update inspection_flag 
join (
select ins.id from inspection ins
join violation vio
on vio.inspectionid = ins.id
where comments like '%condemned%') s on inspection_flag.inspectionid = s.id
set condemned = 1 ;

