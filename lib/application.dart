String dbName = "itlist.db";
int dbVersion = 1;


List<String> dbCreate = [
	// td lista
	"""CREATE TABLE lista(
		pk_lista INTEGER PRIMARY KEY,
		name TEXT,
		created TEXT
	)""",

	// tb item
	"""CREATE TABLE item (
		pk_item INTEGER PRIMARY KEY,
		fk_lista INTEGER,
		name TEXT,
		quantidade INTEGER,
		valor DECIMAL(10,2),
		created TEXT
	)"""
];