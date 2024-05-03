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
# Filter to only the variables used in the observational study
df = df[
    [
        "T",
        "RepDrt",
        "loc_rules_bi", # the presence of local official government rules regulating natural resources;
        "trad_rules_bi", # the presence of informal nongovernmental traditional rules regulating natural resources;
        "more_loc_rules_bi", # a greater number of local official government rules regulating natural resources than there were in the past;
        "more_trad_rules_bi", # a greater number of informal nongovernmental traditional rules regulating natural resources than there were in the past.
        "TAMBelow1st",
        "TAMBelow2nd",
        "SPI3Below1st",
        "SPI3Below2nd",
        "vio_support",
        "DataVCI",
        "DataTI3",
        "SumPre5_50k", # Violence within fifty kilometers (five year)
        "SPI3mean2013_07_2014_06", # Precipitation deviation (enumeration year)
        "Var_low", # Precipitation variation low
        "age",
        "gender",
        "employed_q3",
        "formal_education_q5",
        "pastoral_q6",
        "low_ses_q15", # Low socioeconomic status
        "included_q11", # Included previous government
        "attacked_1yr",
        "eth_match",
        "gender_match",
        "weather_lied",
    ]
]

# Normalize continuous data
df_cont = df.select_dtypes(include=["float16", "float32", "float64"])
df[df_cont.columns] = (df[df_cont.columns] - df[df_cont.columns].mean()) / df[
    df_cont.columns
].std()

# Get string data
df_str = df.select_dtypes(exclude=[np.number])
# Numerically encode string variables
df[df_str.columns] = df[df_str.columns].apply(lambda x: pd.factorize(x)[0])

df = df.astype({col: "float64" for col in df.columns})

# Save cleaned data as csv for future use
df.to_csv("PROJECT_data.csv", index=False, na_rep="*")

search = ts.TetradSearch(df)

## Use appropriate test of independence
search.use_conditional_gaussian_score(penalty_discount=1)

# Set knowledge
search.add_to_tier(0, "DataVCI")
search.add_to_tier(0, "DataTI3")
search.add_to_tier(0, "SumPre5_50k")
search.add_to_tier(0, "SPI3mean2013_07_2014_06")
search.add_to_tier(0, "Var_low")
search.add_to_tier(0, "age")
search.add_to_tier(0, "gender")
search.add_to_tier(0, "loc_rules_bi")
search.add_to_tier(0, "trad_rules_bi")
search.add_to_tier(1, "low_ses_q15")
search.add_to_tier(1, "pastoral_q6")
search.add_to_tier(1, "employed_q3")
search.add_to_tier(1, "formal_education_q5")
search.add_to_tier(1, "pastoral_q6")
search.add_to_tier(1, "gender_match")
search.add_to_tier(1, "vio_support")
search.add_to_tier(1, "more_loc_rules_bi")
search.add_to_tier(1, "more_trad_rules_bi")
search.add_to_tier(1, "RepDrt")

## Run the search

search.run_fges()

output = str(search.get_string())
print(output)

with open("PROJECT_learned_edges.txt", "w") as file:
    file.write(output)
