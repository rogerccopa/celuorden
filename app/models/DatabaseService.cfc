component hint="Database Service"
{
    property name="dsn" value="co1001";

    public query function get_menu()
    {
        // return queryExecute(
        //     sql:"
        //         SELECT id, title, description, price, is_available
        //         FROM #dsn#.dbo.menu_items
        //     ",
        //     params: {
        //     },
        //     options {
        //         datasource = "#dsn#"
        //     }
        // )

        var qry = queryNew("id,title,description,price,is_available", "integer,varchar,varchar,decimal,integer",[
            {
                "id": 1,
                "title": "Item One",
                "description": "Item One description",
                "price": 9.99,
                "is_available": true
            }
        ]);

        return qry;
    }
}