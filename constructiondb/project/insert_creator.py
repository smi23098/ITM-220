# from typing import Tuple 

"""
table_data format

dictionary

var_columns = {
    "column1": ["reference_table", "lookcolumn"]
}

var_lookups = {
    "column1": [list of input/search value]
}


"""

def create_insert(table_name: str, table_columns: dict, table_data: dict):
    print(f"INSERT INTO {table_name} ({", ".join(table_columns.keys())}) VALUES")
    num_inserts = len(table_data.values()[0])
    for i in range(num_inserts):
        pass
    # print(f"    ()")
    



def main():
    address_columns = {
        'city_id': ['city', 'city_name'],
        'street_num': None,
        'street_name': None,
        'unit_num': None,
        'zip_code_id': [],
        'state_id': []
    }

    addresses = [
        ['Boise', 1532, 'main st', None, '83701', 'ID'],
        ['Rexburg', 233, 's west ave', None, '83440', 'ID'],
        ['Salt Lake City', 25556, 'Brigham dr', None, '84044', 'UT'],
        ['Logan', 390, 'cityside blvd', None, '84321', 'UT'],
        ['Honolulu', 9873, 's palm dr', None, '96795', 'HI'],
        ['Hilo', 5686, 'koa rd', 'C', '96720', 'HI']
    ]

if __name__ == "__main__":
    main()