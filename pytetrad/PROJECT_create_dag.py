import pyreadstat
import jpype.imports

try:
    jpype.startJVM(classpath=[f"resources/tetrad-current.jar"])
except OSError:
    pass

import numpy as np
import pandas as pd
import tools.TetradSearch as ts

df, meta = pyreadstat.read_dta("../replication_files_linke/DataJCRJune12.dta")
# Individual IDs, not important for our study + lead to explosion of dummies
df = df.drop(["EA_CODE", "RESPONDENT_ID"], axis=1)

# Drop all "mean" or "Sum" variables: these are the same for all people from the same district
df = df[df.columns.drop(list(df.filter(regex='mean')))]
df = df[df.columns.drop(list(df.filter(regex='Sum')))]

# Normalize continuous data
df_cont = df.select_dtypes(include=['float16', 'float32', 'float64'])
df[df_cont.columns] = (df[df_cont.columns]-df[df_cont.columns].mean()) / df[df_cont.columns].std()

# Get string data
df_str = df.select_dtypes(exclude=[np.number])
# Numerically encode string variables
df[df_str.columns] = df[df_str.columns].apply(lambda x: pd.factorize(x)[0])

df = df.astype({col: "float64" for col in df.columns})

# print(df)

search = ts.TetradSearch(df)
# TODO: Conditional Correlation Independence
## Use appropriate test of independence
search.use_sem_bic(penalty_discount=1)

# Set knowledge
# search.add_to_tier(0, "")

## Run the search
# search.run_pc()
# print(search.get_string())

search.run_fges()
print(search.get_string())

# search.run_dagma()
# print(search.get_string())

# search.run_direct_lingam()
# print(search.get_string())

## Print all subsets independence facts.
# print(search.all_subsets_independence_facts(search.get_java()))