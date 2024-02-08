#!/usr/bin/env python

import pandas as pd
import numpy as np


def odds_ratio(X: str, Y: str, Z: str, 
               Z_value: int, data: pd.DataFrame) -> float:
    """
    Compute the odds ratio OR(X=1, Y=1 | Z=Z_value).
    X, Y, and Z are strings corresponding to
    names of variables in the data frame

    Return float OR for the odds ratio OR(X=1, Y=1 | Z=Z_value)
    """

    # Implement your code here:
    OR = 0.5
    return round(OR, 3)

def compute_confidence_intervals(X: str, Y: str, Z: str, Z_value: int, data: pd.DataFrame,
                                 num_bootstraps: int=200, alpha: float=0.05) -> (float, float):
    """
    Compute confidence intervals through bootstrap

    Returns tuple (q_low, q_up) for the lower and upper quantiles of the confidence interval.
    """
    
    Ql = alpha/2
    Qu = 1 - alpha/2
    estimates = []
    
    for i in range(num_bootstraps):
        # resample the data with replacement, you can use the pandas sample function for this
        pass
        
    # calculate the quantiles
    q_low = 0
    q_up = 1
    
    return round(q_low, 3), round(q_up, 3)


def main():
    """
    Do not edit this function. This function is used for grading purposes only.
    """

    np.random.seed(200)
    data = pd.read_csv("data.txt")

    # OR(Opera=1, Mortality=1 | Income=1)
    print("Testing OR(X, Y | Z)")
    print("OR(Opera=1, Mortality=1) = ", odds_ratio("opera", "mortality", "", 1, data), 
          compute_confidence_intervals("opera", "mortality", "", 1, data))
    print("OR(Opera=1, Mortality=1 | Income=1) = ", odds_ratio("opera", "mortality", "income", 1, data),
          compute_confidence_intervals("opera", "mortality", "income", 1, data))

    print()

    # OR(Mortality=1, Opera=1 | Income=1)
    print("Testing OR(Y, X | Z)")
    print("OR(Mortality=1, Opera=1) = ", odds_ratio("mortality", "opera", "", 1, data),
          compute_confidence_intervals("mortality", "opera", "income", 1, data))
    print("OR(Mortality=1, Opera=1 | Income=1) = ", odds_ratio("mortality", "opera", "income", 1, data),
          compute_confidence_intervals("mortality", "opera", "income", 1, data))

if __name__ == "__main__":
    main()
