<?php


namespace App\Http\Controllers;


class JSON
{
    private $json;

    function __construct($jsonData)
    {
        $this->json = $jsonData;
    }


    public function getJson()
    {
        return $this->json;
    }

    public function setJson($json): void
    {
        $this->json = $json;
    }


}
