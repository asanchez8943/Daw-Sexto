<?php

namespace App\Controllers;

use CodeIgniter\Controller;


class Home extends BaseController
{
    protected $db;

    public function initController(\CodeIgniter\HTTP\RequestInterface $request, \CodeIgniter\HTTP\ResponseInterface $response, \Psr\Log\LoggerInterface $logger)
    {
        // Llama al constructor de la clase padre
        parent::initController($request, $response, $logger);

        // Conexión a la base de datos
        $this->db = \Config\Database::connect();
    }
    
    public function tarea()
    {
               
        //Consulta 1: Seleccionar los 5 primeros autores
        $query_consulta1 = $this->db->query('SELECT id_autor, nombre, nacionalidad FROM autores LIMIT 5');
        $consulta1 = $query_consulta1->getResultArray();

       
        //Consulta 2: Seleccionar los 5 libros más recientes
        $query_consulta2 = $this->db->query('SELECT id_libro, titulo, anio_publicacion FROM libros ORDER BY anio_publicacion DESC LIMIT 5');
        $consulta2 = $query_consulta2->getResultArray();

           
        //Consulta 3: Seleccionar los 5 primeros libros con el nombre de su autor
        $query_consulta3 = $this->db->query('SELECT libros.titulo, autores.nombre FROM libros JOIN autores ON libros.id_autor = autores.id_autor LIMIT 5');
        $consulta3 = $query_consulta3->getResultArray();


        //Array para devolver los datos en formato JSON Todas las Consultas
        //$resultados = [
        //     'consulta1' => $consulta1,
        //     'consulta2' => $consulta2,
         //    'consulta3' => $consulta3,
         //];

        // Devolver resultados en formato JSON
         return $this->response->setJSON($consulta2);    
         //Para presentar consultas individuales debemos comentar el Array e ir presentando datos individuales
         //Para presentar los consultas unificadas, descomentamos el array y colocamos el nombre del array 
        
    }

    public function index(): string
    {
        return view('welcome_message');
    }
}
