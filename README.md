# playground

Small things I built in high school and college, just because I wanted to try them.

> **Note**
> These are personal and coursework experiments, not polished projects. The code is not optimized or refactored, and some of it reflects what I knew at the time. I keep it here to show what I have tried, not as examples of best practice.

## Projects

| Project | When | Language | What it does |
|---|---|---|---|
| [Kepler orbit](python/kepler-orbit.py) | High school | Python | Animates a planet moving along an elliptical orbit, given the semi-major axis, eccentricity, and period. |
| [Ideal gas collision](python/ideal-gas-collision.py) | High school | Python | Animates two kinds of gas particles colliding in a box, and prints the pressure, mole fractions, and partial pressures from the ideal gas law. |
| [Paper airplane trajectory](c/paper-airplane-rk4.cpp) | College, year 1 | C | Simulates a paper airplane's flight with drag and lift using a hand-written 4th-order Runge–Kutta method, and reports the flight time and distance. |
| [Quantum cat game](excel-vba/quantum-cat-game.xlsm) | College, year 2 | Excel VBA | A betting game with an electron-mass "cat" in an infinite square well: you bet on where the cat is or which energy level it has, based on the time-evolving wave function. ([VBA source](excel-vba/quantum-cat-game-vba/)) |
| [Subway commute model](python/subway-commute-model.ipynb) | College, year 2 | Python | Models how many commuters enter, leave, and stay at each station on a subway line over a day, using differential equations with normally distributed commute times. |

## Running them

- **Python**: `pip install numpy matplotlib pandas`, then run the file. The scripts ask for inputs in Korean. They were written for older library versions and may need small changes to run today.
- **C**: compile with any C compiler, e.g. `gcc c/paper-airplane-rk4.cpp -lm`.
- **Excel VBA**: open the `.xlsm` file in Excel and enable macros. The `.cls` files in `quantum-cat-game-vba/` are the same VBA code as plain text, so it can be read on GitHub.

## Credits

- The animation structure in `ideal-gas-collision.py` (the `ANI_Scatter` class built on `FuncAnimation`) is based on Joe Kington's answer on Stack Overflow, ["How to animate a scatter plot"](https://stackoverflow.com/questions/9401658/how-to-animate-a-scatter-plot) (CC BY-SA). The collision and ideal-gas logic is my own.

## Author

Hyuckchan Cha · [hyuckchan-cha.github.io](https://hyuckchan-cha.github.io)
