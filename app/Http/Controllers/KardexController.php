<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class KardexController extends Controller
{
    public function index(Request $request)
    {
        //URL: http://127.0.0.1:8000/api/kardex?articulo=ART01&fec_ini=2022-05-22&fec_fin=2022-05-31
        $articulos_precargado = DB::table('articulo as art')
        ->join('unid_med as um','art.cod_unid_med','=','um.cod_unid_med')
        ->select(DB::raw("art.cod_art,CONCAT(art.cod_art,' ',art.des_art,' ',um.des_unid_med) as articulo"))
        ->orderBy('art.cod_art','asc')
        ->get();

        $articulo = $request->get('articulo');
        $fec_ini = $request->get('fec_ini');
        $fec_fin = $request->get('fec_fin');
        $kardex = "";$val_net_ini = "";$cant_ini = "";  
        
        if($articulo != null && $fec_ini != null && $fec_fin != null){
            $val_net_ini = DB::select('call total_valor_lapso(?,?)',array($articulo,$fec_ini));;
            $cant_ini = DB::select('call total_cant_lapso(?,?)',array($articulo,$fec_ini));; 
            $kardex =  DB::select('call kardex_articulo(?,?,?)',array($articulo,$fec_ini,$fec_fin));
            // $kardex =  DB::select('call kardex_articulo("art01","2022-05-01","2022-05-31")');
            $msg="kardex obtenido";
        }else $msg="nada que mostrar";
        
        return response()->json([
            'msg' => $msg,
            'articulo' => $articulos_precargado,
            'cant_ini' => $cant_ini,
            'val_net_ini' => $val_net_ini,
            'Kardex'=> $kardex,
        ], 200);
    }

    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        //
    }

    public function show($id)
    {
        //
    }

    public function edit($id)
    {
        //
    }

    public function update(Request $request, $id)
    {
        //
    }

    public function destroy($id)
    {
        //
    }
}
