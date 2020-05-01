#! /usr/env/python3

import json
import requests
#import click
import argparse

ids_list = set()

#@click.command()
#@click.option('--orthodb', '-i', is_flag=True, help='Will query orthdb using orthdb ids')

parser = argparse.ArgumentParser(description="Will query orthdb using orthdb ids")
parser.add_argument("-i","--inputfile", help="Input file containing orthodb ids", type=str)
args = parser.parse_args()


def query_orthodb(inputfile):
    with open (args.inputfile, 'r') as f:
        for ids in f:
            ids = ids.rstrip('\n')   
            ids_list.add(ids)

query_orthodb(args.inputfile)

print(f'OrthoDB_ID\tName\tTax_ID\tMolecular_Function\tBiological_Process\tCellular_Component')    
for ids in ids_list:
    urls = "http://www.orthodb.org/group?id=" + ids
#    print(urls)
    queries = requests.get(urls)
    jsons = queries.json()
#    print(jsons)
    print(ids, jsons["data"].get("name"), jsons["data"].get("tax_id"), jsons["data"].get("molecular_function"), jsons["data"].get("biological_process"), jsons["data"].get("cellular_component"), sep='\t')
