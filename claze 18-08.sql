-- funciones de agrupacion

-- precio de libro mas caro
select max(price) from  titles; -- 22.95

-- precio del libro mas barato
select min(price) from titles; -- 2.99

-- cantidad de titulos
select count(title_id) from titles; -- 19

-- promedio de precios de los libros con corte en 2 decimales
select truncate(avg(price),2) from titles; -- 14.76

-- sumatoria de precio de los titulos
select round(sum(price),3) from titles; -- 236.20

-- todas las funciones en una sola query
select 	max(price) as 'libro mas caro',
		min(price) as 'libro mas barato',
        count(title_id) cantidad,
        avg(price) promedio,
        sum(price) as total
from titles;


-- cantidad de titulos por categorias
select type as categoria,
count(title_id) cantidad
from titles
group by type;

-- cuando mezclo campos con funciones agrupadas
-- en las columnas de un select debo agrupar por campos

-- la clausula having fitra funciones agrupadas dsps del group
-- la clausula where filtra campos

select  type as categoria,
count(title_id) cantidad
from    titles
where type not like '%cook%'
group by type
having count(title_id) > 2
order by 1
limit 2;


-- CONSULTAS RELACIONADAS
-- Listar el nombre de las editoriales y de los libros que publicaron

-- joins
-- inner join
select 		pub_name editorial,
			title libro
from 		publishers p
inner join 	titles t
on 			t.pub_id = p.pub_id;


-- OUTER JOIN (siempre hay una negativa en la materia)
-- Listar los libros que no fueron vendidos
-- tabla principal: titles
-- tabla secundaria: sales 
-- de aceurdo a identificar la tabla principal uso left o right
select	title libro
from	titles t left join sales s
on		t.title_id = s.title_id
where 	s.stor_id is null;
