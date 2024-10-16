<?php

function logError($errorMessage) {
    $logFile = 'error_log.txt'; 
    $dateTime = date('Y-m-d H:i:s');
    $formattedMessage = "[$dateTime] ERROR: $errorMessage" . PHP_EOL;
    file_put_contents($logFile, $formattedMessage, FILE_APPEND);
}

class CustomException extends Exception {
    public function errorMessage() {
        return "Custom error on line {$this->getLine()} in {$this->getFile()}: {$this->getMessage()}";
    }
}

try {
    $numerator = 10;
    $denominator = 0;
    if ($denominator === 0) {
        throw new CustomException("Division by zero is not allowed.");
    }
    $result = $numerator / $denominator;
    echo "Result: $result";
} catch (CustomException $e) {
    echo "Caught Custom Exception: " . $e->errorMessage() . "<br>";
    logError($e->errorMessage());
} catch (Exception $e) {
    echo "Caught Exception: " . $e->getMessage() . "<br>";
    logError($e->getMessage());
} finally {
    echo "Execution complete.";
}

?>