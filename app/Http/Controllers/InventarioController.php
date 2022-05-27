<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class InventarioController extends Controller
{

    public function index()
    {
        $almacen_precargado = DB::table('almacen')
        ->select('cod_almacen','des_almacen')
        ->orderBy('cod_almacen','asc')
        ->get();

        return response()->json([
            'almacen' => $almacen_precargado
        ], 200);
    }

    public function inventario($id){
        $inventario = DB::select('call inventario_actual(?)',array($id));
        return response()->json([
            'inventario' => $inventario
        ], 200);
    }

}
