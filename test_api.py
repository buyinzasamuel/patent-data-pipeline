import requests

DATA_URL = "https://api.patentsview.org/patents/query"
QUERY_PARAMS = {
    "q": {"_gte":{"patent_date":"2020-01-01"}},
    "f": ["patent_id", "patent_title", "patent_abstract", "patent_date",
          "inventors", "assignees"],
    "o": {"per_page": 10000, "page": 1}
}

# Try POST
response = requests.post(DATA_URL, json=QUERY_PARAMS)
print('Status:', response.status_code)
print('Content type:', response.headers.get('content-type'))
print('Text start:', repr(response.text[:500]))