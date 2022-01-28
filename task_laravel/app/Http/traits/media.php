<?php

namespace App\Http\traits;

trait media
{
    public function uploadPhoto($image, $folder)
    {
        $photoName = uniqid() . '.' . $image->extension();
        $image->move(public_path('/dist/img/' . $folder), $photoName);
        return $photoName;
    }
    public function deletePhoto($pathOfPhoto)
    {
        if (file_exists($pathOfPhoto)) {
            unlink($pathOfPhoto); //delete path of old image
            return true;
        }
        return false;
    }
}
