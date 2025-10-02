import express from 'express';

const app = express();

const PORT = process.env.PORT || 3000;

// Default route
app.get('/', (req, res) => {
    res.send('This is Kubernetes Demo Application.');
});

// Start the server
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
