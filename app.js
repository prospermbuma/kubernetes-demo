import { time } from 'console';
import express from 'express';

const app = express();

const PORT = process.env.PORT || 3000;

// Default route
app.get('/', (req, res) => {
    res.json(
        {
            message: 'This is Kubernetes Demo Application.',
            service: 'kubernetes-demo-app',
            pod: process.env.POD_NAME || 'unknown',
            time: new Date().toISOString(),
        }
    );
});

// Readiness check route
app.get('/ready', (req, res) => {
    res.status(200).json({ status: 'Ready' });
});

// Health check route
app.get('/health', (req, res) => {
    res.status(200).json({ status: 'Ok' });
});

// Start the server
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
