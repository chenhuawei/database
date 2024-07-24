// Copyright 2019 Gohilla Ltd.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:database/database_adapter.dart';
import 'package:database/sql.dart';

/// Describes a SQL query that [DatabaseAdapter] should perform.
class SqlQueryRequest extends Request<Future<SqlIterator>> {
  final SqlStatement sqlStatement;
  final SqlTransaction? sqlTransaction;

  SqlQueryRequest(this.sqlStatement, {this.sqlTransaction}) {
    ArgumentError.checkNotNull(sqlStatement);
  }

  @override
  int get hashCode => sqlStatement.hashCode;

  @override
  bool operator ==(other) =>
      other is SqlQueryRequest && sqlStatement == other.sqlStatement;

  @override
  Future<SqlIterator> delegateTo(DatabaseAdapter adapter) {
    return adapter.performSqlQuery(this);
  }
}
