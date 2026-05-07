<?php

declare(strict_types=1);

class mConexion {
    // Definimos los tipos de las propiedades para mayor seguridad
    private string $host = "localhost";
    private string $user = "root";
    private string $pass = "";
    private string $database = "asistenciaunu";
    private ?mysqli $bd = null;

    public function __construct() {
        // En PHP 8, es preferible usar el modo de reporte de errores de mysqli
        mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);

        try {
            $this->bd = new mysqli($this->host, $this->user, $this->pass, $this->database);
            $this->bd->set_charset("utf8mb4"); // Recomendado para evitar problemas de tildes/eñes
        } catch (mysqli_sql_exception $e) {
            // Manejo de errores profesional en formato JSON
            header('Content-Type: application/json');
            echo json_encode([
                "error" => [
                    "message" => "Error de conexión",
                    "details" => $e->getMessage()
                ]
            ]);
            exit();
        }
    }

    // Definimos el tipo de retorno para evitar errores
    public function getBd(): ?mysqli {
        return $this->bd;
    }

    public function setBd(?mysqli $bd): void {
        $this->bd = $bd;
    }
}