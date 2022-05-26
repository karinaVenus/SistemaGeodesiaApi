<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class FormProveedor extends FormRequest
{

    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'cod_t_per'=>'required',
            'razon_social'=>'required',
            'cod_t_doc'=>'required',
            'nro_doc'=>'required',
            'correo_per'=>'required',
            'cod_dist'=>'required',
            'dir_per'=>'required',
            'estado_prov'=>'required',
            'nro_telf'=>'required'
        ];
    }
}
