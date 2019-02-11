<?php

namespace App\Http\Controllers;

use App\Container;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ContainerController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $dir = '/containersData';
        header('Access-Control-Allow-Origin: *');
        $cons = array();
        Container::truncate();
        foreach (scandir($dir) as $row) {
            $subdir = $dir . '/' . $row;
            if (is_dir($subdir)) {
                $file = $subdir . '/config.v2.json';
                if (is_file($file)) {
                    $cons[] = json_decode(file_get_contents($file));
                    $con = json_decode(file_get_contents($file));
                    if(filter_var(    \GuzzleHttp\json_encode($con->State->Running), FILTER_VALIDATE_BOOLEAN)){
                        $container=new Container();
                        $container->name=\GuzzleHttp\json_encode($con->Name);
                        if(!empty(\GuzzleHttp\json_encode($con->NetworkSettings->Ports))){
                        $container->port=\GuzzleHttp\json_encode($con->NetworkSettings->Ports);
                        }
                        if(!empty(\GuzzleHttp\json_encode($con->Config->Volumes))){

                        $container->volume=\GuzzleHttp\json_encode($con->Config->Volumes);
                        }
                        $container->save();
                    }
                }
            }
        }

        return Container::all();
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        header('Access-Control-Allow-Origin: *');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        header('Access-Control-Allow-Origin: *');
        $rules = array(
            'name' => 'required',
            'port' => 'required|numeric',
        );
        $validator = Validator::make($request->all(), $rules);

        // process the login
        if ($validator->fails()) {
            return response('failed', 500)
                ->header('Content-Type', 'text/plain');
        } else {
            // store
            $container = new Container();
            $container->name = $request->get('name');
            $container->port = $request->get('port');
            $container->save();
            return response('success', 200)
                ->header('Content-Type', 'text/plain');
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Container $container
     * @return \Illuminate\Http\Response
     */
    public function show(Container $container)
    {
        //
        dd('test');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Container $container
     * @return \Illuminate\Http\Response
     */
    public function edit(Container $container)
    {
        header('Access-Control-Allow-Origin: *');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  \App\Container $container
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Container $container)
    {
        header('Access-Control-Allow-Origin: *');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Container $container
     * @return \Illuminate\Http\Response
     */
    public function destroy(Container $container)
    {

        header('Access-Control-Allow-Origin: *');
    }
}
