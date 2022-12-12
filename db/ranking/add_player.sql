insert into rank_player (first, last, gender, birth_year)
select ${first}, ${last}, ${gender}, ${birth}
where not exists (
select first from rank_player where first = ${first} and last = ${last} and gender = ${gender} and birth_year = ${birth}
);