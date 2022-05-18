<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class FormPresentacion extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'des_pres'=>'required|max:45',//requerido, max 50
        ];
    }
}
