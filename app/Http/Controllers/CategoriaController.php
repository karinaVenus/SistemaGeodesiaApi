<?php

namespace App\Http\Controllers;

use App\Http\Requests\FormCategoria;
use App\Http\Requests\FormCategoriaUpdate;
use App\Models\Categoria;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CategoriaController extends Controller
{

    public function index(/*Request $request*/)
    {
        //
        //if($request){
            //$query = trim($request->get('searchText'));
            $categoria = DB::table('categoria')
            ->select('cod_cat','des_cat')
            //->where('des_cat','LIKE', '%' . $query . '%') //busqueda
            ->orderBy('cod_cat','desc')
            ->get()
            return $categoria;
        //}
    }


    public function create()
    {
        //
    }

    public function store(FormCategoria $request)
    {
        try{
            DB::beginTransaction();
            $categoria = new Categoria();
            $categoria->des_cat = $request->get('des_cat');
            $categoria->save();
            DB::commit();
        }catch(Exception $e){
            DB::rollBack();
        }
        return response()->json([
            'categoria' => $categoria
        ], 200, );
    }

    public function show($id)
    {
        $categoria = DB::table('categoria')
        ->select('cod_cat','des_cat')
        ->where('cod_cat','=',$id)
        ->get();

        return response()->json([
            "categoria" => $categoria
        ], 200,);
    }

    public function edit($id)
    {
        $categoria = DB::table('categoria')
        ->select('cod_cat','des_cat')
        ->where('cod_cat','=',$id)
        ->first();

        return response()->json([
            "categoria" => $categoria
        ], 200,);
    }

    public function update(FormCategoriaUpdate $request, $id)
    {
        try{
            DB::beginTransaction();
            $categoria = Categoria::find($id);
            $categoria->des_cat = $request->get('des_cat');
            $categoria->update();
            DB::commit();

            if($categoria->update()){
                $msg="Registro categoria modificado";
            }

        }catch(Exception $e){
            DB::rollBack();
        }
        return response()->json([
            'categoria' => $categoria,
            'msg'=>$msg
        ], 200, );
    }

    public function destroy(Categoria $categoria)
    {
        //
    }
}
