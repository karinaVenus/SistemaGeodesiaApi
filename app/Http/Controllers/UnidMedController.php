<?php

namespace App\Http\Controllers;

use App\Http\Requests\FormUnid_Med;
use App\Http\Requests\FormUnid_MedUpdate;
use App\Models\Unid_Med;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class UnidMedController extends Controller
{

    public function index(Request $request)
    {
        if($request){
            $query = trim($request->get('searchText'));
            $unid_med = DB::table('unid_med')
            ->select('cod_unid_med','des_unid_med','prefijo_unid_med')
            ->where('des_unid_med','LIKE', '%'.$query.'%') //busqueda
            ->orderBy('cod_unid_med','desc')
            ->paginate(7);
            return $unid_med;
        }
    }

    public function create()
    {
        //
    }

    public function store(FormUnid_Med $request)
    {
        try{
            DB::beginTransaction();
            $unid_med = new Unid_med();
            $unid_med->des_unid_med = $request->get('des_unid_med');
            $unid_med->prefijo_unid_med = $request->get('prefijo_unid_med');
            $unid_med->save();
            DB::commit();
        }catch(Exception $e){
            DB::rollBack();
        }
        return response()->json([
            'unid_med' => $unid_med
        ], 200, );
    }

    public function show($id)
    {
        $unid_med = DB::table('unid_med')
        ->select('cod_unid_med','des_unid_med','prefijo_unid_med')
        ->where('cod_unid_med','=',$id)
        ->get();

        return response()->json([
            "unid_med" => $unid_med
        ], 200,);
    }

    public function edit($id)
    {
        $unid_med = Unid_med::find($id);
        return response()->json([
            "unid_med" => $unid_med
        ], 200,);
    }

    public function update(FormUnid_MedUpdate $request, $id)
    {
        try{
            DB::beginTransaction();
            $unid_med = Unid_med::find($id);
            $unid_med->des_unid_med = $request->get('des_unid_med');
            $unid_med->prefijo_unid_med = $request->get('prefijo_unid_med');
            $unid_med->update();

            if($unid_med->update()){
                $msg="Registro unidad de medida modificado";
            }
            DB::commit();

        }catch(Exception $e){
            DB::rollBack();
        }

        return response()->json([
            'unid_med' => $unid_med,
            'msg' => $msg
        ], 200, );
    }

    public function destroy(Unid_Med $unid_Med)
    {
        //
    }
}
