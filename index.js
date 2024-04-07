const express = require('express')
const app = express();
const PORT = process.env.PORT || 8000;

app.get('/', (req, res) => {
    return res.json({
        message: 'Hello from DOCKER🐳',
    })
})

app.listen(PORT, () => {
    console.log(`Server is listening on PORT ${PORT}`)
})
