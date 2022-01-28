<?php

namespace App\Http\Controllers\Apis;

use App\Models\Brand;
use App\Models\Product;
use App\Http\traits\media;
use App\Models\Subcategory;
use App\Http\traits\ApiTrait;
use App\Http\Controllers\Controller;
use App\Http\Requests\StoreProductRequest;
use App\Http\Requests\UpdadateProductRequest;

class ProductController extends Controller
{
    use media,ApiTrait;
    public function index()
    {
        $products = Product::all();
        return $this->Data(compact('products'));
    }
    public function create()
    {
       $brands = Brand::all();
       $subcategories = Subcategory::select('id','name_en')->get();
       return $this->Data(compact('brands','subcategories'));
    }
    public function edit($id)
    {
    //    $product = Product::where('id',$id)->first(); //this or line 33
        $brands = Brand::all();
        $subcategories = Subcategory::select('id','name_en')->get();
        $product = Product::findOrFail($id); // faind and validate
        return $this->Data(compact('brands','subcategories','product'));
    }
    public function store(StoreProductRequest $request)
    {
        $photoName = $this->uploadPhoto($request->image,'products');
        $data = $request->except('image');
        $data['image'] = $photoName;
        // DB::table('products')->insert($data);
        Product::create($data);
        return $this->SuccessMessage("product created successfully",201);
    }
    public function update(UpdadateProductRequest $request ,$id)
    {

        $data = $request->except('image');
        if($request->has('image')){
            $oldPhotoName = Product::find($id)->image;
            $pathOfPhoto = public_path('/dist/img/products/').$oldPhotoName;
            $this->deletePhoto($pathOfPhoto);
            $photoName = $this->uploadPhoto($request->image,'products');
            $data['image'] = $photoName;
        }
        //update on database
        Product::
        where('id', $id)
        ->update($data);
        return $this->SuccessMessage('product updated successfully');
    }
    public function destroy($id)
    {
        $product = Product::find($id);
        if($product){
            //3ashan amsa7 el photo mn el database and el folder bta3etha
        $oldPhotoName = Product::find($id)->image;
        $pathOfPhoto = public_path('/dist/img/products/').$oldPhotoName;
        $this->deletePhoto($pathOfPhoto);
        Product::where('id',$id)->delete();
        return $this->SuccessMessage('product deleted successfull');
        }else{
            return $this->ErrorMessage(['id'=>'The Id Is Invalid'],'The given data was invalid.',422); // return Error message
        }
    }
}
