const button = document.getElementById("stripe_button");
const { sessionId, publicKey } = button.dataset;
button.addEventListener("click", () => {
  const stripe = Stripe(publicKey);
  stripe.redirectToCheckout({ sessionId: sessionId });
});
