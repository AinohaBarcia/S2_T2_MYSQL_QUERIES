USE tienda;

select nombre from producto;
select nombre,precio from producto;
select *  from producto;
select nombre, precio, precio * 1.07 as precio_en_usd from producto;
select nombre as 'nom de producto', precio as euros, precio * 1.07 as dòlars from producto;
select nombre as NOMBRE,precio as PRECIO from producto;
select nombre, precio from producto;
select nombre, upper(left(nombre,2)) as 'primeres dues lletres' from fabricante;
select nombre, round(precio)from producto;
select nombre, truncate(precio,0)from producto;
select fabricante.codigo from fabricante inner join producto on fabricante.codigo=producto.codigo_fabricante;
select nombre from fabricante order by nombre;
select nombre from fabricante order by nombre desc;
select nombre, precio from producto order by nombre asc, precio desc;
select * from fabricante limit 5;
select * from fabricante where codigo between 4 and 5;
select nombre,precio from producto order by precio asc limit 1;
select nombre,precio from producto order by precio desc limit 1;
select nombre from producto where codigo_fabricante = 2;
select p.nombre, p.precio, f.nombre from producto p inner join fabricante f on p.codigo_fabricante =f.codigo;
select p.nombre, p.precio, f.nombre from producto p inner join fabricante f on p.codigo_fabricante =f.codigo order by f.nombre;
select p.codigo , p.nombre, p.codigo_fabricante, f.nombre as nombre_fabricante from producto p inner join  fabricante f ON p.codigo_fabricante= f.codigo;
select p.nombre,p.precio, f.nombre from producto p inner join fabricante f on p.codigo_fabricante =f.codigo order by precio asc limit 1;
select p.nombre,p.precio, f.nombre from producto p inner join fabricante f on p.codigo_fabricante =f.codigo order by precio desc limit 1;
select * from producto where codigo_fabricante = (select f.codigo from fabricante f where f.nombre = 'Lenovo');
select * from producto where codigo_fabricante = (select f.codigo from fabricante f where f.nombre = 'Crucial')and precio>=200;
select p.* from producto p inner join fabricante f on p.codigo_fabricante = f.codigo where f.nombre = 'Asus' or f.nombre = 'Hewlett-Packard' or f.nombre = 'Seagate';
select p.* from producto p inner join fabricante f on p.codigo_fabricante = f.codigo where f.nombre  in ('Asus', 'Hewlett-Packard', 'Seagate');
select p.* from producto p inner join fabricante f on p.codigo_fabricante = f.codigo where f.nombre like '%e';
select p.* from producto p inner join fabricante f on p.codigo_fabricante = f.codigo where f.nombre like '%w%';
select p.nombre,p.precio, f.nombre from producto p inner join fabricante f on p.codigo_fabricante =f.codigo where precio>=180 order by precio desc,p.nombre asc;
select f.codigo, f.nombre from fabricante f inner join producto p on f.codigo=p.codigo_fabricante;
select f.codigo, f.nombre, p.codigo, p.nombre as 'nombre producto' from fabricante f left join producto p on f.codigo = p.codigo_fabricante;
select f.codigo, f.nombre from fabricante f left join producto p on f.codigo = p.codigo_fabricante where p.codigo_fabricante is null;
select * from producto where codigo_fabricante = (select codigo from fabricante where nombre = 'Lenovo');
select * from producto where precio =(select max(precio)from producto where codigo_fabricante = (select codigo from fabricante where nombre = 'Lenovo'));
select nombre from producto where codigo_fabricante = (select codigo from fabricante where nombre = 'Lenovo') order by precio desc limit 1;
select nombre from producto where codigo_fabricante = (select codigo from fabricante where nombre = 'Hewlett-Packard') order by precio asc limit 1;
select * from producto where precio >=(select max(precio)from producto where codigo_fabricante = (select codigo from fabricante where nombre = 'Lenovo'));
select * from producto where codigo_fabricante = (select codigo from fabricante where nombre = 'Asus') and precio > (select avg (precio) from producto where codigo_fabricante = (select codigo from fabricante where nombre = 'Asus'));



