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
//Route::get('/departamento','App\Http\Controllers\DepartamentoController@index');  //Controlador de departamento - funcion index
Route::get('/articulos','App\Http\Controllers\ArticuloController@index');
Route::get('/articulos/create','App\Http\Controllers\ArticuloController@create');
Route::post('/articulo','App\Http\Controllers\ArticuloController@store');
Route::get('/articulo/{id}','App\Http\Controllers\ArticuloController@show');

Route::post('/registroIngreso','App\Http\Controllers\RegIngCabController@store');
Route::get('/registroIngreso/{id}','App\Http\Controllers\RegIngCabController@show');
Route::get('/registrosIngresos','App\Http\Controllers\RegIngCabController@index');
Route::get('/registrosIngresos/create','App\Http\Controllers\RegIngCabController@create');

//Route::post('/presentacion','App\Http\Controllers\PresentacionController@store');