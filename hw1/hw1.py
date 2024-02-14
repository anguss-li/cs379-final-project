#!/usr/bin/env python

import pandas as pd
import numpy as np


def odds_ratio(X: str, Y: str, Z: str, Z_value: int, data: pd.DataFrame) -> float:
    """
    Compute the odds ratio OR(X=1, Y=1 | Z=Z_value).
    X, Y, and Z are strings corresponding to
    names of variables in the data frame

    Return float OR for the odds ratio OR(X=1, Y=1 | Z=Z_value)
    """
    # Implement your code here:
    # Condition on Z, if it exists
    if Z == "":
        data_z = data
    else:
        data_z = data[data[Z] == Z_value]

    # Usage: P(X=X_value | Y=Y_value, Z) = cond_probs[Y_value][X_value]
    # Note that X and Y are flipped!
    cond_probs = data_z.groupby(Y)[X].value_counts() / data_z.groupby(Y)[X].count()

    # Evaluate
    #     (P(X1 | Y1, Z)   /   P(X0 | Y1, Z))  *  (P(X0 | Y0, Z)   /   P(X1 | Y0, Z))
    OR = (cond_probs[1][1] / cond_probs[1][0]) * (cond_probs[0][0] / cond_probs[0][1])
    return round(OR, 3)

def compute_confidence_intervals(
    X: str,
    Y: str,
    Z: str,
    Z_value: int,
    data: pd.DataFrame,
    num_bootstraps: int = 200,
    alpha: float = 0.05,
) -> tuple[float, float]:
    """
    Compute confidence intervals through bootstrap

    Returns tuple (q_low, q_up) for the lower and upper quantiles of the confidence interval.
    """

    Ql = alpha / 2
    Qu = 1 - alpha / 2
    estimates = []

    for i in range(num_bootstraps):
        # resample the data with replacement, you can use the pandas sample function for this
        data_sample = data.sample(len(data), replace=True)
        estimates.append(odds_ratio(X, Y, Z, Z_value, data_sample))

    # calculate the quantiles
    q_low = np.percentile(estimates, Ql*100)
    q_up = np.percentile(estimates, Qu*100)

    return round(q_low, 3), round(q_up, 3)


def main():
    """
    Do not edit this function. This function is used for grading purposes only.
    """

    np.random.seed(200)
    data = pd.read_csv("data.txt")

    # OR(Opera=1, Mortality=1 | Income=1)
    print("Testing OR(X, Y | Z)")
    print(
        "OR(Opera=1, Mortality=1) = ",
        odds_ratio("opera", "mortality", "", 1, data),
        compute_confidence_intervals("opera", "mortality", "", 1, data),
    )
    print(
        "OR(Opera=1, Mortality=1 | Income=1) = ",
        odds_ratio("opera", "mortality", "income", 1, data),
        compute_confidence_intervals("opera", "mortality", "income", 1, data),
    )

    print()

    # OR(Mortality=1, Opera=1 | Income=1)
    print("Testing OR(Y, X | Z)")
    print(
        "OR(Mortality=1, Opera=1) = ",
        odds_ratio("mortality", "opera", "", 1, data),
        compute_confidence_intervals("mortality", "opera", "income", 1, data),
    )
    print(
        "OR(Mortality=1, Opera=1 | Income=1) = ",
        odds_ratio("mortality", "opera", "income", 1, data),
        compute_confidence_intervals("mortality", "opera", "income", 1, data),
    )


if __name__ == "__main__":
    main()
