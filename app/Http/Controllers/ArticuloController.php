<?php

namespace App\Http\Controllers;
//modelos
use App\Models\Articulo;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

//restricciones
use App\Http\Requests\FormArticulo;
use App\Http\Requests\FormArticuloUpdate;

use Exception;

class ArticuloController extends Controller
{

    public function index(Request $request)
    {
        if($request){
            $busqueda = trim($request->get('searchText'));
            $articulo = DB::table('articulo as art')
            ->join('categoria as cat','art.cod_cat','=','cat.cod_cat')
            ->join('presentacion as pr','art.cod_pres','=','pr.cod_pres')
            ->join('unid_med as um','art.cod_unid_med','=','um.cod_unid_med')
            ->join('estado_articulo as ea','art.cod_estado_art','=','ea.cod_estado_art')
            ->select('art.cod_art','art.des_art','cat.cod_cat','pr.cod_pres','um.cod_unid_med','art.imagen_art','ea.cod_estado_art')
            ->where('art.des_art','LIKE', '%' . $busqueda . '%')
            ->orderBy('des_art', 'desc')
            ->paginate(15);
            return $articulo;
        }
    }

    public function create()
    {
        $categoria = DB::table('categoria')
        ->select('cod_cat','des_cat')
        ->orderBy('cod_cat','asc')
        ->get();

        $presentacion = DB::table('presentacion')
        ->select('cod_pres','des_pres')
        ->orderBy('cod_pres','asc')
        ->get();

        $unid_med = DB::table('unid_med')
        ->select('cod_unid_med','des_unid_med')
        ->orderBy('cod_unid_med','asc')
        ->get();

        return response()->json([
            "categoria"=>$categoria,
            "presentacion"=>$presentacion,
            "unid_med"=>$unid_med
        ], 200,);
        
    }


    public function store(FormArticulo $request)
    {
        
        try{
            DB::beginTransaction();
            $articulo = new Articulo;
            $articulo->cod_art = $request->get('cod_art');
            $articulo->des_art = $request->get('des_art');
            $articulo->cod_cat = $request->get('cod_cat');
            $articulo->cod_pres = $request->get('cod_pres');
            $articulo->cod_unid_med = $request->get('cod_unid_med');
            $articulo->imagen_art = $request->get('imagen_art');
            $articulo->cod_estado_art = $request->get('cod_estado_art');
            $articulo->save();

            if($articulo->save()){
                $msg="Articulo registrado";
            }
            DB::commit();

        }catch(Exception $e){
            DB::rollBack();
        }

        return response()->json([
            'msg' => $msg
        ], 200, );
       
    }

    public function show($id)
    {
        $articulo = DB::table('articulo as art')
        ->join('categoria as cat','art.cod_cat','=','cat.cod_cat')
        ->join('presentacion as pr','art.cod_pres','=','pr.cod_pres')
        ->join('unid_med as um','art.cod_unid_med','=','um.cod_unid_med')
        ->select('art.des_art','cat.des_cat','pr.des_pres','um.des_unid_med','art.imagen_art')
        ->where('art.cod_art','=',$id)
        ->get();

        return response()->json([
            "articulo" => $articulo
        ], 200, );
    }

    public function edit($id)
    {   //consultar y obtener los datos referente al precarcado
        $articulo = DB::table('articulo as art')
        ->join('categoria as cat','art.cod_cat','=','cat.cod_cat')
        ->join('presentacion as pr','art.cod_pres','=','pr.cod_pres')
        ->join('unid_med as um','art.cod_unid_med','=','um.cod_unid_med')
        ->select('art.cod_art','art.des_art','cat.des_cat','pr.des_pres','um.des_unid_med','art.imagen_art')
        ->where('art.cod_art','=',$id)
        ->first();
        
        return response()->json([
            "articulo" => $articulo
        ], 200,);
    }

    public function update(FormArticuloUpdate $request, $id)
    {   // METODO PUT -> http://127.0.0.1:8000/api/articuloUpdate/ART011
        $des_art = $request->get('des_art');
        $cod_cat = $request->get('cod_cat');
        $cod_pres = $request->get('cod_pres');
        $cod_unid_med = $request->get('cod_unid_med');
        $imagen_art = $request->get('imagen_art');

        $articulo = DB::table('articulo')
        ->where('cod_art','=',$id)
        ->limit(1)
        ->update(['des_art' => $des_art,'cod_cat' => $cod_cat,'cod_pres' => $cod_pres,'cod_unid_med' => $cod_unid_med,'imagen_art' => $imagen_art,]);

        return response()->json([
            //"msg" => 
        ], 200 );
    }

    public function destroy($id)
    {
        
    }
}
