<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class FormTipo_doc_reg extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'tipo_reg_doc'=>'required|max:10',
            'des_t_doc'=>'required|max:45'
        ];
    }
}
