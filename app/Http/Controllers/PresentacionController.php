<?php

namespace App\Http\Controllers;

use App\Http\Requests\FormPresentacion;
use App\Models\Presentacion;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PresentacionController extends Controller
{

    public function index()
    {
        //
    }

    public function create()
    {
        
    }

 
    public function store(FormPresentacion $request)
    {/*
        try{
            DB::beginTransaction();
            $presentacion = new Presentacion();
            $presentacion->des_pres = $request->get('des_pres');
            DB::commit();
        }catch(Exception $e){
            DB::rollBack();
        }
        return response()->json([
            'des_pres' => $presentacion
        ], 200, );*/
    }


    public function show(Presentacion $presentacion)
    {
        //
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
