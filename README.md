# 🚦 Traffic Light Controller — Verilog FSM

A **Moore Finite State Machine (FSM)** implementation of a Traffic Light Controller, designed and simulated using Icarus Verilog and GTKWave.

---

## 📌 State Sequence

```
🔴 RED (6 cycles) → 🟢 GREEN (4 cycles) → 🟡 YELLOW (2 cycles) → 🔴 RED ...
```

---

## 🗂️ Repository Structure

```
traffic-light-fsm-verilog/
│
├── traffic_light.v       # Design module (FSM)
├── fsm_tb.v              # Testbench
├── fsm.vcd               # Waveform dump (generated after simulation)
├── sim.bat               # One-click simulation script (Windows)
└── README.md
```

---

## ⚙️ FSM Design Details

### States

| State | Encoding | Meaning | Duration |
|-------|----------|---------|----------|
| RED | `2'b00` | Stop | 6 clock cycles |
| GREEN | `2'b01` | Go | 4 clock cycles |
| YELLOW | `2'b10` | Slow Down / Caution | 2 clock cycles |

### Architecture — Moore FSM

- **Sequential block** `always @(posedge clk or posedge reset)` — handles state transitions and counter updates
- **Combinational block** `always @(*)` — drives output signals based only on current state
- Outputs depend **only on state**, not on inputs → classic **Moore FSM**

### State Transition Diagram

```
        ┌─────────────────────────────────┐
        │                                 │
        ▼                                 │
   ┌─────────┐  counter==5   ┌──────────┐ │
   │   RED   │ ─────────────▶│  GREEN   │ │
   └─────────┘               └──────────┘ │
        ▲                         │        │
        │                counter==3        │
        │                         ▼        │
        │                   ┌──────────┐   │
        └───counter==1───── │  YELLOW  │───┘
                            └──────────┘
```

---

## 🔑 Key Concepts Used

- **Non-blocking assignments** (`<=`) for proper sequential behavior
- **Parameterized timing** — easily change durations without rewriting logic
- **Counter reset on transition** — clean one-action-per-cycle logic
- **Default state** — FSM safely recovers from undefined states
- **Async reset** — FSM initializes to RED immediately on reset

---

## 🛠️ Tools Used

| Tool | Purpose |
|------|---------|
| Icarus Verilog | Compilation and simulation |
| GTKWave | Waveform visualization |
| VS Code | Code editing |

---

## ▶️ How to Simulate

### Option 1 — Using `sim.bat` (Windows, one click)

Create a file called `sim.bat` in your project folder:

```bat
@echo off
iverilog -o fsm.vvp fsm_tb.v traffic_light.v
vvp fsm.vvp
gtkwave fsm.vcd
```

Double-click `sim.bat` to compile, simulate, and open GTKWave automatically.

---

### Option 2 — Manual Commands

```bash
# Step 1: Compile
iverilog -o fsm.vvp fsm_tb.v traffic_light.v

# Step 2: Simulate
vvp fsm.vvp

# Step 3: View waveform
gtkwave fsm.vcd
```

---

## 📊 Expected Waveform (GTKWave)

Add these signals in GTKWave to verify:

```
red, green, yellow, state, counter
```

Expected output pattern:

```
RED    ‾‾‾‾‾‾|________|‾‾‾‾‾‾|________
GREEN  ________|‾‾‾‾|____________|‾‾‾‾|
YELLOW _____________|‾‾|___________|‾‾|
        ← 6  →← 4 →← 2→← 6 →← 4→← 2→
```

---

## 📋 Sample Monitor Output

```
Time=20  | RED=1 YELLOW=0 GREEN=0
Time=70  | RED=0 YELLOW=0 GREEN=1
Time=110 | RED=0 YELLOW=1 GREEN=0
Time=130 | RED=1 YELLOW=0 GREEN=0
```

---

## 👤 Author

**Akash M**
B.E. Electronics and Communication Engineering
Government College of Engineering, Tirunelveli

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue)](https://linkedin.com/in/akash-m-ece)
[![GitHub](https://img.shields.io/badge/GitHub-Follow-black)](https://github.com/Advenarrow)

---

## 📁 Part of VLSI Portfolio

This project is part of a structured RTL design portfolio:

| # | Project | Status |
|---|---------|--------|
| 1 | 4-bit Counter | ✅ Done |
| 2 | Full Adder | ✅ Done |
| 3 | Shift Register | ✅ Done |
| 4 | PWM Generator | ✅ Done |
| 5 | **Traffic Light FSM** | ✅ Done |
| 6 | UART Transmitter | 🔜 Next |
