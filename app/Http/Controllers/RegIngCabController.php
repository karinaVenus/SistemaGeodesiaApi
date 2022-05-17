<?php

namespace App\Http\Controllers;

use App\Http\Requests\FormReg_ing_cab;
use App\Models\Reg_ing_cab;
use App\Models\Reg_ing_det;

use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
class RegIngCabController extends Controller
{
    
    public function index(Request $request)
    {
        //codregistroingreso,almacen,fechaingreso,trabajador,proveedor
        if($request){
            $query = trim($request->get('searchText'));
            $regs_ings = DB::table('reg_ing_cab as rc')
            ->join('proveedor as p','rc.cod_prov','=','p.cod_prov')
            ->join('trabajador as t','rc.cod_trabajador','=','t.cod_trabajador')
            ->join('almacen as a','rc.cod_almacen','=','a.cod_almacen')
            ->join('tipo_transf as tt','rc.cod_t_transf','=','tt.cod_t_transf')
            ->join('persona as pep','p.cod_prov','=','pep.cod_persona')
            ->join('persona as pet','t.cod_trabajador','=','pet.cod_persona')
            ->select('rc.cod_reg_in','pep.razon_social AS proveedor',DB::raw("CONCAT(pet.nom_per,' ',pet.ape_pat_per,' ',pet.ape_mat_per) AS trabajador"),'a.des_almacen','tt.des_transf','rc.fec_ing')
            ->orderBy('rc.cod_reg_in','desc')
            ->paginate(7);
            return $regs_ings;
        }
    }
  
    public function create()
    {
        //proveedor con ruc,almace, trabajador, tipo transaferencia, tipo documento, 
        //articulo con codigo, descripcion y um, estados
        $proveedor = DB::table('proveedor as p')
        ->join('persona as pep','p.cod_prov','=','pep.cod_persona')
        ->join('tdoc_ide as tdi','pep.cod_t_doc','=','tdi.cod_t_doc')
        ->select('p.cod_prov',DB::raw("CONCAT(pep.razon_social,'|',tdi.dest_doc,': ',pep.nro_doc) AS proveedor"))
        ->orderBy('p.cod_prov','asc')
        ->get();

        $almacen = DB::table('almacen')
        ->select('cod_almacen','des_almacen')
        ->orderBy('cod_almacen','asc')
        ->get();

        $trabajador = DB::table('trabajador as t')
        ->join('persona as pet','t.cod_trabajador','=','pet.cod_persona')
        ->join('tdoc_ide as tdi','pet.cod_t_doc','=','tdi.cod_t_doc')
        ->select('t.cod_trabajador',DB::raw("CONCAT(pet.nom_per,' ',pet.ape_pat_per,' ',pet.ape_mat_per,'|',tdi.dest_doc,': ',pet.nro_doc) AS trabajador"))
        ->orderBy('t.cod_trabajador','asc')
        ->get();;
       
        $tipo_transf = DB::table('tipo_transf')
        ->select('cod_t_transf','des_transf')
        ->orderBy('cod_t_transf','asc')
        ->get();

        $tipo_doc_reg = DB::table('tipo_doc_reg')
        ->select('cod_t_doc','des_t_doc')
        ->where('tipo_reg_doc','=','Ingreso')
        ->orderBy('cod_t_doc','asc')
        ->get();

        $articulo = DB::table('articulo as art')
        ->join('unid_med as um','art.cod_unid_med','=','um.cod_unid_med')
        ->select('art.cod_art',DB::raw("CONCAT(art.des_art,'um: ',um.des_unid_med) AS articulo"))
        ->orderBy('art.cod_art','asc')
        ->get();
         
        return response()->json([
            "proveedor"=>$proveedor,
            "almacen"=>$almacen,
            "trabajador"=>$trabajador,
            "tipo_transf"=>$tipo_transf,
            "tipo_doc_reg"=>$tipo_doc_reg,
            "articulo"=>$articulo
        ], 200,);


    }


