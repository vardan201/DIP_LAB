import math
from scipy.stats import norm


def z_test_critical_value(mu0, xbar, sigma, n, alpha, test_type):
    """
    Z-test using Critical Value Method
    test_type:
        1 -> Two-tailed
        2 -> Right-tailed
        3 -> Left-tailed
    """

    # Standard Error
    standard_error = sigma / math.sqrt(n)

    result = {"Sample Mean (xbar)": xbar}

    # Two-tailed test
    if test_type == 1:
        z_critical = norm.ppf(1 - alpha / 2)
        lower_cv = mu0 - z_critical * standard_error
        upper_cv = mu0 + z_critical * standard_error

        decision = "Fail to Reject H0" if lower_cv <= xbar <= upper_cv else "Reject H0"

        result.update({
            "Test Type": "Two-tailed",
            "Z Critical Value": z_critical,
            "Lower Critical Value": lower_cv,
            "Upper Critical Value": upper_cv,
            "Decision": decision
        })

    # Right-tailed test
    elif test_type == 2:
        z_critical = norm.ppf(1 - alpha)
        upper_cv = mu0 + z_critical * standard_error

        decision = "Fail to Reject H0" if xbar <= upper_cv else "Reject H0"

        result.update({
            "Test Type": "Right-tailed",
            "Z Critical Value": z_critical,
            "Upper Critical Value": upper_cv,
            "Decision": decision
        })

    # Left-tailed test
    elif test_type == 3:
        z_critical = norm.ppf(1 - alpha)
        lower_cv = mu0 - z_critical * standard_error

        decision = "Fail to Reject H0" if xbar >= lower_cv else "Reject H0"

        result.update({
            "Test Type": "Left-tailed",
            "Z Critical Value": z_critical,
            "Lower Critical Value": lower_cv,
            "Decision": decision
        })

    else:
        raise ValueError("Invalid test type. Choose 1, 2, or 3.")

    return result


def main():
    print("\nZ-Test Hypothesis Testing (Critical Value Method)\n")

    sigma = float(input("Enter population standard deviation (sigma): "))
    mu0 = float(input("Enter hypothesized population mean (mu0): "))
    xbar = float(input("Enter sample mean (xbar): "))
    n = int(input("Enter sample size (n): "))
    alpha = float(input("Enter significance level (alpha): "))

    print("\nSelect test type:")
    print("1. Two-tailed test (H1: mu != mu0)")
    print("2. Right-tailed test (H1: mu > mu0)")
    print("3. Left-tailed test (H1: mu < mu0)")

    choice = int(input("Enter choice (1/2/3): "))

    results = z_test_critical_value(mu0, xbar, sigma, n, alpha, choice)

    print("\n--- Test Results ---")
    for key, value in results.items():
        print(f"{key}: {value}")

    print()


if __name__ == "__main__":
    main()
