<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreProductRequest;
use App\Http\Requests\UpdadateProductRequest;
use App\Http\traits\media;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;


class ProductController extends Controller
{
    use media;
    public function index()
    {
        $products = DB::table('products')
        ->select('id', 'name_en','name_ar','price','status','quantity','code','created_at')
        ->get();

        return view('backend.products.index',compact('products'));
    }
    public function create()
    {
        $brands = DB::table('brands')->get();
        $subcategories = DB::table('subcategories')->select('id','name_en')->where('status',1)->get();
        return view('backend.products.create',compact('brands','subcategories'));
    }
    public function store(StoreProductRequest $request)
    {
        $photoName = $this->uploadPhoto($request->image,'products');
        $data = $request->except('_token','image','page');
        $data['image'] = $photoName;
        DB::table('products')->insert($data);
        return $this->redirectAccordingToRequest($request);
    }
    public function edit($id)
    {
        $brands = DB::table('brands')->get();
        $subcategories = DB::table('subcategories')->select('id','name_en')->where('status',1)->get();
        $product = DB::table('products')->where('id',$id)->first(); // بيرجعلي داتا واحدة ككائن
        return view('backend.products.edit',compact('product','brands','subcategories'));
    }
    public function destroy($id)
    {
        //3ashan amsa7 el photo mn el database and el folder bta3etha
        $oldPhotoName = DB::table('products')->select('image')->where('id',$id)->first()->image;
            $pathOfPhoto = public_path('/dist/img/products/').$oldPhotoName;
            $this->deletePhoto($pathOfPhoto);
            DB::table('products')->where('id',$id)->delete();
            return redirect()->back()->with('success','Successfull Operation');
    }
    public function update(UpdadateProductRequest $request ,$id)
    {

        $data = $request->except('_token','_method','image','page');
        if($request->has('image')){
            $oldPhotoName = DB::table('products')->select('image')->where('id',$id)->first()->image;
            $pathOfPhoto = public_path('/dist/img/products/').$oldPhotoName;
            $this->deletePhoto($pathOfPhoto);
            $photoName = $this->uploadPhoto($request->image,'products');
            $data['image'] = $photoName;
        }
        //update on database
        DB::table('products')
        ->where('id', $id)
        ->update($data);
        return $this->redirectAccordingToRequest($request);
    }
    public function redirectAccordingToRequest($request)
    {
        if($request->page == 'back'){
            return redirect()->back()->with('success','Successfull Operation');
        }
        else{
            return redirect()->route('products.index')->with('success','Successfull Operation');
        }
    }
}
