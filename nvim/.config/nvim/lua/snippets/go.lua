local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local rep = require("luasnip.extras").rep

ls.add_snippets("go", {
    -- Prefix changed to "inip" to match your VSCode request
    s("inip", {
        t({
            "package migration_scripts",
            "",
            "import (",
            "    \"fmt\"",
            "    \"github.com/jackc/pgx/v5\"",
            "    \"github.com/jackc/pgx/v5/pgtype\"",
            "    \"github.com/jackc/pgx/v5/pgxpool\"",
            ")",
            "",
            "func init() {",
            "    Register(Migration{",
            "        Name: \"",
        }),
        i(1), -- $1: Name / New Table
        t({
            "\",",
            "        MigratePGX: migrate",
        }),
        i(2), -- $2: Function Suffix
        t({
            ",",
            "    })",
            "}",
            "",
            "func migrate",
        }),
        rep(2), -- Mirrors $2
        t({
            "(oldDB, newDB *pgxpool.Pool, migrationNumber int) error {",
            "    const (",
            "        oldTable = \"",
        }),
        i(3), -- $3: Old Table
        t({
            "\"",
            "        newTable = \"",
        }),
        rep(1), -- Mirrors $1
        t({
            "\"",
            "    )",
            "    return ExecuteMigration(migrationNumber, newTable, func() error {",
            "        ctx, cancel := CommonMigrationContext()",
            "        defer cancel()",
            "",
            "        readTx, err := oldDB.BeginTx(ctx, PgxReadOnlyTxOpts)",
            "        if err != nil {",
            "            return fmt.Errorf(\"begin read-only tx on oldDB: %w\", err)",
            "        }",
            "        defer readTx.Rollback(ctx)",
            "",
            "        writeTx, err := newDB.BeginTx(ctx, PgxWriteTxOpts)",
            "        if err != nil {",
            "            return fmt.Errorf(\"begin write tx on newDB: %w\", err)",
            "        }",
            "        defer writeTx.Rollback(ctx)",
            "",
            "        query := fmt.Sprintf(`SELECT",
            "",
            "        FROM %s`, oldTable)",
            "        rows, err := readTx.Query(ctx, query)",
            "        if err != nil {",
            "            return fmt.Errorf(\"query %s: %w\", oldTable, err)",
            "        }",
            "        defer rows.Close()",
            "",
            "        targetColumns := []string{",
            "",
        }),
        i(0), -- $0: Cursor position inside targetColumns
        t({
            "",
            "        }",
            "",
            "        dataSource := &StreamSource{",
            "            Rows: rows,",
            "            Transform: func() ([]any, error){",
            "                var (",
            "",
            "                )",
            "",
            "                if err := rows.Scan(",
            "",
            "                ); err != nil {",
            "                    return nil, fmt.Errorf(\"scan: %w\", err)",
            "                }",
            "",
            "                return []any{",
            "",
            "                }, nil",
            "            },",
            "        }",
            "",
            "        _, err = writeTx.CopyFrom(",
            "            ctx,",
            "            pgx.Identifier{newTable},",
            "            targetColumns,",
            "            dataSource,",
            "        )",
            "",
            "        if err != nil {",
            "            return fmt.Errorf(\"copy from failed: %w\", err)",
            "        }",
            "",
            "        if err := writeTx.Commit(ctx); err != nil {",
            "            return fmt.Errorf(\"commit write tx: %w\", err)",
            "        }",
            "",
            "        return readTx.Commit(ctx)",
            "    })",
            "}"
        }),
    }),
})
