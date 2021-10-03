package com.sulake.core.assets
{
   import flash.display.DisplayObject;
   
   public class DisplayAsset implements IAsset
   {
       
      
      protected var var_149:DisplayObject;
      
      protected var _disposed:Boolean = false;
      
      protected var var_906:String;
      
      protected var var_739:AssetTypeDeclaration;
      
      public function DisplayAsset(param1:AssetTypeDeclaration, param2:String = null)
      {
         super();
         this.var_739 = param1;
         this.var_906 = param2;
      }
      
      public function get declaration() : AssetTypeDeclaration
      {
         return this.var_739;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function setParamsDesc(param1:XMLList) : void
      {
      }
      
      public function setFromOtherAsset(param1:IAsset) : void
      {
         if(param1 is DisplayAsset)
         {
            this.var_149 = DisplayAsset(param1).var_149;
            this.var_739 = DisplayAsset(param1).var_739;
            return;
         }
         throw new Error("Provided asset should be of type DisplayAsset!");
      }
      
      public function get url() : String
      {
         return this.var_906;
      }
      
      public function setUnknownContent(param1:Object) : void
      {
         if(param1 is DisplayObject)
         {
            this.var_149 = param1 as DisplayObject;
            if(this.var_149 != null)
            {
               return;
            }
            throw new Error("Failed to convert DisplayObject to DisplayAsset!");
         }
         if(param1 is DisplayAsset)
         {
            this.var_149 = DisplayAsset(param1).var_149;
            this.var_739 = DisplayAsset(param1).var_739;
            if(this.var_149 == null)
            {
               throw new Error("Failed to read content from DisplayAsset!");
            }
         }
      }
      
      public function get content() : Object
      {
         return this.var_149;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            if(this.var_149.loaderInfo != null)
            {
               if(this.var_149.loaderInfo.loader != null)
               {
                  this.var_149.loaderInfo.loader.unload();
               }
            }
            this.var_149 = null;
            this.var_739 = null;
            this._disposed = true;
            this.var_906 = null;
         }
      }
   }
}
