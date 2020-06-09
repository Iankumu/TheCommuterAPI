<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class LocationResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        // return parent::toArray($request);
        return[
            'id'=>$this->id,
            'latitude'=>$this->latitude,
            'longitude'=>$this->longitude
        ];
    }
    public function with($request)
    {
        return[
            "version"=>'1.0'
        ];
    }
    }

