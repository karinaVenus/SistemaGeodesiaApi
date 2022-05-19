<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('/articulos','App\Http\Controllers\ArticuloController@index');
Route::get('/articulos/create','App\Http\Controllers\ArticuloController@create');
Route::post('/articulo','App\Http\Controllers\ArticuloController@store');
Route::get('/articulo/{id}','App\Http\Controllers\ArticuloController@show');

Route::get('/registrosIngresos','App\Http\Controllers\RegIngCabController@index');
Route::get('/registrosIngresos/create','App\Http\Controllers\RegIngCabController@create');
Route::post('/registroIngreso','App\Http\Controllers\RegIngCabController@store');
Route::get('/registroIngreso/{id}','App\Http\Controllers\RegIngCabController@show');

Route::get('/presentaciones','App\Http\Controllers\PresentacionController@index');
Route::post('/presentacion','App\Http\Controllers\PresentacionController@store');//
Route::get('/presentacion/{id}','App\Http\Controllers\PresentacionController@show');

Route::get('/categorias','App\Http\Controllers\CategoriaController@index');
Route::post('/categoria','App\Http\Controllers\CategoriaController@store');
Route::get('/categoria/{id}','App\Http\Controllers\CategoriaController@show');

Route::get('/unidadesMedida','App\Http\Controllers\UnidMedController@index');
Route::post('/unidadMedida','App\Http\Controllers\UnidMedController@store');
Route::get('/unidadMedida/{id}','App\Http\Controllers\UnidMedController@show');

Route::get('/tiposTransferencias','App\Http\Controllers\TipoTransfController@index');
Route::post('/tipoTransferencia','App\Http\Controllers\TipoTransfController@store');
Route::get('/tipoTransferencia/{id}','App\Http\Controllers\TipoTransfController@show');

Route::get('/registrosSalidas','App\Http\Controllers\RegSalCabController@index');
Route::get('/registrosSalidas/create','App\Http\Controllers\RegSalCabController@create');
Route::post('/registroSalida','App\Http\Controllers\RegSalCabController@store');
Route::get('/registroSalida/{id}','App\Http\Controllers\RegSalCabController@show');