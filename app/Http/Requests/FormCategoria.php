<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class FormCategoria extends FormRequest
{

    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'des_cat'=>'required|unique:posts|max:45',//requerido, max 45
        ];
    }
}
