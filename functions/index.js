const {onRequest} = require("firebase-functions/v2/https");
const {defineSecret} = require("firebase-functions/params");
const admin = require("firebase-admin");
const express = require("express");
const cors = require("cors");

const STRIPE_SECRET_KEY = defineSecret("STRIPE_SECRET_KEY");

admin.initializeApp();
const app = express();
app.use(cors({origin: true}));
app.use(express.json());

let stripe = null;

app.post("/create-payment-intent", async (req, res) => {
  try {
    if (!stripe) {
      const stripeLib = require("stripe");
      const secret = await STRIPE_SECRET_KEY.value();
      stripe = stripeLib(secret);
    }

    const {amount, currency} = req.body;

    const paymentIntent = await stripe.paymentIntents.create({
      amount,
      currency: currency || "usd",
    });

    res.send({clientSecret: paymentIntent.client_secret});
  } catch (err) {
    console.error("Stripe error:", err);
    res.status(400).send({error: err.message});
  }
});

exports.api = onRequest({secrets: [STRIPE_SECRET_KEY]}, app);
