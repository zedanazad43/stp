const express = require("express");
const fs = require("fs");
const path = require("path");
const cors = require("cors");
const wallet = require("./wallet");

const app = express();
app.use(cors());
app.use(express.json());

const DATA_FILE = path.join(__dirname, "data.json");
const SYNC_TOKEN = process.env.SYNC_TOKEN || "";

function readData() {
  try {
    const raw = fs.readFileSync(DATA_FILE, "utf8");
    return JSON.parse(raw);
  } catch (e) {
    console.error("Error reading data file:", e.message);
    return [];
  }
}
function writeData(todos) {
  try {
    fs.writeFileSync(DATA_FILE, JSON.stringify(todos, null, 2), "utf8");
    return true;
  } catch (e) {
    console.error("Write error:", e);
    return false;
  }
}

function requireToken(req, res, next) {
  const auth = req.get("Authorization") || "";
  const token = auth.replace(/^Bearer\s+/i, "");
  // Allow unauthenticated access in development when SYNC_TOKEN is not set
  // In production, always set SYNC_TOKEN environment variable
  if (!SYNC_TOKEN) {
    console.warn("SYNC_TOKEN not configured - authentication disabled (development mode)");
    return next();
  }
  if (token !== SYNC_TOKEN) {
    return res.status(401).json({ error: "Unauthorized" });
  }
  next();
}

app.get("/sync", requireToken, (req, res) => {
  const todos = readData();
  res.json({ todos });
});

app.post("/sync", requireToken, (req, res) => {
  const payload = req.body;
  if (!payload || !Array.isArray(payload.todos)) {
    return res.status(400).json({ error: "Invalid payload, expected { todos: [...] }" });
  }
  const ok = writeData(payload.todos);
  if (!ok) return res.status(500).json({ error: "Failed to store data" });
  res.json({ ok: true });
});

// Digital Wallet API Endpoints

// Create a new wallet
app.post("/api/wallets", (req, res) => {
  try {
    const { userId, userName } = req.body;
    if (!userId || !userName) {
      return res.status(400).json({ error: "userId and userName are required" });
    }
    const newWallet = wallet.createWallet(userId, userName);
    res.status(201).json(newWallet);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
});

// Get a wallet by userId
app.get("/api/wallets/:userId", (req, res) => {
  try {
    const { userId } = req.params;
    const userWallet = wallet.getWallet(userId);
    if (!userWallet) {
      return res.status(404).json({ error: "Wallet not found" });
    }
    res.json(userWallet);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get all wallets
app.get("/api/wallets", (req, res) => {
  try {
    const wallets = wallet.getAllWallets();
    res.json(wallets);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Update wallet balance
app.post("/api/wallets/:userId/balance", (req, res) => {
  try {
    const { userId } = req.params;
    const { amount } = req.body;
    if (!Number.isFinite(amount)) {
      return res.status(400).json({ error: "amount must be a finite number" });
    }
    const updatedWallet = wallet.updateBalance(userId, amount);
    res.json(updatedWallet);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
});

// Add stamp to wallet
app.post("/api/wallets/:userId/stamps", (req, res) => {
  try {
    const { userId } = req.params;
    if (userId === "__proto__" || userId === "constructor" || userId === "prototype") {
      return res.status(400).json({ error: "Invalid userId" });
    }
    const stamp = req.body;
    if (!stamp || !stamp.name) {
      return res.status(400).json({ error: "Stamp data with name is required" });
    }
    const updatedWallet = wallet.addStamp(userId, stamp);
    res.json(updatedWallet);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
});

// Transfer between wallets
app.post("/api/wallets/transfer", (req, res) => {
  try {
    const { fromUserId, toUserId, amount, stampId } = req.body;
    if (!fromUserId || !toUserId) {
      return res.status(400).json({ error: "fromUserId and toUserId are required" });
    }
    if (!amount && !stampId) {
      return res.status(400).json({ error: "Either amount or stampId must be provided" });
    }
    if (amount && (!Number.isFinite(amount) || amount <= 0)) {
      return res.status(400).json({ error: "amount must be a positive finite number" });
    }
    const transaction = wallet.transfer(fromUserId, toUserId, amount, stampId);
    res.json(transaction);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
});

// Get transaction history
app.get("/api/wallets/:userId/transactions", (req, res) => {
  try {
    const { userId } = req.params;
    const transactions = wallet.getTransactionHistory(userId);
    res.json(transactions);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get all transactions
app.get("/api/transactions", (req, res) => {
  try {
    const transactions = wallet.getAllTransactions();
    res.json(transactions);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

const port = process.env.PORT || 8080;
app.listen(port, () => {
  console.log(`Stampcoin Platform server listening on port ${port}`);
  console.log(`Digital Wallet API available at http://localhost:${port}/api/wallets`);
});
