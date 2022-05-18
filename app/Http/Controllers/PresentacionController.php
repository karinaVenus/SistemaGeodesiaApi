<?php

namespace App\Http\Controllers;

use App\Http\Requests\FormPresentacion;
use App\Models\Presentacion;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PresentacionController extends Controller
{

    public function index(Request $request)
    {
        if($request){
            $query = trim($request->get('searchText'));
            $presentacion = DB::table('presentacion')
            ->select('cod_pres','des_pres')
            ->orderBy('cod_pres','desc')
            ->paginate(7);
            return $presentacion;
        }
    }

    public function create()
    {
        
    }

 
    public function store(FormPresentacion $request)
    {
        try{
            DB::beginTransaction();
            $presentacion = new Presentacion();
            $presentacion->des_pres = $request->get('des_pres');
            $presentacion->save();
            DB::commit();
        }catch(Exception $e){
            DB::rollBack();
        }
        return response()->json([
            'presentacion' => $presentacion
        ], 200, );
    }


    public function show($id)
    {
        $presentacion = DB::table('presentacion')
        ->select('cod_pres','des_pres')
        ->where('cod_pres','=',$id)
        ->get();

        return response()->json([
            "presentacion" => $presentacion
        ], 200,);
    }

    public function edit(Presentacion $presentacion)
    {
        //
    }


    public function update(Request $request, Presentacion $presentacion)
    {
        //
    }


    public function destroy(Presentacion $presentacion)
    {
        //
    }
}
