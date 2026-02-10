# 🎓 CampusNexus - Decentralized Campus Ecosystem

**CampusNexus** is a decentralized platform designed for **VIT Pune**, enabling students to collaborate, trade, and build their on-chain professional reputation. It leverages the **Algorand** blockchain to provide a trustless environment for student interactions.

---

## 🚀 Key Features

*   **✨ AI Skill-Matcher**: Connects students with complementary skills for hackathons and projects using AI-driven matching.
*   **🤝 MilestoneEscrow**: A smart contract-based escrow system that ensures fair payments for freelance work. Funds are released only when milestones are approved.
*   **🏆 Hustle-Score**: An on-chain reputation system. Successful collaborations and completed projects increase a student's score, unlocking badges and opportunities.
*   **🛒 Student Marketplace**: A peer-to-peer marketplace for trading campus essentials (books, electronics, etc.) using ALGO or stablecoins.
*   **🆔 Soulbound Tokens (SBTs)**: Non-transferable tokens that certify achievements, roles (e.g., "Core Committee Member"), and skills.

---

## 🛠️ Tech Stack

*   **Blockchain**: Algorand (PyTeal / Beaker / AlgoKit)
*   **Frontend**: React, Vite, TailwindCSS
*   **Backend**: Python (FastAPI)
*   **Wallet**: Pera Wallet, Defly, Exodus (via `use-wallet`)
*   **Storage**: IPFS (via Pinata) for NFT metadata and project assets.

---

## 📂 Project Structure

This repository follows the **AlgoKit** monorepo structure:

*   `projects/contracts`: **Smart Contracts** (Python/Beaker).
    *   `smart_contracts/marketplace`: Logic for the item marketplace.
    *   `smart_contracts/escrow`: The MilestoneEscrow logic.
    *   `smart_contracts/hustle_score`: Reputation management logic.
*   `projects/backend`: **API Server** (FastAPI).
    *   Handles off-chain logic, AI matching, and serving the frontend.
*   `projects/frontend`: **Web Application** (React).
    *   The user interface for students to interact with the platform.

---

## ⚡ Quick Start

### Prerequisites
*   [Docker](https://www.docker.com/) (must be running)
*   [Node.js](https://nodejs.org/) (v18+)
*   [AlgoKit](https://github.com/algorandfoundation/algokit-cli)

### Troubleshooting

*   **Python 3.14 Users**: If `algokit project bootstrap all` fails due to `coincurve` build errors, you can skip the contract build step if you are only working on the frontend/backend. The necessary artifacts have been pre-generated for you.
*   **Marketplace Contract**: A placeholder contract has been restored to `projects/contracts/smart_contracts/marketplace`.

### Installation

1.  **Bootstrap the Project** (Installs dependencies for all components):
    ```bash
    algokit project bootstrap all
    ```
    > **Note:** If `bootstrap all` fails for the backend, navigate to `projects/backend` and run:
    > ```bash
    > python -m venv venv
    > source venv/Scripts/activate  # Windows
    > pip install -r requirements.txt
    > ```

2.  **Start LocalNet** (Runs a local Algorand blockchain):
    ```bash
    algokit localnet start
    ```

3.  **Deploy Contracts & Build**:
    ```bash
    algokit project run build
    ```

4.  **Run the Backend**:
    ```bash
    cd projects/backend
    # Activate venv if not active
    uvicorn app.main:app --reload --port 8000
    ```

5.  **Run the Frontend**:
    ```bash
    cd projects/frontend
    npm run dev
    ```

---

## 🧪 Verification

To audit the technical health of this repository (LocalNet status, dependencies, environment variables), run the included verification script:

```bash
./VERIFY.sh
```

---

## 📖 Walkthrough

Want to see CampusNexus in action? Read the narrative walkthrough:
👉 [**WALKTHROUGH.md**](./WALKTHROUGH.md)

---

## 👥 Team

*   **Aditya Gavane** (Solo Developer)

---

**Made with ❤️ at VIT Pune**
