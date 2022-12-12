insert into tournament (name, location, organization, lat, long, country, facility)
values (${name}, ${location}, ${organization}, ${lat}, ${long}, ${country}, ${facility})

returning tid;