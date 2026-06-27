const client = require("prom-client");

// Create a Registry to register metrics
const register = new client.Registry();

// Add default Node.js metrics (event loop lag, memory, CPU, etc.)
client.collectDefaultMetrics({ register });

// --- Custom Metrics ---

// Counter: total number of HTTP requests
const httpRequestsTotal = new client.Counter({
  name: "http_requests_total",
  help: "Total number of HTTP requests received",
  labelNames: ["method", "route", "status_code"],
  registers: [register],
});

// Histogram: request duration in seconds (also gives you a latency summary)
const httpRequestDurationSeconds = new client.Histogram({
  name: "http_request_duration_seconds",
  help: "Duration of HTTP requests in seconds",
  labelNames: ["method", "route", "status_code"],
  // Buckets cover typical API latency ranges (in seconds)
  buckets: [0.005, 0.01, 0.025, 0.05, 0.1, 0.25, 0.5, 1, 2.5, 5, 10],
  registers: [register],
});

/**
 * Express middleware that records total requests and latency for every route.
 * Mount this before your routes so all requests are captured.
 */
const metricsMiddleware = (req, res, next) => {
  const end = httpRequestDurationSeconds.startTimer();

  res.on("finish", () => {
    // Normalize the route path; fall back to the raw URL to avoid high cardinality
    const route = req.route ? req.baseUrl + req.route.path : req.path;

    const labels = {
      method: req.method,
      route,
      status_code: res.statusCode,
    };

    httpRequestsTotal.inc(labels);
    end(labels);
  });

  next();
};

module.exports = { register, metricsMiddleware };