    public function store(FormReg_ing_cab $request)
    {
        //return $request;//Prueba mostrando datos
        $msg ="sin error";
        try{
            DB::beginTransaction();
            $reg_ing_cab = new Reg_ing_cab();
            $reg_ing_cab->cod_prov = $request->get('cod_prov');
            $reg_ing_cab->cod_trabajador = $request->get('cod_trabajador');
            $reg_ing_cab->cod_almacen = $request->get('cod_almacen');
            $reg_ing_cab->cod_t_transf = $request->get('cod_t_transf');
            $reg_ing_cab->cod_t_doc = $request->get('cod_t_doc');
            $reg_ing_cab->nro_doc = $request->get('nro_doc');
            $reg_ing_cab->fec_doc = $request->get('fec_doc'); //2014-10-25
            $reg_ing_cab->cod_estado_reg = $request->get('cod_estado_reg');
            $reg_ing_cab->tot_pagar = $request->get('tot_pagar');
            $reg_ing_cab->save();

            $cod_art = $request->get('cod_art');
            $prec_unit = $request->get('prec_unit');
            $cant_art = $request->get('cant_art');
            $prec_compr = $request->get('prec_compr');
            $obs_ing = $request->get('obs_ing');

            $cont=0;
            while($cont < count($cod_art)){
                $reg_ing_det = new Reg_ing_det();
                $reg_ing_det->cod_reg_ing = $reg_ing_cab->cod_reg_in;

                $reg_ing_det->cod_art = $cod_art[$cont];
                $reg_ing_det->prec_unit = $prec_unit[$cont];
                $reg_ing_det->cant_art = $cant_art[$cont];
                $reg_ing_det->prec_compr = $prec_compr[$cont];
                //validar vacio observacion
                $reg_ing_det->obs_ing = $obs_ing[$cont];

                $reg_ing_det->save();

                $cont = $cont + 1;
            }

            DB::commit();

        }catch(Exception $e){
            $msg = "Error";
            DB::rollBack();
        }
        return response()->json([
            'msg' => $msg
        ]);
        
    }

    public function show($id)
    {
        $reg_ing_cab = DB::table('reg_ing_cab as rc')
        ->join('proveedor as p','rc.cod_prov','=','p.cod_prov')
        ->join('trabajador as t','rc.cod_trabajador','=','t.cod_trabajador')
        ->join('almacen as a','rc.cod_almacen','=','a.cod_almacen')
        ->join('tipo_transf as tt','rc.cod_t_transf','=','tt.cod_t_transf')
        ->join('tipo_doc_reg as td','rc.cod_t_doc','=','td.cod_t_doc')
        ->join('estado_registro as er','rc.cod_estado_reg','=','er.cod_estado_reg')
        ->join('persona as pep','p.cod_prov','=','pep.cod_persona')
        ->join('persona as pet','t.cod_trabajador','=','pet.cod_persona')
        ->select('rc.cod_reg_in','pep.razon_social AS proveedor',DB::raw("CONCAT(pet.nom_per,' ',pet.ape_pat_per,' ',pet.ape_mat_per) AS trabajador"),'a.des_almacen','tt.des_transf','td.des_t_doc','rc.nro_doc','rc.fec_doc','rc.fec_ing','er.des_estado_reg','rc.tot_pagar')
        ->where('rc.cod_reg_in','=',$id)
        ->first();

        $reg_ing_det = DB::table('reg_ing_det as rd')
        ->join('articulo as art','rd.cod_art','=','art.cod_art')
        ->join('unid_med as um','art.cod_unid_med','=','um.cod_unid_med')
        ->select('art.cod_art','art.des_art','um.des_unid_med','rd.prec_unit','rd.cant_art','rd.prec_compr','rd.obs_ing')
        ->where('rd.cod_reg_ing','=',$id)
        ->get();
        
        return response()->json([
            "cabecera" => $reg_ing_cab,
            "detalles" => $reg_ing_det
        ], 200, );
    }

    public function edit(Reg_ing_cab $reg_ing_cab)
    {
        //
    }

    public function update(Request $request, Reg_ing_cab $reg_ing_cab)
    {
        //
    }

    public function destroy($id)
    {
        
    }
}
