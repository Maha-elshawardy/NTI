@extends('backend.layouts.parent')

@section('title', 'Edit Product')

@section('content')
    <div class="col-12">
        @include('backend.includes.message')
        <div class="col-12">
            @if ($errors->any())
                <div class="alert alert-danger">
                    <ul>
                        @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
            @endif
        </div>
        <form action="{{ route('products.update', $product->id) }}" method="post" enctype="multipart/form-data">
            @csrf
            @method('PUT')
            <div class="form-row">
                <div class="col-6">
                    <label for="name_en">Name en</label>
                    <input type="text" name="name_en" id="name_en" value="{{ $product->name_en }}" class="form-control"
                        placeholder="" aria-describedby="helpId">
                </div>
                <div class="col-6">
                    <label for="name_ar">Name ar</label>
                    <input type="text" name="name_ar" id="name_ar" value="{{ $product->name_ar }}" class="form-control"
                        placeholder="" aria-describedby="helpId">
                </div>
            </div>
            <div class="form-row">
                <div class="col-4">
                    <label for="price">Price</label>
                    <input type="number" name="price" id="price" value="{{ $product->price }}" class="form-control"
                        placeholder="" aria-describedby="helpId">
                </div>
                <div class="col-4">
                    <label for="code">Code</label>
                    <input type="number" name="code" id="code" value="{{ $product->code }}" class="form-control"
                        placeholder="" aria-describedby="helpId">
                </div>
                <div class="col-4">
                    <label for="quantity">Quantity</label>
                    <input type="text" name="quantity" id="quantity" value="{{ $product->quantity }}" class="form-control"
                        placeholder="" aria-describedby="helpId">
                </div>
            </div>
            <div class="form-row">
                <div class="col-4">
                    <label for="status">Status</label>
                    <select name="status" id="Status" class="form-control">
                        <option {{ $product->status == 1 ? 'selected' : '' }} value="1">Active</option>
                        <option {{ $product->status == 0 ? 'selected' : '' }} value="0">Not Active</option>
                    </select>
                </div>
                <div class="col-4">
                    <label for="brand">Brands</label>
                    <select name="brand_id" id="brand_id" class="form-control">
                        @foreach ($brands as $brand)
                            <option {{ $product->brand_id == $brand->id ? 'selected' : '' }} value="{{ $brand->id }}">
                                {{ $brand->name_en }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="col-4">
                    <label for="subcategories">Subcategories</label>
                    <select name="subcategory_id" id="subcategory_id" class="form-control">
                        @foreach ($subcategories as $subcategory)
                                <option {{ $product->subcategory_id == $subcategory->id ? 'selected' : '' }}
                                    value="{{ $subcategory->id }}">{{ $subcategory->name_en }}</option>
                            @endforeach
                    </select>
                </div>
            </div>
    </div>
    <div class="form-row">
        <div class="col-6">
            <label for="desc_en">Desc En</label>
            <textarea name="desc_en" id="desc_en" cols="30" rows="10"
                class="form-control">{{ $product->desc_en }}</textarea>
        </div>
        <div class="col-6">
            <label for="desc_ar">Desc Ar</label>
            <textarea name="desc_ar" id="desc_ar" cols="30" rows="10"
                class="form-control">{{ $product->desc_ar }}</textarea>
        </div>
    </div>
    <div class="form-row">
        <div class="col-6">
            <label for="image">Image</label>
            <input type="file" name="image" id="image" class="form-control">
        </div>
        <div class="col-6">
            <img src="{{ url('dist/img/products/' . $product->image) }}" alt="{{ $product->name_en }}"
                class="w-100">
        </div>
    </div>
    <div class="form-row y-3">
        <div class="col-2">
            <button type="submit" class="btn btn-warning" name='page' value="index">Update</button>
        </div>
        <div class="col-2">
            <button type="submit" class="btn btn-dark" name='page' value="back">Update & Return</button>
        </div>
    </div>

    </form>
    </div>
@endsection
