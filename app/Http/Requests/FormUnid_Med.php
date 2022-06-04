<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class FormUnid_Med extends FormRequest
{

    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'des_unid_med'=>'required|unique:posts|max:45',
            'prefijo_unid_med'=>'required|unique:posts|max:10'
        ];
    }
}
