<?php
// db.php - your database connection file
include 'connect.php'; // include your database connection file

function getBotResponse($userMessage) {
    // Add your chatbot logic here
    // For example, basic responses
    if (stripos($userMessage, 'hello') !== false) {
        return "Hello! How can I assist you today?";
    } elseif (stripos($userMessage, 'help') !== false) {
        return "Sure! What do you need help with?";
    } else {
        return "I'm sorry, I didn't understand that.";
    }
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $userMessage = $_POST['user_message'];
    
    $botResponse = getBotResponse($userMessage);

    // Save both user message and bot response to the database
    $stmt = $db->prepare("INSERT INTO chat_messages (user_message, bot_response) VALUES (?, ?)");
    $stmt->bind_param("ss", $userMessage, $botResponse);
    $stmt->execute();
    
    // Return the bot response
    echo json_encode(['bot_response' => $botResponse]);
    exit;
}
