// -lsqlite3

#include <iostream>
#include <string>
#include <sstream>
#include <sqlite3.h>

int main(){
	const char* FILE_NAME = "Sqlite3.db";
	sqlite3 *db = nullptr;
	if( sqlite3_open(FILE_NAME, &db) ){
		std::cerr << "DBのオープンに失敗しました" << std::endl;
		return 1;
	}else{
		std::cout << "Sqliteバージョン：" << sqlite3_libversion() << std::endl;
	}

	const char* TABLE = "DB_Test";

	/* テーブルの存在を確認 */
	std::stringstream existSql; existSql << "SELECT count(*) FROM sqlite_master WHERE type='table' AND name='" << TABLE << "';";
	sqlite3_stmt* stmtE = nullptr;
	sqlite3_prepare(db, existSql.str().c_str(), existSql.str().size(), &stmtE, nullptr);
	sqlite3_reset(stmtE); // 内部バッファをクリア
	sqlite3_step(stmtE);  // 実行
	
	if( sqlite3_column_int(stmtE, 0) == 0 ){
		std::cout << "Table Not Exist" << std::endl
		          << "Creating Table"  << std::endl;

		/* テーブルを新規作成 */
		std::stringstream createTable;
		createTable << "CREATE TABLE " << TABLE <<
			"(" <<
			"id    integer      primary key autoincrement," <<
			"num   integer      default 0," <<
			"text  varchar(64)  default NULL" <<
			");";
		sqlite3_stmt* stmtC;
		sqlite3_prepare(db, createTable.str().c_str(), createTable.str().size(), &stmtC, nullptr);
		sqlite3_reset(stmtC);
		for(int exec=0; sqlite3_step(stmtC) != SQLITE_DONE; exec++)  if(exec > 1000){
			std::cerr << "[CREATE TABLE]: TimeOut" << std::endl;
			break;
		}
		sqlite3_finalize(stmtC);
		std::cout << "Table Created" << std::endl;

	}else{
		std::cout << "Table Exist" << std::endl;
	}
	sqlite3_finalize(stmtE);


	/* 要素をインサート */
	std::string insert = "INSERT INTO DB_Test(num, text) values(?, ?);";
	sqlite3_stmt* stmtI;
	sqlite3_prepare(db, insert.c_str(), insert.size(), &stmtI, nullptr);
	sqlite3_reset(stmtI);

	sqlite3_bind_int(stmtI, 1, 1234);
	sqlite3_bind_text(stmtI, 2, "OK", -1, SQLITE_TRANSIENT);
	for(int exec=0; sqlite3_step(stmtI) != SQLITE_DONE; exec++)  if(exec > 1000){
		std::cerr << "[INSERT]: TimeOut" << std::endl;
		break;
	};
	sqlite3_finalize(stmtI);
	std::cout << "Values Inserted" << std::endl;

	/* SELECT */
	const std::string SELECT_SQL = std::string() +
		"SELECT * FROM " + TABLE + ";";
	sqlite3_stmt* stmtS;
	sqlite3_prepare(db, SELECT_SQL.c_str(), SELECT_SQL.size(), &stmtS, nullptr);
	sqlite3_reset(stmtS);
	int r;
	while(SQLITE_ROW == (r = sqlite3_step(stmtS))){
		std::cout << "----------" << std::endl
		          << "id: "       << sqlite3_column_int(stmtS, 1)  << std::endl
		          << "num: "      << sqlite3_column_int(stmtS, 2)  << std::endl
		          << "text: "     << sqlite3_column_text(stmtS, 3) << std::endl
		          << "----------" << std::endl;
	}
	if(r != SQLITE_DONE)
		std::cerr << "SELECT エラー" << std::endl;
	sqlite3_finalize(stmtS);

	/* おまけ */
	/* シングルスレッドでSQLを実行
	   (メインスレッドはこのトランザクションの終了を待機する */
	char* err = nullptr;
	sqlite3_exec(db, "insert into DB_Test(num, text) values(5678, 'Ohhh');", NULL, NULL, &err);
	std::cout << err << std::endl;


	sqlite3_close(db);
}
