<?php

namespace App\Http\Controllers;

use App\Http\Requests\FormTipo_doc_reg;
use App\Models\Tipo_doc_reg;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class TipoDocRegController extends Controller
{
    public function index(Request $request)
    {
        if($request){
            $query = trim($request->get('searchText'));
            $tipo_doc_reg = DB::table('tipo_doc_reg')
            ->select('cod_t_doc','tipo_reg_doc','des_t_doc')
            ->where('estado_t_doc','=',1) 
            ->orderBy('cod_t_doc','desc')
            ->paginate(7);
            return $tipo_doc_reg;
        }
    }

    public function create()
    {
        //
    }

    public function store(FormTipo_doc_reg $request)
    {
        try{
            DB::beginTransaction();
            $tipo_doc_reg = new Tipo_doc_reg();
            $tipo_doc_reg->tipo_reg_doc = $request->get('tipo_reg_doc');
            $tipo_doc_reg->des_t_doc = $request->get('des_t_doc');
            $tipo_doc_reg->save();
            DB::commit();
        }catch(Exception $e){
            DB::rollBack();
        }
        return response()->json([
            'tipo_doc_reg' => $tipo_doc_reg
        ], 200, );
    }

    public function show($id)
    {
        $tipo_doc_reg = DB::table('tipo_doc_reg')
        ->select('cod_t_doc','tipo_reg_doc','des_t_doc')
        ->where('cod_t_doc','=',$id)
        ->get();

        return response()->json([
            "tipo_doc_reg" => $tipo_doc_reg
        ], 200,);
    }

    public function edit(Tipo_doc_reg $tipo_doc_reg)
    {
        //
    }

    public function update(Request $request, Tipo_doc_reg $tipo_doc_reg)
    {
        //
    }

    public function destroy(Tipo_doc_reg $tipo_doc_reg)
    {
        //
    }

}
