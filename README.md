
# Prime Number Calculator 🧮

This project is an **ARM assembly-based** prime number calculator designed to find all prime numbers between two user-provided integers. It is optimized for **Cortex-A72** processors using **NEON SIMD** for faster calculations. The program asks for two integers as input and prints the prime numbers in that range.

---

## How It Works 🚀

1. **User Input**: The program prompts the user to enter two positive integers in the format `(int1, int2)` where `int1` is the starting number and `int2` is the ending number for the range to search for prime numbers.
   
2. **Prime Calculation**: 
   - The program uses an **optimized IIR filter** technique for efficient prime checking, iterating through numbers and checking divisibility.
   - It checks each number between `int1+1` and `int2` to determine whether it's prime by testing divisibility with numbers from `2` to `n/2`.

3. **Output**: The program then outputs all the prime numbers found in the range.

---

## Project Components 🔧

- **Prime Checking Algorithm**: Uses **division** and **remainder** checking in assembly for high efficiency.
- **Optimized for Cortex-A72 & NEON**: Utilizes ARM's NEON SIMD instructions for performance optimization.
- **Input Handling**: User enters the range of numbers to check for primes.
- **Output**: Prime numbers within the range are printed on the screen.

---

## Requirements 📦

- **Raspberry Pi** with a **Cortex-A72** CPU.
- **ARM Toolchain** (GCC for ARM).
- **libsndfile** for any potential audio output if needed (although it's not required for this specific version).
- **Assembler (`as`)** or **GCC** for compiling ARM assembly.

---

## Build Instructions 🛠️

### 1. Clone the repository:

```bash
git clone https://github.com/yourusername/prime-number-calculator.git
cd prime-number-calculator
```

### 2. Compile the project:

Make sure you have the ARM toolchain installed on your Raspberry Pi. If you're on **macOS**, you may need to use **Homebrew** to install the necessary dependencies.

```bash
make
```

This will compile the assembly code into object files and link them into the final executable `find_prime`.

### 3. Run the program:

```bash
./find_prime
```

### 4. Enter your range of numbers:

The program will prompt you with:

```txt
Enter two positive integers in format: (int1, int2)
```

For example:

```txt
Enter two positive integers in format: (int1, int2)
```

If you input:

```txt
5, 30
```

### 5. View the output:

The program will output all prime numbers between 5 and 30, such as:

```txt
Prime numbers between 5 and 30 are:
5
7
11
13
17
19
23
29
```

### Clean up 🧹
To clean up the compiled files and reset the project:

```bash
make clean
```

This will remove all object files and the `find_prime` executable.

---

## Technical Details 📊
- **Architecture**: ARM Cortex-A72
- **FPU**: NEON-FP (ARMv8)
- **Sampling Rate**: 8000 Hz (for audio output, if required)
- **Input Format**: Two positive integers
- **Prime Calculation**: Uses division to check if numbers in the range are prime.
- **Output**: Prints prime numbers to the console.

---

## Conclusion 🌟
This project demonstrates the use of ARM assembly to perform optimized prime number calculations. By using NEON SIMD, the program runs efficiently on the Cortex-A72 architecture. You can adapt this for any range of integers and easily experiment with different assembly optimizations.

---

### Key Features:
- **Simple and Efficient**: Finds all prime numbers in a given range with minimal memory usage and optimized performance.
- **User-Friendly**: Prompts users for input and outputs results in an easily readable format.
- **Optimized for ARM**: Built specifically for the **Raspberry Pi** running **Cortex-A72** with **NEON FPU** optimizations.

---

## License 📝
This project is licensed under the MIT License. See the LICENSE file for details.



