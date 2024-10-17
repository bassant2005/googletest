#include "polynomial.h"
#include <cstdlib>
#include <ctime>

using namespace std;

int main() {
    vector<double> coefficients1, coefficients2;
    int degree1, degree2;

    cout << "Enter the degree of the first polynomial: ";
    cin >> degree1;

    cout << "Enter the coefficients of the first polynomial (starting from the highest degree): ";
    for (int i = degree1; i >= 0; --i) {
        double coefficient;
        cin >> coefficient;
        coefficients1.push_back(coefficient);
    }

    Polynomial poly1(coefficients1);

    // Get the second polynomial (optional)
    cout << "Enter the degree of the second polynomial (or 0 to skip): ";
    cin >> degree2;

    if (degree2 == 0) {
        // Generate random coefficients for the second polynomial
        srand(time(nullptr));
        degree2 = rand() % 5 + 1; // Random degree between 1 and 5
        coefficients2.resize(degree2 + 1);
        for (int i = 0; i <= degree2; ++i) {
            coefficients2[i] = rand() % 10 - 5; // Random coefficients between -5 and 4
        }
        cout << "Using random second polynomial: " << Polynomial(coefficients2) << endl;
    } else {
        cout << "Enter the coefficients of the second polynomial (starting from the highest degree): ";
        coefficients2.clear();
        for (int i = degree2; i >= 0; --i) {
            double coefficient;
            cin >> coefficient;
            coefficients2.push_back(coefficient);
        }
    }

    Polynomial poly2(coefficients2);

    // Perform operations with both polynomials
    // Example: Add the two polynomials
    Polynomial sum = poly1 + poly2;
    cout << "Sum of polynomials: " << sum << endl;

    // Example: Subtract the second polynomial from the first
    Polynomial difference = poly1 - poly2;
    cout << "Difference of polynomials: " << difference << endl;

    // Example: Multiply the two polynomials
    Polynomial product = poly1 * poly2;
    cout << "Product of polynomials: " << product << endl;

    // Operations on the first polynomial
    // Example: Evaluate the first polynomial at a specific value
    cout << "Enter the value of x: ";
    double x;
    cin >> x;
    double result = poly1.evaluate(x);
    cout << "Polynomial evaluated at x = " << x << " is: " << result << endl;

    // Example: Find the derivative of the first polynomial
    Polynomial derivative = poly1.derivative();
    cout << "Derivative of the first polynomial: " << derivative << endl;

    // Example: Find the integral of the first polynomial
    Polynomial integral = poly1.integral();
    cout << "Integral of the first polynomial: " << integral << endl;

    // Example: Evaluate the definite integral of the first polynomial
    double x1, x2;
    cout << "Enter the lower bound of integration: ";
    cin >> x1;
    cout << "Enter the upper bound of integration: ";
    cin >> x2;
    double definiteIntegral = poly1.integral(x1, x2);
    cout << "Definite integral from " << x1 << " to " << x2 << ": " << definiteIntegral << endl;

    // Example: Find a root of the first polynomial
    double root = poly1.getRoot(1.0, 1e-6, 100); // Provide the required arguments
    cout << "Approximate root of the first polynomial: " << root << endl;

    return 0;
}
