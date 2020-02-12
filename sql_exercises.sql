
/*Q1: Who checked out the book 'The Hobbit’?*/

select name from member,checkout_item,book 
where checkout_item.member_id = member.id 
and checkout_item.book_id = book.id 
and book.title = 'The Hobbit';

/*Answer: Anand Beck*/

/*Q2: How many people have not checked out anything?*/

select count(*) from member left join checkout_item on member.id = checkout_item.member_id
where checkout_item.member_id is null;

/*Answer: 37 */

/*Q3: What books and movies aren't checked out? */

/*book*/
select book.id,book.title from book left join checkout_item on book.id = checkout_item.book_id 
where checkout_item.book_id is null;

/*Answer:
2|Fellowship of the Ring
6|1984
7|Tom Sawyer
8|Catcher in the Rye
9|To Kill a Mockingbird
10|Domain Driven Design

*/

/*movie*/
select movie.id, movie.title from movie left join checkout_item on movie.id = checkout_item.movie_id
where checkout_item.movie_id is null;

/*Answer:
6|Thin Red Line
7|Crouching Tiger, Hidden Dragon
8|Lawrence of Arabia
9|Office Space
*/

/*Q4*/

insert into book (id,title)
values (11,'The Pragmatic Programmer');

insert into member(id,name)
values (43,'Xianhao Ni');

insert into checkout_item (member_id,book_id)
values(43,11);


select name from member,checkout_item,book 
where checkout_item.member_id = member.id 
and checkout_item.book_id = book.id 
and book.title = 'The Pragmatic Programmer';

delete from checkout_item where member_id =43;
delete from member where id = 43;
delete from book where id = 11;


/*Q5:Who has checked out more than one item?*/

select member.id, member.name from member, checkout_item
where member.id = checkout_item.member_id 
group by checkout_item.member_id having count(*)>1;

/*Answer:
1|Anand Beck
6|Frank Smith
*/







