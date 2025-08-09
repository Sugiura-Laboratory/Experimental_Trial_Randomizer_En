===========================================
README - app_Experimental_Trial_Randomizer_En (Shiny App)
Version: 1.0.0
Author: Shuichi Sugiura
Date: 2025-08-07
Code Name: Cerisier
===========================================

■ Overview

This Shiny app is designed for researchers conducting experiments (e.g., in psychology), where stimulus durations (e.g., 30s, 45s, 55s) need to be randomly assigned in a non-repeating order per participant.
The results can be exported as a CSV file.
The output CSV is encoded in UTF-8 with BOM, ensuring full compatibility with Microsoft Excel on Windows/macOS (without garbled characters).

---

■ Features

- Freely set the number of participants (N)
- Input durations separated by commas (e.g., 30,45,55)
- Each participant receives a random, non-repeating order of durations
- Specify a seed for reproducibility
- Set a custom CSV filename (no extension needed)
- Output uses UTF-8 BOM encoding for maximum compatibility

---

■ Usage

1. Open `app_Experimental_Trial_Randomizer_En` in R or RStudio

2. Run the following command to launch the app:

shiny::runApp("app_Experimental_Trial_Randomizer_En")

3. In the app GUI, enter the following fields:

- Number of participants (N): e.g., 100
- Durations: e.g., 30,45,55 (comma-separated)
- Seed (optional): e.g., 123 (for reproducible randomization)
- CSV filename: e.g., trial_order (omit the .csv extension)

4. Click “Generate Random Order” to display the results.

5. Click “Download CSV” to save the file (e.g., `trial_order.csv`).

---

■ Sample Output (Trial columns are randomized)

```
ID,Trial1,Trial2,Trial3
1,45,30,55
2,55,30,45
3,30,55,45
...
```

---

■ File Structure

- `app_Experimental_Trial_Randomizer_En` : The Shiny app source code
- `ReadME.txt`         : This instruction file (English version)

---

■ Notes

- Durations must be distinct integers (e.g., 30,30,45 → Error)
- Do not include the `.csv` extension in the filename field (it is added automatically)
- UTF-8 BOM encoding ensures full compatibility with Excel (no garbled characters)

---

■ Developer Info

- Version      : 1.0.0
- Code Name    : Cerisier
- Last Updated : 2025-08-07
- Author       : Shuichi Sugiura

---

■ Special Thanks

This program was developed while watching the live seal webcam from the WEC (World Heritage Centre Wadden Sea) located in the Netherlands.
If you're a researcher or developer feeling stressed, I highly recommend watching WEC’s livestream—it brings calm and peace of mind.
With heartfelt respect and appreciation for the work WEC does.
Note: This software is not affiliated with WEC in any way.
