const AWS = require('aws-sdk');
const dynamoDB = new AWS.DynamoDB.DocumentClient();

exports.handler = async (event) => {
    const tableName = 'YourTableName'; // Replace with your actual table name
    const item = {
        userId: '123', // Example key
        name: 'John Doe',
        age: 30
    };

    // Put item into DynamoDB
    const paramsPut = {
        TableName: tableName,
        Item: item
    };

    try {
        await dynamoDB.put(paramsPut).promise();

        // Now retrieve the item to confirm
        const paramsGet = {
            TableName: tableName,
            Key: {
                userId: '123' // Same key as above
            }
        };

        const data = await dynamoDB.get(paramsGet).promise();

        return {
            statusCode: 200,
            body: JSON.stringify({
                message: 'Item successfully added and retrieved!',
                data: data.Item
            })
        };
    } catch (error) {
        return {
            statusCode: 500,
            body: JSON.stringify({
                message: 'Error occurred',
                error: error.message
            })
        };
    }
};
