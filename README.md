# Cryptrader Execution Engine

A robust, asynchronous algorithmic trading execution engine built in Python. This project was developed to provide an institutional-grade order execution framework for high-frequency cryptocurrency trading, complete with paper trading simulation and advanced risk management constraints.

## 🚀 Key Features

*   **Asynchronous CCXT Integration:** Direct, low-latency communication with Binance (and other CCXT-supported exchanges) for market data and order execution.
*   **Paper Trading Simulator:** A fully functioning local execution environment that perfectly mimics exchange fees, funding rates, and slippage without risking real capital.
*   **Institutional Risk Management:**
    *   **Mathematical Trailing Stop-Loss:** Dynamically tracks the absolute peak of an open position and secures profits before a reversal occurs.
    *   **Dynamic Position Sizing:** Automatically calculates leverage constraints and maximum account risk percentages per trade (e.g., 50% base risk at 10x leverage).
    *   **Automated Blocklists:** Detects consecutive losses on specific assets and temporarily blacklists them to prevent rapid portfolio drain in choppy markets.
*   **SQLite State Management:** Uses `SQLAlchemy` with WAL-mode enabled for concurrent database writes, perfectly tracking open orders, trade outcomes, and global system settings asynchronously.

## 🛠️ Architecture

The system is separated into highly modular components:
1.  **Executor (`executor.py`):** The heart of the system. Monitors open trades, calculates PnL, executes Stop-Loss/Take-Profit commands, and manages portfolio balance.
2.  **TA Engine (`ta_engine.py`):** A modular signal generator capable of parsing multiple mathematical indicators (EMA, RSI, MACD) to generate entry setups.
3.  **Auditor/Classifiers:** Plug-and-play LLM-based logic modules designed to filter trade setups based on macro sentiment.

## 💡 Future Roadmap (Pivots)
Because the execution engine is decoupled from the signal generators, it is highly adaptable. Current roadmaps include:
*   Pivoting from directional TA prediction to a **Volatility Grid Bot**.
*   Integrating a **TradingView Webhook Listener** to execute third-party professional signals using the engine's built-in risk management constraints.

## ⚙️ Installation & Usage

*(Note: Requires a `.env` file containing valid Exchange API keys. The `.env` file is excluded via `.gitignore` for security).*

1. Clone the repository.
2. Navigate to `ai_workers/` and install dependencies:
   ```bash
   pip install -r requirements.txt
   ```
3. Initialize the database and start the execution loop:
   ```bash
   python reset_db.py
   python executor.py
   ```

---
*Disclaimer: Algorithmic trading in cryptocurrency involves significant risk. This codebase is provided as a software engineering portfolio piece, not financial advice.*
