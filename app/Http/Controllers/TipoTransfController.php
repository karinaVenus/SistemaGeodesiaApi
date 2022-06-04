<?php

namespace App\Http\Controllers;

use App\Http\Requests\FormTipo_Transf;
use App\Models\Tipo_Transf;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class TipoTransfController extends Controller
{

    public function index(Request $request)
    {
        if($request){
            $query = trim($request->get('searchText'));
            $tipo_transf = DB::table('tipo_transf')
            ->select('cod_t_transf','des_transf')
            ->where('des_transf','LIKE', '%'.$query.'%') //busqueda
            ->orderBy('cod_t_transf','desc')
            ->paginate(7);
            return $tipo_transf;
        }
    }

    public function create()
    {
        //
    }

    public function store(FormTipo_Transf $request)
    {
        try{
            DB::beginTransaction();
            $tipo_transf = new Tipo_Transf();
            $tipo_transf->des_transf = $request->get('des_transf');
            $tipo_transf->save();
            DB::commit();
        }catch(Exception $e){
            DB::rollBack();
        }
        return response()->json([
            'tipo_transf' => $tipo_transf
        ], 200, );
    }

    public function show($id)
    {
        $tipo_transf = DB::table('tipo_transf')
        ->select('cod_t_transf','des_transf')
        ->where('cod_t_transf','=',$id)
        ->get();

        return response()->json([
            "tipo_transf" => $tipo_transf
        ], 200,);
    }

    public function edit(Tipo_Transf $tipo_Transf)
    {
        //
    }

    public function update(Request $request, Tipo_Transf $tipo_Transf)
    {
        //
    }

    public function destroy(Tipo_Transf $tipo_Transf)
    {
        //
    }
}
