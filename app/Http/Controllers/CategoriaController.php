<?php

namespace App\Http\Controllers;

use App\Http\Requests\FormCategoria;
use App\Models\Categoria;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CategoriaController extends Controller
{

    public function index(Request $request)
    {
        //
        if($request){
            $query = trim($request->get('searchText'));
            $categoria = DB::table('categoria')
            ->select('cod_cat','des_cat')
            ->orderBy('cod_cat','desc')
            ->paginate(7);
            return $categoria;
        }
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

    public function edit(Categoria $categoria)
    {
        //
    }

    public function update(Request $request, Categoria $categoria)
    {
        //
    }

    public function destroy(Categoria $categoria)
    {
        //
    }
}
