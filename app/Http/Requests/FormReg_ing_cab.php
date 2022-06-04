<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class FormReg_ing_cab extends FormRequest
{
   
    public function authorize()
    {
        return true;
    }

  
    public function rules()
    {
        return [
            'cod_prov'=>'required',
            'cod_trabajador'=>'required',
            'cod_almacen'=>'required',
            'cod_t_transf'=>'required',
            'cod_t_doc'=>'required',
            'nro_doc'=>'required|unique:posts|max:11',
            'fec_doc'=>'required|date',
            'cod_estado_reg'=>'required',
            'tot_pagar'=>'required',
            'cod_art'=>'required',
            'prec_unit'=>'required|numeric',
            'cant_art'=>'required|numeric',
            'prec_compr'=>'required',
            'obs_ing'=>'max:350'
        ];
    }
}
